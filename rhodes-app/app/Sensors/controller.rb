require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class SensorsController < Rho::RhoController
  include BrowserHelper
  
  def accelerometer_test
    render
  end
  
  def accelerometer_callback
    @accelerometer_x = @params['x']
    @accelerometer_y = @params['y']
    @accelerometer_z = @params['z']
    Rho::WebView.refresh
  end
  
  def start_accelerometer_test
    Rho::Sensors.watchAccelerometer(200, url_for(:action => accelerometer_callback))
    render :accelerometer_test
  end
  
  def stop_accelerometer_test
    Rho::Sensors.stopAccelerometer
    render :accelerometer_test
  end
end