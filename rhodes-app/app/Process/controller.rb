require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class ProcessController < Rho::RhoController
  include BrowserHelper

  # GET /Process
  def index

  end

  def run_app(blocking)
    app_name = nil
    params = nil
    case Rho::System.platform
    when "WINDOWS"
      app_name = "iexplore"
    when "ANDROID"
      app_name = "com.android.browser"
      params = "https://launchpad.motorolasolutions.com"
    when "APPLE"
      app_name = "itms://"
    else
      
    end
    
    Rho::Process.runApplication(app_name,params,blocking)    
  end
  
  def run_blocking
    run_app(true)
  	render :action => :index
  end
  
  def run_nonblocking
    run_app(false)
    render :action => :index
  end
end
