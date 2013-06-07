require 'rho/rhocontroller'

class SignatureController < Rho::RhoController
 
  def index
    render  
  end

  def capture_fullscreen
    # Invoke signature capture screen and assign callback
    Rho::Signature.takeFullScreen({}, url_for(:action => :signature_callback))
      
    render :action => :show_signature
  end

  def signature_callback
    # If status is not 'ok', the capture was cancelled
    if @params['status'] == 'ok'
    
      # By default, the output format is "image", so the imageUri parameter will contain the relative filename of an image
      # We must convert that relative filename to an absolute path in order to access the file
      signature = Rho::Application.expandDatabaseBlobFilePath(@params["imageUri"])

      # In our example, we will display the signature as soon as it is captured.
      # We have a javascript function in our page to set the src attribute of an img element and we will call it now
      # 
      WebView.executeJavascript("updateSignature('#{signature}')")
    else
      # if we did not really capture a signature, there is nothing else to do here
      WebView.navigateBack
    end  
  end
  
  def set_properties           
    # Change background color from white (default) to black
    # Change pen color from blue (default) to white
    Rho::Signature.takeFullScreen(@params, url_for(:action => :signature_callback))
    render :action => :show_signature  
  end
  
  def edit_properties
  end
  
  def capture_inline
    Rho::Signature.show({
      :top => 0,
      :left => 0,
      :width => 320,
      :height => Rho::System.screenHeight / 3,
      :fullScreen => false,
    })
    
#    render :action => :show_signature
  end

  def capture_as_datauri
    # Ask for a DataURI repesentation of the image instead of a file
    Rho::Signature.takeFullScreen({:outputFormat => "dataUri"}, url_for(:action => :signature_callback))
          
    render :action => :show_signature
  end
  
  def do_capture          
    Signature.capture(url_for( :action => :signature_callback))    
  end
  
  def clear_capture          
    Signature.clear()    
  end
  
end
