require 'rho/rhocontroller'
require 'helpers/browser_helper'

class ModelWebviewController < Rho::RhoController
  include BrowserHelper
  @layout = 'ModelWebview/layout'

  # GET /ModelWebview
  def index
    @modelwebviews = ModelWebview.find(:all)
    render :back => '/app'
  end

  def setAcceptLanguage
    puts "#{@params}"
    languageCode = @params['value']
    Rho::WebView.acceptLanguage = languageCode
  end
  
  def getAcceptLanguage
    data = Rho::WebView.acceptLanguage
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('acceptLanguage',#{data})")
  end
  
  def getActiveTab
    data = Rho::WebView.activeTab
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('activeTab',#{data})")
  end
  
  def getCacheSize
    data = Rho::WebView.cacheSize
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('cacheSize',#{data})")
  end
  
  def setEnableCache
    puts "#{@params}"
    cacheValue = @params['value']
    if cacheValue == 'true'
      Rho::WebView.enableCache = true
    end
    if cacheValue == 'false'
      Rho::WebView.enableCache = true
    end

  end
  
  def getEnableCache
    data = Rho::WebView.enableCache
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('enableCache',#{data})")
  end
  
  def setEnablePageLoadingIndication
    puts "#{@params}"
    pageLoadingIndication = @params['value']
    Rho::WebView.enablePageLoadingIndication = pageLoadingIndication
  end
  
  def getEnablePageLoadingIndication
    data = Rho::WebView.enablePageLoadingIndication
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('enablePageLoadingIndication',#{data})")
  end
  
  def setEnableWebPlugins
    puts "#{@params}"
    webPlugins = @params['value']
    Rho::WebView.enableWebPlugins = webPlugins
  end
  
  def getEnableWebPlugins
    data = Rho::WebView.enableWebPlugins
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('enableWebPlugins',#{data})")
  end
  
  def setEnableZoom
    puts "#{@params}"
    zoom = @params['value']
    Rho::WebView.enableZoom = zoom
  end
  
  def getEnableZoom
    data = Rho::WebView.enableZoom
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('enableZoom',#{data})")
  end
  
  def getFontFamily
    data = Rho::WebView.fontFamily
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('fontFamily',#{data})")
  end
  
  def getFramework
    data = Rho::WebView.framework
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('framework',#{data})")
  end

  def setFullScreen
    puts "#{@params}"
    fullscreen = @params['value']
    Rho::WebView.fullScreen = fullscreen
  end
  
  def getFullScreen
    data = Rho::WebView.fullScreen
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('fullScreen',#{data})")
  end
  
  def getScrollTechnique
    data = Rho::WebView.scrollTechnique
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('scrollTechnique',#{data})")
  end
  
  def getUserAgent
    data = Rho::WebView.userAgent
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('userAgent',#{data})")
  end
  
  def getViewportEnabled
    data = Rho::WebView.viewportEnabled
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('viewportEnabled',#{data})")
  end
  
  def getViewportWidth
    data = Rho::WebView.viewportWidth
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('viewportWidth',#{data})")
  end
  
  def setZoomPage
    puts "#{@params}"
    pagezoom = @params['value']
    Rho::WebView.zoomPage = pagezoom
  end
  
  def getZoomPage
    data = Rho::WebView.zoomPage
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('zoomPage',#{data})")
  end
  
  def setTextZoomLevel
    puts "#{@params}"
    textzoom = @params['value']
    Rho::WebView.textZoomLevel = textzoom
  end
  
  def getTextZoomLevel
    data = Rho::WebView.textZoomLevel
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('textZoomLevel',#{data})")
  end
  
  def setNavigationTimeout
    puts "#{@params}"
    timeout = @params['value']
    Rho::WebView.navigationTimeout = timeout
  end
  
  def getNavigationTimeout
    data = Rho::WebView.navigationTimeout
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('navigationTimeout',#{data})")
  end
  
  def getCurrentLocation
    puts "#{@params}"
    index = @params['value']
    data = Rho::WebView.currentLocation index
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('currentLocation',#{data})")
  end
  
  def getCurrentURL
    puts "#{@params}"
    index = @params['value']
    data = Rho::WebView.currentURL index
    puts "#{data}"
    Rho::WebView.executeJavascript("updateDiv('currentURL',#{data})")
  end

  def executeJS_zero
    Rho::WebView.executeJavascript("displayAlert('two,arguments')")
  end
  
  def executeJS_one
    Rho::WebView.executeJavascript("displayAlert1('two,arguments')",1)
  end
  
  def executeJS_minusone
    Rho::WebView.executeJavascript("displayAlert2('two,arguments')",-1)
  end
  
  def executeJS
    Rho::WebView.executeJavascript("displayAlert2()")
  end
  
  def navigate_tab
    data = Rho::WebView.currentLocation 2
    Rho::WebView.navigate data
  end
  
  def navigate_online_tab1
    Rho::WebView.navigate "http://www.google.com", 1
  end
  
  def navigate_online_tab4_secure
    Rho::WebView.navigate "https://www.gmail.com", 4
  end
  
  def navigate_localpage
    Rho::WebView.navigate "/app/loading.html", 1
  end
  
  def navigate_localpage_indexminus
    Rho::WebView.navigate "/app/loading.html", -1
  end
  
  def navigate_back
    Rho::WebView.navigateBack
  end
  
  def navigate_back_one
    Rho::WebView.navigateBack 1
  end
  
  def navigate_back_zero
    Rho::WebView.navigateBack 0
  end
  
  def navigate_back_minus
    Rho::WebView.navigateBack -1
  end

  def refresh_page
    Rho::WebView.refresh
  end
  
  def refresh_page_one
    Rho::WebView.refresh 1
  end
  
  def refresh_page_minus
    Rho::WebView.refresh -1
  end
  
  def refresh_page_zero
    Rho::WebView.refresh 0
  end
  
  def screencapture
    Rho::WebView.save "jpeg", Rho::RhoApplication::get_blob_folder
  end
  
  def screencapture_one
    Rho::WebView.save "jpeg", Rho::RhoApplication::get_blob_folder, 1
  end
  
  def screencapture_four
    Rho::WebView.save "jpeg", Rho::RhoApplication::get_blob_folder, 4
  end
  
  def screencapture_negative
    Rho::WebView.save
  end
  
  def test_div
    Rho::WebView.executeJavascript("updateDiv('currentURL','Hello Bhakta')")
  end
  
end
