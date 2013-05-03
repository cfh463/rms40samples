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
  	Alert.show_popup "Started network status notifications"
  	Rho::Network.startStatusNotify(3000, url_for(:action => :start_status_notify_callabck))
  end

  def start_status_notify_callabck
  	puts @params
  	Alert.show_popup("Status notify callabck")
  end


  def stop_status_notify
  	Alert.show_popup "Stopped network status notifications"
  	Rho::Network.stopStatusNotify
  end

  def upload_file
    #Upload the specified file using HTTP POST.
    server = 'http://rhologs.heroku.com'
    uploadfileProps = Hash.new
    uploadfileProps['url'] = server + "/clwqient_log?client_id=&device_pin=&log_name=uptest"
    uploadfileProps['filename'] = Rho::RhoApplication::get_base_app_path.to_s+"/public/images/backButton.png"
    uploadfileProps['body'] = "uploading file"
    uploadfileProps['fileContentType']="application/json"
    Rho::Network.uploadFile(uploadfileProps, url_for(:action => :upload_file_callback))
end

def upload_file_callback
	puts "upload_file_callback method #{@params}------"
	if @params['status'] == "ok"
		Alert.show_popup "Upload Success."
	else
		Alert.show_popup "Upload Failed."
	end
end

def download_file
    #Download a file to the specified filename.
    downloadfileProps = Hash.new
    downloadfileProps['url']='http://www.google.com/images/icons/product/chrome-48.png'
    downloadfileProps['filename'] = File.join(Rho::RhoApplication::get_base_app_path.to_s + "/public/images/sample.png")
    downloadfileProps['overwriteFile'] = true
    Rho::Network.downloadFile(downloadfileProps, url_for(:action => :download_file_callback))
end

def download_file_callback
	puts "download_file_callback method #{@params}------"
	if @params['status'] == "ok"
		Alert.show_popup "Download Success,path is /public/images/sample.png "
	else
		Alert.show_popup "Download Failed"
	end
end



end
