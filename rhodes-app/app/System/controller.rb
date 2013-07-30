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

  def install_app
    #install an android application from given url
    Rho::System.applicationInstall(get_install_app_url)
    Rho::Notification.showPopup("Application is ready to install")
    redirect :action => :confirm_install_app
  end

  def uninstall_app
    # uninstall the application
    Rho::System.applicationUninstall(get_uninstall_app_name)
  end
 
  def get_install_app_url
    if Rho::System.platform == "ANDROID"
      return "http://rhodes-server-log.herokuapp.com/simple_app_signed.apk"
    elsif Rho::System.platform == "WINDOWS"
      return "http://rhodes-server-log.herokuapp.com/simple_app.cab"
    else 
      return ""
    end
  end 

  def get_uninstall_app_name
    if Rho::System.platform == "ANDROID"
      return "com.rhomobile.rhodesapp"
    elsif Rho::System.platform == "WINDOWS"
      return "rhomobile rhodes-app/rhodes-app.exe"
    else 
      return "rhomobile/rhodes-app/rhodes-app.exe"
    end
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
