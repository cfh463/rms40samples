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
end
