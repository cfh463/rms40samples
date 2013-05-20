KitchenSink.Samples.Webview = KitchenSink.Samples.Webview || (function() {

	function setProperties() {
		
		var fullScreen = Rho::WebView.fullScreen();
		var currentURL = Rho.WebView.currentURL();
		var currentLocation =Rho.WebView.currentLocation();
		var acceptLanguage = Rho::WebView.acceptLanguage();
	

		var message = "CurrentURL: " + currentURL + "\n" + "Current Location: " + currentLocation + "\n" + "Full Screen: " + fullScreen + "\n" + "Language: " + acceptLanguage;

		alert(message);
	}
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
		setProperties: setProperties,
		activeTab: activeTab,
		currentLocation: currentLocation,
		currentURL: currentURL,
		executeJavascript: executeJavascript,
		navigate: navigate,
		refresh: refresh
	};

})();