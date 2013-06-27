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
  end

end
