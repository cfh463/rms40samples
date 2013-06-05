KitchenSink.Samples.Barcode = KitchenSink.Samples.Barcode || (function() {

    function scan_received(params) {
        
    }
    
    function scan_using_default_scanner() {
      Rho.Barcode.take({}, scan_received);
    }

    function _read_properties_from_form() {
    	var result={};
    	$.mobile.activePage.find("form input[checked]").each(function() {
    		var element = $(this);
    		result[element.attr('name')] = element.val();
    	});
    	
    	return result;
    }
    
    function set_properties() {
      // assign properties
      var properties = _read_properties_from_form();
      Rho.Barcode.aimMode = properties["aimMode"];
      Rho.Barcode.aimType = properties["aimType"];
      Rho.Barcode.beamWidth = properties["beamWidth"];
      
      // invoke scanner to see the different settings at work
      this.scan_using_default_scanner();
    }
    
    function set_audible_options() {
    	var decodeVolume = $.mobile.activePage.find("input[name=decodeVolume]").val();
    	var decodeFrequency = $.mobile.activePage.find("input[name=decodeFrequency]").val();
    	var decodeDuration = $.mobile.activePage.find("input[name=decodeDuration]").val();
    	
    	Rho.Barcode.decodeVolume = decodeVolume;
    	Rho.Barcode.decodeFrequency = decodeFrequency;
    	Rho.Barcode.decodeDuration = decodeDuration;
    	
    	this.scan_using_default_scanner();
    }
    
	return {
		scan_using_default_scanner : scan_using_default_scanner,
		set_properties : set_properties,
		set_audible_options : set_audible_options		
	};

})();