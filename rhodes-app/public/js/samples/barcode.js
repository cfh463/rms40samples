KitchenSink.Samples.Barcode = KitchenSink.Samples.Barcode || (function() {

    function scan_received(params) {
        
    }
    
    function scan_using_default_scanner() {
      Rho.Barcode.take({}, scan_received);
    }

	return {
		scan_using_default_scanner : scan_using_default_scanner
	}

})();