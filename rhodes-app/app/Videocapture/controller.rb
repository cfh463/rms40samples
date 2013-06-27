require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class VideocaptureController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def capture_video
    Rho::Videocapture.fileName = '/RhoVideoCapture'
    Rho::Videocapture.duration = 10000
    Rho::Videocapture.start(url_for(:action => :mysaveevent))
  end

  def mysaveevent
    puts "Save params: #{@params}"
    puts "Result is #{@params['transferResult']}"
    puts "Name is #{@params['fileName']}"       
    puts "Size is #{@params['size']}" 
    render :action => :index
  end
  
  def capture_video_with_resolution
    Rho::Videocapture.fileName = '/RhoVideoCapture'
    Rho::Videocapture.resolution = @params['resolution']
    Rho::Videocapture.duration = 10000
    Rho::Videocapture.start(url_for(:action => :resolution_callback))
  end

  def resolution_callback
    render :action => :select_resolution
  end
end
