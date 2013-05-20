require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class WebviewController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def set_properties
    Rho::WebView.acceptLanguage = Rho::WebView.acceptLanguage == "en-US" ? "de" : "en-US"
    Rho::WebView.fullScreen = !Rho::WebView.fullScreen
    @acceptLanguage = @request["headers"]["Accept-Language"]
    @fullScreen = Rho::WebView.fullScreen ? "Yes" : "No"
    @currentURL = Rho::WebView.currentURL
    @currentLocation = Rho::WebView.currentLocation
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
  
  def call_js
    #call javascript alert on the current page
    Rho::WebView.executeJavascript("alert('This is Webview.executejavascript function');")
  end
  
  def go_back
     #Force WebView to navigate to the previous page using Browser back.
      Rho::WebView.navigateBack
  end
  
  def navigate
    #Force WebView to navigate to a URL.
    Rho::WebView.navigate(url_for(:action => :showrequest))
  end
  
  def refresh
    # call to refresh the current page.
    Rho::WebView.refresh()
  end
  
  def save
    # saves the current page
    # currently not working. Have to check why?
   # Rho::WebView.save('jpeg','/app')
  end
end
