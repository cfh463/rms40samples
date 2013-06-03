require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class NativeTabbarController < Rho::RhoController
  include BrowserHelper
  
  def tabbar_menu
    render
  end
  
  def create_tabbar
    Rho::NativeTabbar.create([{
      :label => "Home",
      :action => url_for(Rho::Application.startURI)
      },
      {
      :label => "Tabbar",
      :action => url_for(:action => :tabbar_menu),
      },
      {
      :label => "example.com",
      :action => "http://www.example.com",
      },      
      {
      :label => "Remove",
      :action => url_for(:action => :remove_tabbar)
      }
    ], {}, url_for(:action => :tabbar_callback))
    
    render :action => :tabbar_menu
  end

  def switch_tab
    Rho::NativeTabbar.switchTab(2);
  end
  
  def remove_tabbar
    Rho::NativeTabbar.remove
    render :action => :tabbar_menu
  end
  
  def tabbar_callback
    Alert.show_popup("Switching to tab #{@params["tab_index"]}")
  end
end