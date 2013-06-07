require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class NativeToolbarController < Rho::RhoController
  include BrowserHelper
  
  def toolbar_menu
    render
  end
  
  
  def create_toolbar
    Rho::NativeToolbar.create([{
      :label => "Home",
      :action => Rho::Application.startURI
      },
      {
      :label => "Show alert",
      :action => "callback:#{url_for(:action => :show_alert)}"
      },
      {
      :label => "Remove",
      :action => "callback:#{url_for(:action => :remove_toolbar)}"
      }
    ], {})
    
    render :action => :toolbar_menu
  end

  def show_alert
    Alert.show_popup("This alert was invoked from a NativeToolbar button")
  end
  
  def remove_toolbar
    Rho::NativeToolbar.remove
    Rh::Webview.navigate(url_for(:action => :toolbar_menu))
  end
end