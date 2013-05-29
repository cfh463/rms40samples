KitchenSink.Samples.NativeToolbar = KitchenSink.Samples.NativeToolbar || (function() {

	function getActionUrls() {
		var links = $(".ui-page-active").find(".toolbarurls > a").attr("href");
		var urls = [];
		links.each(function(index) {
			urls.push($(links[index]).attr("href"));
		});
		
		return urls;
	}

	function toolbarCallback(params) {
		if (params["tabEvent"] == "onTabFocus") {
			var newIndex = params["newTabIndex"];
			
			if (newIndex==3) {
				removeToolbar();
			} else {
				var urls = getActionUrls();
				Rho.WebView.navigate(urls[newIndex]);
			}
		}
	}

	function createToolbar() {
		Rho.NativeToolbar.create([{
				label: "Home"
			}, {
				label: "Toolbar"
			}, {
				label: "example.com"
			}, {
				label: "Remove"
			}], toolbarCallback)

	}

	function switchTab() { }

	function removeToolbar() { }

	return {
		createToolbar: createToolbar,
		switchTab: switchTab,
		removeToolbar: removeToolbar
	};
})();