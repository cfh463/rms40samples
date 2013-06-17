require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class KeycaptureController < Rho::RhoController
  include BrowserHelper

  def index
    render
  end

  def keycapture_callback(params)
    Alert.show_popup("Received card reader data: #{@params["keyValue"]}")
  end

  def start_keycapture
    Rho::KeyCapture.captureKey(false,"ALL", url_for(:action => :keycapture_callback))
  end
  
  def stop_keycapture
    Rho::KeyCapture.captureKey(false,"ALL", nil)
  end
end
