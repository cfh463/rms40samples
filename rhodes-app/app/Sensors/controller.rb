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
    $accelerometer_sensor = Rho::Sensor.makeSensorByType(Rho::Sensor::SENSOR_TYPE_ACCELEROMETER)
    if $accelerometer_sensor != nil
      $accelerometer_sensor.minimumGap = 1000
      $accelerometer_sensor.start(url_for(:action => :accelerometer_callback))
    else
      Rho::Notification.showPopup({
        :message => "Device has not Accelerometer sensor",
        :buttons => ["OK"]
      })
    end  
    render :accelerometer_test
  end
  
  def stop_accelerometer_test
    if $accelerometer_sensor != nil
      $accelerometer_sensor.stop
    end
    render :accelerometer_test
  end
end
