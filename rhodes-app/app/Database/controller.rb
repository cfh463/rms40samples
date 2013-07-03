require 'rho'
require 'rho/rhocontroller'
require 'rho/rhoerror'
require 'helpers/browser_helper'

class DatabaseController < Rho::RhoController
  include BrowserHelper
  
  def index
    render
  end
  def init_db
    render
  end
  def initdb
    Rho::Log.info("Initializing database", "Sample")
    Rho::Database.initialize(Rho::Application.databaseFilePath,"partition1")
    Rho::Log.info("Database initialized", "Sample")
    Rho::Database.executeSQL("Create table Users (user_id integer, active integer)")
    Rho::Database.executeSQL("Insert into users (user_id,active) values (0,1)")
    Rho::Database.executeSQL("Insert into users (user_id,active) values (1,1)")
    Rho::Database.executeSQL("Insert into users (user_id,active) values (2,1)")
    Rho::Database.executeSQL("Insert into users (user_id,active) values (3,1)")
    Rho::Database.executeSQL("Insert into users (user_id,active) values (4,1)")
    Rho::Database.executeSQL("Insert into users (user_id,active) values (5,1)")
    redirect :init_db
  end  
  
  def transactions
    # Let's assume we have a table called Users with a two columns, "user_id" and "active"
      
    # Begin transaction
    Rho::Database.startTransaction
    
    # Execute updates
    Rho::Database.executeSQL("Delete from Users where active = 0")
    
    # Uh oh... maybe we should not really do that after all. Let's rollback the transaction
    Rho::Database.rollbackTransaction

    # At this point, our database is in exactly the same state as it was before we started.
    # It's as if the "Delete" SQL statement had never existed
    
    # Now let's execute a different statement that we actually want
    # Begin another transaction...
    Rho::Database.startTransaction
    
    # Execute updates - we can issue multiple SQL commands within the same transaction
    
    Rho::Database.executeSQL("Update Users set active = 0 where user_id = 2")
    Rho::Database.executeSQL("Update Users set active = 0 where user_id = 3")
    Rho::Database.executeSQL("Update Users set active = 0 where user_id = 4")
    Rho::Database.executeSQL("Update Users set active = 0 where user_id = 5")
    
    # This is the point of no return. After commit is called, all the updates will become permanent
    Rho::Database.commit
    
  end

  def seed_db
    render
  end 

  def seeddb
    if !Rho::Database.isTableExist('Product')
      Rho::Database.executeSQL("Create table Products (product_id integer, active integer)")
    end
    Rho::Database.executeSQL("Insert into products (product_id,active) values (0,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (1,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (2,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (3,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (4,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (5,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (6,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (7,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (8,1)")
    Rho::Database.executeSQL("Insert into products (product_id,active) values (9,1)")
    Alert.show_popup "Seed"
    redirect :seed_db
  end

  def export_db
    render
  end

  def exportdb 
   #export database
   exportPath = Rho::Database.export('user')
   Alert.show_popup "Export path - #{exportPath}"
   redirect :export_db
  end

  def import_db
    render
  end

  def importdb
    #export database
    exportPath = Rho::Database.export('user')
    #import database
    Rho::Database.database_import('user',exportPath)
    Alert.show_popup "Database Import Succeeded"
    redirect :import_db
  end
end
