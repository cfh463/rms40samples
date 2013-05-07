require 'instrumentation'
require 'helpers/browser_helper'

describe "ScannerTest" do
    
  before :each do
    
  end

  after :each do
    
  end
  
  it "AT15201 - enables the scanner" do
    Scanner.enable
  end
  
  it "AT15202 - disables the scanner" do
    Scanner.disable
  end
  
  it "Should reset scanner settings upon page navigation" do
    Scanner.enable
    Scanner.allDecoders = 'disabled'
    Scanner.start
    sleep(10)
    Scanner.stop
    Instrumentation.re_simulate_navigation #this should reset scanner settings
    Scanner.enable
    Scanner.start
    sleep(10)
  end
  
  
  #it("AT15204 - scans and output the scanned data as key strokes", function() {
  #  document.getElementById('textAreaOutput').focus()
  #  runs(function() {
  #   document.getElementById('textAreaOutput').value = '';
  #   scannerStart();
  #  }, "scanning and generate key strokes...");
  #  
  #  waitsFor(function() {
  #          return document.getElementById('textAreaOutput').value == "9780201546101"
  #      }, "Scanner didn't work", 10000);
  #});
  
  #it("AT15207 - scans and sends the scanned data to a callback", function() {
  #  runs(function() {
  #    scanToCallback();
  #  }, "scanning to callback...");
  # 
  #  waitsFor(function() {
  #          return document.getElementById("divOutput").innerHTML == "9780201546101"
  #      }, "Scanner didn't work", 10000);
  #});
  
end
