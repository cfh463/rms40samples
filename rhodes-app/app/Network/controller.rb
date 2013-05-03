require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class NetworkController < Rho::RhoController
 include BrowserHelper

  def index
		render
  end

  def network_availability
  	#shows the network availability
  	@cell_newtwork = Rho::Network.hasCellNetwork()
  	@network = Rho::Network.hasNetwork()
  	@wifi_network = Rho::Network.hasWifiNetwork()
  end

  def network_events

  end


  def detect_connection
  	Alert.show_popup "Detect connection host motorolasolutions.com"
  	puts "detect_connection---------------"
  	networkProps = Hash.new
  	networkProps['host'] = 'www.motorolasolutions.com'
  	networkProps['port'] = '80'
  	networkProps['pollInterval'] = 5000
  	networkProps['detectionTimeout'] = 1000 
  	Rho::Network.detectConnection(networkProps, url_for(:action => :connectionEventCallback))  	
  end

  def connectionEventCallback
  	puts "Detect connection callback event #{@params}---------------"
  	if @params['connectionInformation'] == 'Disconnected'
  		Alert.show_popup "Connection Lost"
  	else
  		Alert.show_popup "Connection Restored"
  	end
  end

  def start_status_notify
    # Request the system to check every 3 seconds and call us back if there is a change in network connectivity
  	Rho::Network.startStatusNotify(3000, url_for(:action => :status_notify_callback))
    Alert.show_popup "Started network status notifications"
    redirect :index
  end

  # This is our notification that the status of the network changed. old_status and new_status can be "disconnected" or "connected"
  def status_notify_callback
  	Alert.show_popup("Network status changed from #{@params["prev_status"]} to #{@params["current_status"]}")
  end


  def stop_status_notify
    # Stop network status notifications
  	Rho::Network.stopStatusNotify
    Alert.show_popup "Stopped network status notifications"
  end

  def upload_file
    # Upload the specified file using HTTP POST.
    uploadfileProps = Hash.new
    uploadfileProps["url"] = "http://www.example.com"
    uploadfileProps["filename"] = Rho::Application.publicFolder+"/images/backButton.png"
    uploadfileProps["body"] = "uploading file"
    uploadfileProps["fileContentType"]="image/png"
    Rho::Network.uploadFile(uploadfileProps, url_for(:action => :upload_file_callback))
  end

  def upload_file_callback
  	if @params["status"] == "ok"
  		Alert.show_popup "Upload Succeeded."
  	else
  		Alert.show_popup "Upload Failed."
  	end
  end

  def download_file
    # Download a file to the specified filename. Be careful with the overwriteFile parameter!
    downloadfileProps = Hash.new
    downloadfileProps["url"]='http://www.google.com/images/icons/product/chrome-48.png'
    downloadfileProps["filename"] = Rho::Application.publicFolder+"/images/sample.png"
    downloadfileProps["overwriteFile"] = true
    Rho::Network.downloadFile(downloadfileProps, url_for(:action => :download_file_callback))
  end
  
  def download_file_callback
  	if @params["status"] == "ok"
  		Alert.show_popup "Download Success,path is /public/images/sample.png "
  	else
  		Alert.show_popup "Download Failed"
  	end
  end



end
