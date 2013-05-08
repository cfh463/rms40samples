require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class ApplicationController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def app_folder 
    appFolder = Rho::Application.appBundleFolder
    Alert.show_popup(appFolder)
    render :action => :wait
  end

   def set_locale
  	Rho::Application.setLocale('en')
  	current_locale = Rho::Application.locale
  	Alert.show_popup(current_locale)
  	render :action => :wait
   end

   def quit_app 
    Rho::Application.quit
   end

  def minimize_app
  Rho::Application.minimize
  end
  
  def restore_app
  	Rho::Application.restore
  end
end
