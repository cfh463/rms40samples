require 'rho/rhocontroller'

class SignatureController < Rho::RhoController
 
  def index
    puts "Signature index controller"
    @signatures = Signature.find(:all)
    render :back => '/app'  
  end

  def new
    Signature.takeFullScreen(url_for :action => :signature_callback)
    redirect :action => :index
  end

  def delete
    @signature = Signature.find(@params['id'])
    @signature.destroy
    redirect :action => :index
  end

  def signature_callback
    puts "@params : #{@params}"
    if @params['status'] == 'ok'
      #create signature record in the DB
      signature = Signature.new({'image_uri'=> Rho::Application.relativeDatabaseBlobFilePath(@params['imageUri'])})
      signature.save
      puts "new Signature object: " + signature.inspect
    end  
    WebView.navigate( url_for :action => :index )
    ""
  end

  def inline_capture
   Signature.show()
  end

  def do_capture          
    Signature.capture(url_for( :action => :signature_callback))    
  end
  
  def clear_capture          
    Signature.clear()    
  end
  
end
