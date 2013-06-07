KitchenSink.Samples.Signature = KitchenSink.Samples.Signature || (function() {

	function signature_callback(params) {

		if (params["status"] == "ok") {
			alert("Signature captured");
			var signature_area = $(".ui-page-active .sample.javascript img.signature");
			$(signature_area).attr("src", Rho.Application.expandDatabaseBlobFilePath(params["imageUri"]));
		} else {
			alert("Signature capture cancelled");
		}
	}
	
	function set_properties() {
		var selected_inputs = $(".ui-page-active .sample.javascript input[checked]");
		var properties = {};
		
		selected_inputs.each(function(index) {
			var input = $(selected_inputs[index]);
			properties[input.attr('name')] = input.val();
		});
		
		Rho.Signature.takeFullScreen(properties, signature_callback);
	}
	
	return {
		set_properties : set_properties
	};

})();