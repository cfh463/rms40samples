require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class MediaplayerController < Rho::RhoController
  include BrowserHelper
  def play_all
    render
  end
  
  def list_ringtones
     Rho::Mediaplayer.getAllRingtones( url_for :action => :mediaplayer_callback)
  end
  
  def mediaplayer_callback
   @ringtones = @params
   @ringtones = [] if @ringtones.nil?
   Webview.navigate(url_for(:action => :all_ringtones,:query => { :ringtones => @ringtones }))
  end
  
  def all_ringtones
     @ringtones = @params["ringtones"]
    render
  end
  
  def play
     puts "Play ringtone"

     $selected = @params['name']
     Rho::Mediaplayer.playRingTone @params['name']
     render :action => :playing
  end
  
  def stop
      puts "Stop playing"

      Rho::Mediaplayer.stopRingTone()
      redirect :action => :list_ringtones
    end 
end