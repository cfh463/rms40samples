function helloWorld() {}

var KitchenSink = {
	UI : function() {
		
		function toggle_example_description() {
			$(".ui-page-active .example_description").fadeToggle();
		}
		
		function init() {
			$(document).on("click", "a.ks_toggle_example_description", toggle_example_description);
			alert("Inited");
		}
		return {
			init: init
		};
	}(),
	
	init: function() {
		this.UI.init();
	}
};




KitchenSink.init();