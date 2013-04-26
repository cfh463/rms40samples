require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class LogController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def log_categories
    Rho::Log.info("Consectetuer adipiscing elit", "Lorem Ipsum")
    Rho::Log.info("Foo acquired value Bar in method Baz", "Miscellaneous")    
    redirect :index
  end
  
  def show_log
    Rho::Log.showLog
    redirect :index
  end
  
  def display_log_file
    @logFileContent = Rho::Log.readLogFile 16384
    Rho::Log.info(@logFileContent, "Log file content")
    render :action => :display_log_file
  end
end
