KitchenSink.Samples.Webview = KitchenSink.Samples.Webview || (function() {

	function activeTab() {
		myvar = Rho.WebView.activeTab();
		alert(myvar);
	}

	function currentLocation() {
		myvar = Rho.WebView.currentLocation();
		alert(myvar);
	}

	function currentURL() {
		myvar = Rho.WebView.currentURL();
		alert(myvar);
	}

	function executeJavascript() {
	   Rho.WebView.executeJavascript("alert('Test Alert');");
		
	}

	function navigate() {
	   Rho.WebView.navigate("/app/Webview/index");
		
	}

	function refresh() {
	   Rho.WebView.refresh();
		
	}

	return {
		activeTab: activeTab,
		currentLocation: currentLocation,
		currentURL: currentURL,
		executeJavascript: executeJavascript,
		navigate: navigate,
		refresh: refresh
	};

})();