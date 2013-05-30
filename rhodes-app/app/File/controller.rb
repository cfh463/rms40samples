require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class FileController < Rho::RhoController
  include BrowserHelper
  def browse_filesystem
    @start_from_path = @params["start_from_path"] || Rho::Application.appsBundleFolder
    Rho::Log.info("Starting path: #{@start_from_path}","File")
    
    @folders = []
    @files = []

    if @start_from_path
      # TODO: move from RhoFile to File when implemented
      @entries = Rho::RhoFile.listDir(@start_from_path)

      @entries.each do |entry|
        unless (entry == "." || entry == "..")
          (Rho::RhoFile.isDir(Rho::RhoFile.join(@start_from_path,entry)) ? @folders : @files) << entry
        end
      end
    end

    render
  end

end
