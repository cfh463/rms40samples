require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class CameraController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def take_picture_with_default_camera
    # Capture an image from the default camera on the device, using the default image settings
    Rho::Camera.takePicture({}, url_for(:action => :picture_taken_callback))
  end
  
  def picture_taken_callback
    # Did we really take a picture?
    if (@params["status"]=="ok")
      # If so, show it
      Rho::WebView.navigate(url_for(:action => :show_picture, :query => {:image => Rho::Application.expandDatabaseBlobFilePath(@params["imageUri"])}))
    else
      # Otherwise we are done here
      Rho::WebView.navigate(url_for(:action => :index))
    end
  end
  
  def show_picture
    @image = @params["image"]
    render
  end
  
  def choose_camera
    $cameras = Rho::Camera.enumerate
    render
  end
  
  def take_picture_using_chosen_camera
    camera = $cameras[@params["cameraIndex"].to_i]
    camera.takePicture({}, url_for(:action => :picture_taken_callback))
  end
  
  def determine_camera_capabilities
    # Get all camera properties
    @properties = Rho::Camera.getAllProperties
    render
  end

  def sample_control_image_properties
    # Instead of accepting the defaults, let's set some properties to our liking
    
    # We will ask for a PNG file...
    Rho::Camera.compressionFormat = "png"
    
    # ...a particular image size...
    Rho::Camera.desiredWidth = 1024
    Rho::Camera.desiredHeight = 768
    
    # ...and force the flash to be used
    Rho::Camera.flashMode = "on"
    
    # Now, take the picture
    Rho::Camera.takePicture({}, url_for(:action => :picture_taken_callback))    
  end
  
  def edit_image_properties
    @valid_sizes = Rho::Camera.supportedSizeList
    Rho::Log.info(@valid_sizes.inspect,"VALID SIZES")
  end
  
  def set_image_properties
    Rho::Camera.compressionFormat = @params[:compressionFormat]
    Rho::Camera.desiredWidth = @params[:desiredWidth]
    Rho::Camera.desiredHeight = @params[:desiredHeight]
      
    Rho::Camera.takePicture({}, url_for(:action => :picture_taken_callback))      
  end
  
  def select_picture_from_gallery 
    Rho::Camera.choosePicture({}, url_for(:action => :picture_taken_callback))
  end
  
  def take_picture_and_save_it_to_gallery
    Rho::Camera.choosePicture({}, url_for(:action => :picture_taken_callback_save_to_gallery))    
  end
  
  def picture_taken_callback_save_to_gallery
    # Did we really take a picture?
    if (@params["status"]=="ok")
      # If so, save it to the gallery
      Rho::Camera.saveImageToDeviceGallery(Rho::Application.expandDatabaseBlobFilePath(@params["imageUri"]))
    end

    Rho::WebView.navigate(url_for(:action => :index))
    
  end  
end
