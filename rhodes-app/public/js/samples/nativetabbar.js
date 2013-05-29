KitchenSink.Samples.NativeTabbar = KitchenSink.Samples.NativeTabbar || (function() {

	function getActionUrls() {
		var links = $(".ui-page-active").find(".tabbarurls > a").attr("href");
		var urls = [];
		links.each(function(index) {
			urls.push($(links[index]).attr("href"));
		});
		
		return urls;
	}

	function tabbarCallback(params) {
		if (params["tabEvent"] == "onTabFocus") {
			var newIndex = params["newTabIndex"];
			
			if (newIndex==3) {
				removeTabbar();
			} else {
				var urls = getActionUrls();
				Rho.WebView.navigate(urls[newIndex]);
			}
		}
	}

	function createTabbar() {
		Rho.NativeTabbar.create([{
				label: "Home"
			}, {
				label: "Tabbar"
			}, {
				label: "example.com"
			}, {
				label: "Remove"
			}], tabbarCallback)

	}

	function switchTab() { }

	function removeTabbar() { }

	return {
		createTabbar: createTabbar,
		switchTab: switchTab,
		removeTabbar: removeTabbar
	};

})();