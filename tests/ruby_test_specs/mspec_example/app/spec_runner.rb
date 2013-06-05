require 'mspec'

class SpecRunner < MSpecScript
  def initialize
    super
    config[:files] = []
    # turn on exception backtrace
    MSpec.backtrace = true

    #MSpec.guard
    app_folder = Rho::RhoFSConnector.get_app_path('app')
    app_folder.gsub!(/\\/, '/')

    specs = app_folder + "**/*_spec" + RHO_RB_EXT
    Dir.glob(specs) { |file|
      puts file
      file.gsub!(app_folder,"")
      
      if RHO_RB_EXT == '.rb'
        file.gsub!(/\.rb/,"")
      else
        file.gsub!(/\.iseq/,"")
      end
      
      config[:files] << file
    }

  end

  def run
    puts "get_base_app_path() = #{Rho::RhoApplication.get_base_app_path()}"
    results_path = File.join(Rho::RhoApplication.get_base_app_path(), 'test_results.xml' )
    puts "Platform: " + System::get_property('platform')
    if System::get_property('platform') == 'ANDROID'
      results_path = File.join('/mnt', 'sdcard', 'test', 'ci_junit', 'native', 'test_results.xml')
    end
    @@formatter = JUnitFormatter.new(results_path)
    @@formatter.register
    MSpec.register_files config[:files]
    MSpec.process
    MSpec.exit_code
    #System.exit
  end
end
