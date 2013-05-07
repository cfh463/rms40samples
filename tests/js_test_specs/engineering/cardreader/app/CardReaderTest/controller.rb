require 'rho/rhocontroller'
require 'helpers/application_helper'
require 'helpers/browser_helper'

class CardReaderTestController < Rho::RhoController
  include BrowserHelper
  include ApplicationHelper
  
  def myswipeevent
      puts "Swipe params: #{@params}"
     puts "Mode is #{@params['mode']}"
     puts "Data is #{@params['data']}"       
     WebView.execute_js("onSwipeEventRuby('#{@params['data']}','#{@params['mode']}'}');") 
  end   
   
  def funStart
    WebView.execute_js("displayMsg('Inside the card reader JS Ruby model'); ")
  end
  
  # GET /CardReader
  def funprop  
     
    Rho::CardReader.pinTimeout = 5000
    Rho::CardReader.setProperties :pinEntry => 'TRUE', :autoTab => 'TRUE', :autoEnter => 'TRUE', :moduleName => 'DCR7000'
    Rho::CardReader.setProperties :panData => '4292435445672345'
    
    vpinTimeout = Rho::CardReader.getProperty("pinTimeout")
    vpanData    = Rho::CardReader.getProperty("panData")
    vpinEntry   = Rho::CardReader.pinEntry
    vAutoTab    = Rho::CardReader.getProperty("autoTab")
    vAutoEnter  = Rho::CardReader.getProperty("autoEnter")
    vModuleName = Rho::CardReader.getProperty("moduleName")
    printData ="timeout:- #{vpinTimeout} entry:- #{vpinEntry} panData:- #{vpanData} tab:- #{vAutoTab} enter:- #{vAutoEnter} module:- #{vModuleName}"
    Alert.show_popup(printData) 
    
    #Rho::CardReader.clearProperties
    propValues = Rho::CardReader.getAllProperties
    printData ="timeout:- #{propValues['pinTimeout']} entry #{propValues['pinEntry']} panData:- #{propValues['panData']} tab:- #{propValues['autoTab']} enter:- #{propValues['autoEnter']} module:- #{propValues['moduleName']}"
    Alert.show_popup(printData)  
   
    redirect :action => :index
  end
  
  def funopen     
      Rho::CardReader.open(url_for(:action => :myswipeevent))
        
      redirect :action => :index
    end
    
  def funclose 
      
    Rho::CardReader.close         
    redirect :action => :index
  end   
  
  #@@test_proc = lambda{|args| puts "lamda: #{args}"}
  def index
  render :back => '/app/CardReaderTest'
  end

 
end
