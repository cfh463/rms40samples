require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'instrumentation'

class SignatureTestController < Rho::RhoController
  include BrowserHelper
  
  def simulate_navigation
    Instumentation.re_simulate_navigation
  end
  
  def draw_box(top, left, height, width)
    Instrumentation.simulate_touch_event(TOUCH_DOWN, left, top)
    Instrumentation.simulate_touch_event(TOUCH_MOVE, left, top + height)
    Instrumentation.simulate_touch_event(TOUCH_MOVE, left + width, top + height)
    Instrumentation.simulate_touch_event(TOUCH_MOVE, left + width, top)
    Instrumentation.simulate_touch_event(TOUCH_UP, left, top)
  end
  
  def draw_line(x1, y1, x2, y2)
    Instrumentation.simulate_touch_event(TOUCH_DOWN, x1, y1)
    Instrumentation.simulate_touch_event(TOUCH_MOVE, x2, y2)
    Instrumentation.simulate_touch_event(TOUCH_UP, x2, y2)
  end
  
  def file_exists(url)
     return Instrumentation.file_exists(url)
  end
  
  def delete_file(url)
    return Instrumentation.delete_file(url)
  end
  
  def close_fullscreen
  end

  def clear_fullscreen
  end

  def capture_fullscreen
  end
end