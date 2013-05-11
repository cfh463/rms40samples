require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class ORMController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end

  def exportdb
    # Export database partition as zip file
    zip_archive = Rho::Orm.databaseExport(:user)
    Alert.show_popup(zip_archive)
  end

  def importdb
    # Import database from a zip file created with "Rho::Orm.databaseExport"
    exported_database = "/somewhere/file.zip"
    result = Rho::Orm.databaseImport(:user, exported_database)
    if (result)
      Alert.show_popup("Import succeeded. Existing data was erased and the backup was restored")
    else
      # If the process fails, everything will be restored to its previous state. We will not lose any information
      Alert.show_popup("Database import failed. The database is unchanged")
    end
  end
end
