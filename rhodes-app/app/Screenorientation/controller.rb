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
end