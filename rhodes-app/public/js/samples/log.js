KitchenSink.Samples.Log = KitchenSink.Samples.Log || (function() {

	  
	  function log_categories() {
	    Rho.Log.info("Consectetuer adipiscing elit", "Lorem Ipsum");
	    Rho.Log.info("Foo acquired value Bar in method Baz", "Miscellaneous");
	  }
	  
	  function log_memory_usage() {
	    // Request that memory usage be logged automatically by the system every second
	    Rho.Log.memoryPeriod = 1000;
	  }
	  
	  function show_log() {
	    Rho.Log.showLog();
	  }

	  function read_log_file() {
	    var log_contents = Rho.Log.readLogFile(400);
	    alert('Log file contents: '+log_contents);
	  }

	  function clean_log_file() {
	    var log_contents_before = Rho.Log.readLogFile(400);
	    alert('Log file contents before cleaning: '+log_contents_before);
	    Rho.Log.cleanLogFile();
	    var log_contents_after = Rho.Log.readLogFile(400);
	    alert('Log file contents after cleaning: '+log_contents_after);
	  }
	
	return {
		log_categories : log_categories,
		log_memory_usage : log_memory_usage,
		show_log : show_log,
		read_log_file : read_log_file,
		clean_log_file : clean_log_file
	};

})();