require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class MediaplayerController < Rho::RhoController
  include BrowserHelper
  
  def play_all
    render
  end
end