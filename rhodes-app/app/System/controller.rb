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
  	@is_motorola_device = Rho::System.isMotorolaDevice
  	@has_calendar = Rho::System.hasCalendar
  	@has_camera = Rho::System.hasCamera
    @has_cell_network = Rho::System.hasCellNetwork
    @has_wifi_network = Rho::System.hasWifiNetwork
    @has_network = Rho::System.hasNetwork
    @has_sqlite = Rho::System.hasSqlite
    @has_touchscreen = Rho::System.hasTouchscreen
    
   
  end

  def install_apk
    #install an application from given url
    Rho::System.applicationInstall("http://rhodes-server-log.herokuapp.com/simple_app_signed.apk")
    Rho::Notification.showPopup("Simpleapp-rhodes is ready to install")
    redirect :action => :confirm_install_app
  end

  def uninstall_app
    # uninstall the application
    Rho::System.applicationUninstall("com.rhomobile.rhodesapp")
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

  def zip_files
    destination_zip = Rho::RhoFile.join(Rho::Application.userFolder, "public.zip")
  	Rho::System.zipFiles(destination_zip, Rho::Application.publicFolder, ["css", "images"])
  	Alert.show_popup("Public folder zipped in #{destination_zip}")
  	redirect :action => :confirm_zip
  end
  
  def get_version
     @version_info = Rho::System.osVersion
  #   Alert.show_popup(version_info)
   end
   
  def get_local_serverport
      # Get port of the local (embedded) HTTP server
      @local_port = Rho::System.localServerPort()
      #Alert.show_popup(local_port)
  end
  
  def confirm_zip
    render
  end
end
