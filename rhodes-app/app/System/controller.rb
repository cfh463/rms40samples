require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class SystemController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  
  def is_motorola_device 
  	# Gives true if device supports Motorola device capabilities, such as Scanner, etc.
  	is_device_supported = Rho::System.isMotorolaDevice
  	Alert.show_popup(is_device_supported)
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
  	# Gives Port of the local (embedded) HTTP server
  	local_port = Rho::System.localServerPort()
  	Alert.show_popup(local_port)
  end

  def zip
  	# unzip the file 
  	Rho::System.unzipFile("/app/public/sample.zip")

  	# zip file
  		Rho::System.zipFile("/app/public", "/app/public/sample.txt")
  end
end
