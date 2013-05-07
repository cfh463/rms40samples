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
    Rho::Barcode.take({}, url_for(:action => :scan_received))
  end
  
  def scan_received
    if @params["status"] == "ok"
      Rho::Log.info(@params["barcode"],"Barcode result")
    else
      Rho::Log.info("Cancelled", "Barcode result")
    end
  end
  
  def choose_scanner
    Rho::Log.info(self.inspect, "========= Self.inspect")
    $scanners = Rho::Barcode.enumerate
    render
  end
    
  def scan_using_chosen_scanner
    Rho::Log.info(@params.inspect, "========== Params.inspect")
    scanner = $scanners[@params["scannerIndex"].to_i]
    scanner.take({}, url_for(:action => :scan_received))
  end
  
  def set_symbology
    # For the purpose of this example, let's say our application only needs to recognize one type of barcode.
    # In that case, we will disable all decoders...
    Rho::Barcode.allDecoders = false
    # ... and enable only the one we are interested in:
    Rho::Barcode.upca = true
    # All other barcode symbologies will be ignored
    Rho::Barcode.take({}, url_for(:action => :scan_received))
  end
  
  def control_properties
    # There are over 200 properties to fine-tune the barcode scanner functionality and adapt it to suit your application.
    # Almost all properties depend on the scanner hardware for support, please check the documentation to see if your device
    # supports a particular setting
    
    # Here are examples of setting some of the properties. The documentation lists the acceptable values for each of them
    
    # Aiming mode (visual cue):  
    Rho::Barcode.aimMode = "none"
    Rho::Barcode.aimMode = "dot"
    Rho::Barcode.aimMode = "slab"
    Rho::Barcode.aimMode = "reticle"

    # Aiming type (processing mode):
    Rho::Barcode.aimType = "trigger"
    Rho::Barcode.aimType = "timedHold"
    Rho::Barcode.aimType = "timedRelease"
    Rho::Barcode.aimType = "presentation"
    Rho::Barcode.aimType = "pressAndRelease"
    Rho::Barcode.aimType = "continuousRead"
        
    # Generate an "Enter" keypress after a barcode is recognized. Useful for sending forms automatically after a scan
    Rho::Barcode.autoEnter = true
    
    # Select the beam width of the scanner (only supported on some devices)
    Rho::Barcode.beamWidth = "normal"
    Rho::Barcode.beamWidth = "narrow"
    Rho::Barcode.beamWidth = "wide"
  end
  
  def change_audible_options
    # Maximum volume (default)
    Rho::Barcode.decodeVolume = 5
    # Low-pitched sound
    Rho::Barcode.decodeFrequency = 1000
    # One-second long
    Rho::Barcode.decodeDuration = 1000
    
    Rho::Barcode.take({}, url_for(:action => :scan_received))
  end
end
