require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class WebviewController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def setproperties
    Rho::WebView.acceptLanguage = Rho::WebView.acceptLanguage == "en-US" ? "de" : "en-US"
    Rho::WebView.fullScreen = !Rho::WebView.fullScreen
     
    redirect(url_for(:action => :showrequest))
  end
  
  def showrequest
    @acceptLanguage = @request["headers"]["Accept-Language"]
    @fullScreen = Rho::WebView.fullScreen ? "Yes" : "No"
    @currentURL = Rho::WebView.currentURL
    @currentLocation = Rho::WebView.currentLocation
    render :action => :showrequest
  end
end
