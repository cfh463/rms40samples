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
  	puts "detect_connection---------------"
  	networkProps = Hash.new
  	networkProps['host'] = 'www.motorolasolutions.com'
  	networkProps['port'] = '80'
  	networkProps['pollInterval'] = 5000
  	networkProps['detectionTimeout'] = 1000 
  	Rho::Network.detectConnection(networkProps, url_for(:action => :connectionEventCallback))  	
  end

  def connectionEventCallback
  	Alert.show_popup("callback event")
  	puts "ConnectionEvent Called #{@params}"
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
  	Alert.show_popup("Network available")
  end


  def stop_status_notify
  	Alert.show_popup "Stopped network status notifications"
  	Rho::Network.stopStatusNotify
  end

end
