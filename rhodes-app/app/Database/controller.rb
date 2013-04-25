require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class DatabaseController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
end
