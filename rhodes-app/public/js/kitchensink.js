
var KitchenSink = (function() {

	// User interface
	(function() {
		
		function toggle_example_description() {
			$(".ui-page-active .example_description").fadeToggle();
		}
		
		function filter_navmenu() {
			var searchText = $(this).val();
			var sections = $(this).closest(".navmenu").find(".navmenu_sections");
			
			sections.find("div[data-role=collapsible]").each(function() {
				var keywords = $(this).data('filter');
				// If the search is empty, show every item
				if (typeof(keywords)==="undefined" || keywords.indexOf(searchText)!==-1) {
					$(this).fadeIn();
				} else {
					$(this).fadeOut();
				}
			});
		}
		
		function init() {
			$(document).on("click", "a.ks_toggle_example_description", toggle_example_description);
			$(document).on("change keyup", ".navmenu_searchbox", filter_navmenu);
		}
		
		init();
	})();

	var Samples = {};
	
	return({
		Samples: Samples
	});
	
})(jQuery);

