require 'instrumentation'

describe "DummyTest" do
  
  it "Dummy Test 1" do
    true.should == true
  end
  
  it "Dummy Test 2" do
    2.should == 2
  end
  
  it "Should generate key events" do
    puts "Executing mspec test Should generate key events"
    puts "Instrumentation.get_keycode #{Instrumentation.get_keycode :volume_down} #{:volume_down}"
    Rho::Instrumentation.simulate_key_event_code Rho::Instrumentation.get_keycode :volume_down
  end
  
  it "Should simulate typing a string" do
    WebView.execute_js 'prompt("What is your name?","");'
    sleep(1)
    puts "This is executing"
    Rho::Instrumentation.simulate_key_event_string "test automation 123"
    sleep(3)
    Rho::Instrumentation.simulate_key_event_code Rho::Instrumentation.get_keycode :escape #press esc to focus the OK button
    sleep(3)
    Rho::Instrumentation.simulate_key_event_code Rho::Instrumentation.get_keycode :tab #press tab to focus the OK button
    sleep(1)
    Rho::Instrumentation.simulate_key_event_code Rho::Instrumentation.get_keycode :enter #press enter to close the dialog
    sleep(3)
  end
  
  it "Should simulate a touch event" do
    Rho::Instrumentation.simulate_touch_event 0, 200, 200
    Rho::Instrumentation.simulate_touch_event 1, 200, 200
  end
  
  it "Should simulate a linear gesture" do
    draw_line 100, 70, 500, 700
  end
  
  it "Should simulate a circle gesture" do
  #  radius = 30
  #  cx = 300
  #  cy = 300
  #  draw_circle(cx, cy, radius)
  end
  
  it "Should return the allocated memory in kb" do
    allocated_memory = Rho::Instrumentation.get_allocated_memory
    puts "The total memory is #{allocated_memory.to_s}"  
  end
  
  it "Should simulate a page navigation" do
    Rho::Instrumentation.re_simulate_navigation
  end
  
  def draw_line(x1, y1, x2, y2)
    Rho::Instrumentation.simulate_touch_event(Rho::Instrumentation.get_toucheventcode(:touch_down), x1, y1)
    slope = ((y2 - y1).to_f / (x2 - x1))
    RhoLog.info("draw_line", "slope: %5.2f" % slope.to_f) 
    x = x1
    begin
      y = (slope.to_f * (x - x1)) + y1
      Rho::Instrumentation.simulate_touch_event(Rho::Instrumentation.get_toucheventcode(:touch_move), x.to_i, y.to_i)
      x += 20
    end until x >= x2
    Rho::Instrumentation.simulate_touch_event(Rho::Instrumentation.get_toucheventcode(:touch_up), x2, y2)
  end
  
  def draw_circle(cx, cy, radius)
    theta = 0
    step = 15
    Rho::Instrumentation.simulate_touch_event(Rho::Instrumentation.get_toucheventcode(:touch_down), y.round, x.round)
    begin
      x = cx + radius*Math.cos(theta)
      y = cy + radius*Math.sin(theta)
      Rho::Instrumentation.simulate_touch_event(Rho::Instrumentation.get_toucheventcode(:touch_move), y.round, x.round)
      theta = theta + step
    end until theta >= 360
    Rho::Instrumentation.simulate_touch_event(Rho::Instrumentation.get_toucheventcode(:touch_up), y.round, x.round)
  end
  
  it "Should tell if a file exists" do
    res = Rho::Instrumentation.file_exists("\\Android\\data\\com.motorolasolutions.mspec_example\\apdconfig.xml")
    res.should == 1
  end
  
  it "Should return 0 if a file doesn't exist" do
    res = Rho::Instrumentation.file_exists("\\Android\\data\\com.motorolasolutions.mspec_example\\idontexist.xml")
    res.should == 0
  end
  
  it "Should delete an existing file" do
    res = Rho::Instrumentation.file_exists("\\Android\\data\\com.motorolasolutions.mspec_example\\apdconfig.xml")
    res.should == 1
    res = Rho::Instrumentation.delete_file("\\Android\\data\\com.motorolasolutions.mspec_example\\apdconfig.xml")
    res.should == 1
    res = Rho::Instrumentation.file_exists("\\Android\\data\\com.motorolasolutions.mspec_example\\apdconfig.xml")
    res.should == 0
  end
  
  it "Should return 0 on attempting to delete a non existing file" do
    res = Rho::Instrumentation.delete_file("\\Android\\data\\com.motorolasolutions.mspec_example\\idontexist.xml")
    res.should == 0
  end
  
  it "Should not crash on calling rhoelementsext many times" do
    for i in 0..1000
      KeyCapture.keyValue='All'
      KeyCapture.dispatch='True'
      KeyCapture.keyEvent = url_for(:action=>jsKeyEvent)
      Rho::Instrumentation.simulate_key_event_string "T"
    end
  end
  
  it "Should save the current screen in a bitmap file" do
    res = Rho::Instrumentation.screen_capture "\\Temp\\mytest_screen_capture.bmp"
    res.should == 1
  end
  
end




























