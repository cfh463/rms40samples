require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class CardreaderController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
end
