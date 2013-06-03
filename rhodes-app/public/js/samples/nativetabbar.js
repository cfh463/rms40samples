KitchenSink.Samples.NativeTabbar = KitchenSink.Samples.NativeTabbar || (function() {

	function getActionUrls() {
		var links = $(".ui-page-active").find(".tabbarurls > a");
		var urls = [];
		links.each(function(index) {
			urls.push($(links[index]).attr("href"));
		});
		
		return urls;
	}

	function tabbarCallback(params) {
		if (params["tabEvent"] == "onTabFocus") {
			var newIndex = params["tab_index"];
			
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
			}], {}, tabbarCallback);
	}

	function switchTab() { 
		Rho.NativeTabbar.switchTab(2);
	}

	function removeTabbar() { 
		Rho.NativeTabbar.remove();
	}

	return {
		createTabbar: createTabbar,
		switchTab: switchTab,
		removeTabbar: removeTabbar
	};

})();