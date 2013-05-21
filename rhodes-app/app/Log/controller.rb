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
    redirect :logginig_categories
  end
  
  def logginig_categories
  end
  
  def log_memory_usage
    # Request that memory usage be logged automatically by the system every second
    Rho::Log.memoryPeriod = 1000
    @memory_period = Rho::Log.memoryPeriod
  end
 
  def show_log
    # Show the contents of the log file in a window with controls to refresh, clear and send. Useful for debugging and when asking users to report error messages
    Rho::Log.showLog
    redirect :index
  end
  
  def read_log_file
    # Read at most 16384 symbols
    @logFileContent = Rho::Log.readLogFile 16384
    Rho::Log.info(@logFileContent, "Log file content")
    render :action => :read_log_file
  end
  
  def clean_log_file
    # Read log file
    @logFileContentBefore = Rho::Log.readLogFile 16384
    
    # Clear log file
    Rho::Log.cleanLogFile
    
    # Read log file again - this time it will be empty
    @logFileContentAfter = Rho::Log.readLogFile 16384
    render :action => :display_log_file_before_and_after
  end
end
