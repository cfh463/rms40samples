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
    appsBundleFolder = Rho::Application.appsBundleFolder
    databaseBlobFolder = Rho::Application.databaseBlobFolder
    publicFolder = Rho::Application.publicFolder
    userFolder = Rho::Application.userFolder

    message = "App bundle folder: "+appFolder+"\n"+
    "Apps bundle folder: "+appsBundleFolder+"\n"+ 
    "Database blob folder: "+databaseBlobFolder+"\n"+ 
    "Public folder: "+publicFolder+"\n"+ 
    "User folder: "+userFolder
    
    Alert.show_popup(message)
    redirect :action => :index
  end

   def set_locale
  	Rho::Application.setLocale('en')
  	current_locale = Rho::Application.locale
  	Alert.show_popup(current_locale)
  	redirect :action => :index
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
