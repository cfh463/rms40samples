require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class ScreenorientationController < Rho::RhoController
  include BrowserHelper
  
  def auto_rotate
    Rho::ScreenOrientation.autoRotate=true
    @is_auto_rotated = Rho::ScreenOrientation.autoRotate
  end
  
  def set_callback
    render
  end
  
  def trigger_callback
    Rho::ScreenOrientation.upsideDown
    ScreenOrientation.setScreenOrientationEvent(url_for(:action => :orientation_callback))
  end
  
  def orientation_callback
    Alert.show_popup("Screen changed orientation")
  end
  
  def left_handed_position
    Rho::ScreenOrientation.leftHanded
  end
  
  def right_handed_position
    Rho::ScreenOrientation.rightHanded
  end
  
  def upside_down_position
    Rho::ScreenOrientation.upsideDown
  end
  
  def normal_position
    Rho::ScreenOrientation.normal
  end
end