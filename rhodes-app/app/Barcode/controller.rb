require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class BarcodeController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def scan_using_default_scanner
    # TODO: new Barcode API not implemented in Ruby - only old API is present
    Barcode.take_barcode(url_for(:action => :scan_received), {})
  end
  
  def scan_received
    Rho::Log.info(@params.to_s)
  end
end
