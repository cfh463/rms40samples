
var KitchenSink = (function() {

	// User interface
	(function() {
		
		function toggle_example_description() {
			$(".ui-page-active .example_description").fadeToggle();
		}
		
		function init() {
			$(document).on("click", "a.ks_toggle_example_description", toggle_example_description);
		}
		
		init();
	})();

	var Samples = {};
	
	return({
		Samples: Samples
	});
	
})(jQuery);

