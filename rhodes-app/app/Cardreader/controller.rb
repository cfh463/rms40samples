require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class CardreaderController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  
  def open_cardreader
    render
  end
  
  def connect
    Rho::CardReader.open({}, url_for(:action => :cardreader_callback))
    redirect :open_cardreader
  end
  
  def cardreader_callback
    Alert.show_popup("Received card reader data: #{@params[:data]}")
  end
  def properties
    render
  end
  def set_properties
    # Configure the MSR to output keystrokes instead of calling a function when a card is swiped
    # Note the absence of a callback parameter
    # Also, After emitting the keystrokes, automatically send a "Tab" keypress
    Rho::CardReader.open({:autoTab => true})
      
    # Instead of "Tab", we could request a simulated "Enter" 
    Rho::CardReader.open({:autoEnter => true})
  end
end
