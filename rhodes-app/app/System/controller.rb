require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class SystemController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  
  def capabilities 
  	# Returns true if device supports Motorola device capabilities, such as Scanner, etc.
  	is_motorola_device = Rho::System.isMotorolaDevice
  	
  	has_calendar = Rho::System.hasCalendar
  	has_camera = Rho::System.hasCamera
    has_cell_network = Rho::System.hasCellNetwork
    has_wifi_network = Rho::System.hasWifiNetwork
    has_network = Rho::System.hasNetwork
    has_sqlite = Rho::System.hasSqlite
    has_touchscreen = Rho::System.hasTouchscreen

    message = "
    Motorola device: #{is_motorola_device}
    Calendar: #{has_calendar}
    Camera: #{has_camera}
    Cell network: #{has_cell_network}
    WiFi: #{has_wifi_network}
    Network: #{has_network}
    SQLite: #{has_sqlite}
    Touchscreen: #{has_touchscreen}"

    Alert.show_popup(message)
    redirect :index
  end

  def install_or_uninstall_app
     #install an application from given url
  	Rho::System.applicationInstall("/bin/target/android/rhodes-app-debug.apk")

  	# uninstall the application
		Rho::System.applicationUninstall("rhodes-app")
  end

  def get_version_info
  	version_info = Rho::System.osVersion
  	Alert.show_popup(version_info)
  end

  def local_serverport
  	# Get port of the local (embedded) HTTP server
  	local_port = Rho::System.localServerPort()
  	Alert.show_popup(local_port)
  end

  def zip
  	# unzip a file 
  	Rho::System.unzipFile("/app/public/sample.zip")

  	# zip a file
  	Rho::System.zipFile("/app/public", "/app/public/sample.txt")
  end
end
