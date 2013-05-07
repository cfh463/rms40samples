require 'fileutils'
GEMS_LOCATION = "C:/development_tools/ruby1.9.3-p374/lib/ruby/gems/1.9.1/gems"
CUSTOM_FILES_LOCATION = "B:/git/Motorola-Extensions/build/ci/ruby_test_specs/framework_spec"
FRAMEWORK_SPEC_LOCATION = "B:/git/rhodes/spec/framework_spec"
	
	task :default => [:test_automation]

	#deviceid is the Android device id used by adb
	#reset, if equal to "reboot" will reboot the device. This was introduced because apparently ET1 have problems with "adb reboot"
	# and therefore the reboot_device task should not be run.
	desc "Main task for starting test automation on Native API's on Android"
	task :test_automation do |t, args|
		puts "test_automation"
		puts "copy modified files to run framework_spec in ATS"
		FileUtils.cp(File.join(CUSTOM_FILES_LOCATION , 'build.yml'), FRAMEWORK_SPEC_LOCATION)
		FileUtils.cp(File.join(CUSTOM_FILES_LOCATION , 'Rakefile'), FRAMEWORK_SPEC_LOCATION)
		FileUtils.cp(File.join(CUSTOM_FILES_LOCATION , 'spec_runner.rb'), File.join(FRAMEWORK_SPEC_LOCATION, 'app'))
		puts "replace mspec junit formatter with a version which doesn't try fancy character encoding"
		Dir.foreach(GEMS_LOCATION) do |dirname| 
			if dirname.start_with?("rhodes-4")
				FileUtils.cp(File.join(CUSTOM_FILES_LOCATION, "junit.rb"), File.join(GEMS_LOCATION, dirname, "lib", "extensions", "mspec", "mspec", "runner", "formatters") )
			end
		end
		puts "run test app in win32 emulator"
		system 'rake clean:win32'
		system 'rake run:win32:rhosimulator'
		puts "wait for the test app to end"
		tasklist_command = "tasklist | grep RhoSimulator"
		puts tasklist_command
		result = %x[#{tasklist_command}]
		while (result != "") do
			sleep(10)
			result = %x[#{tasklist_command}]
		end
	end
	