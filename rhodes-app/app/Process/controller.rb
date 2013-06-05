require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class ProcessController < Rho::RhoController
  include BrowserHelper

  # GET /Process
  def index

  end

  def launch_external_app
  	p "launch_external_app---------------------------launch_external_app----------"
  	Rho::Process.getProcessExitCode()
  	p "------------------------sss"
  	render :action => :index
  end
  
end
