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
      WebView.navigate(url_for(:action => :index )) 
    end  
  end
  
  def set_properties
    # TODO: pending further testing when a beta newer than 11 is available - apparently not implemented yet
    
    # Change fullscreen from true (default) to false           
    Rho::Signature.fullScreen = false;
    # Change background color from white (default) to black
    Rho::Signature.bgColor = "#000000"
    # Change pen color from blue (default) to white
    Rho::Signature.penColor = "#FFFFFF"
      
    redirect :index  
  end
  
  def capture_inline
    Rho::Signature.show({:fullScreen => false})
    render :action => :show_signature
  end

  def do_capture          
    Signature.capture(url_for( :action => :signature_callback))    
  end
  
  def clear_capture          
    Signature.clear()    
  end
  
end
