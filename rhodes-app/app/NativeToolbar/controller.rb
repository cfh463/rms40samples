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
      :action => url_for(Rho::Application.startURI)
      },
      {
      :label => "Toolbar",
      :action => url_for(:action => :toolbar_menu),
      },
      {
      :label => "example.com",
      :action => "http://www.example.com",
      },      
      {
      :label => "Remove",
      :action => url_for(:action => :remove_toolbar)
      }
    ], {})
    
    render :action => :toolbar_menu
  end

  def remove_toolbar
    Rho::NativeToolbar.remove
    render :action => :toolbar_menu
  end
end