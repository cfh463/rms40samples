KitchenSink.Samples.NativeToolbar = KitchenSink.Samples.NativeToolbar || (function() {

	function getActionUrls() {
		var links = $(".ui-page-active").find(".toolbarurls > a").attr("href");
		var urls = [];
		links.each(function(index) {
			urls.push($(links[index]).attr("href"));
		});
		
		return urls;
	}

	function createToolbar() {
		var urls = getActionUrls();
		Rho.NativeToolbar.create([{
				label: "Home",
				action: urls[0]
			}, {
				label: "Toolbar",
				action: urls[1]
			}, {
				label: "example.com",
				action: urls[2]
			}, {
				label: "Remove",
				action: urls[3]
			}], {})
	}


	function removeToolbar() { 
		Rho.NativeToolbar.remove();
	}

	return {
		createToolbar: createToolbar,
		removeToolbar: removeToolbar
	};
})();