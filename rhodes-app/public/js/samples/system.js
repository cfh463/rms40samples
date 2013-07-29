KitchenSink.Samples.System = KitchenSink.Samples.System || (function() {
	function capabilities() {
		// Returns true if device supports Motorola device capabilities, such as Scanner, etc.
		var is_motorola_device = Rho.System.isMotorolaDevice;

		var has_calendar = Rho.System.hasCalendar;
		var has_camera = Rho.System.hasCamera;
		var has_cell_network = Rho.System.hasCellNetwork;
		var has_wifi_network = Rho.System.hasWifiNetwork;
		var has_network = Rho.System.hasNetwork;
		var has_sqlite = Rho.System.hasSqlite;
		var has_touchscreen = Rho.System.hasTouchscreen;

		message = "Motorola device: " + is_motorola_device + "\n" + "Calendar: " + has_calendar + "\n" + "Camera: " + has_camera + "\n" + "Cell network: " + has_cell_network + "\n" + "WiFi: " + has_wifi_network + "\n" + "Network: " + has_network + "\n" + "SQLite: " + has_sqlite + "\n" + "Touchscreen: " + has_touchscreen;

		alert(message);
	}

	function install_apk() {
		// install an application from given url
		Rho.System.applicationInstall("http://rhodes-server-log.herokuapp.com/simple_app_signed.apk");
		alert("Simpleapp-rhodes is installing")
	}

	function uninstall_app() {
		// uninstall the application
		Rho.System.applicationUninstall("com.rhomobile.rhodesapp");
	}

	function get_version_info() {
		var version_info = Rho.System.osVersion;
		alert(version_info);
	}

	function local_serverport() {
		// Retrieve port of the local (embedded) HTTP server
		var local_port = Rho.System.localServerPort;
		alert(local_port);
	}

	function zip() {
		var destination_zip = Rho.RhoFile.join(Rho.Application.userFolder,"public.zip");
		
		Rho.System.zipFiles(destination_zip, Rho.Application.publicFolder, ["css", "images"]);
		alert("Public folder zipped in "+destination_zip);
	}

	return {
		capabilities: capabilities,
		install_apk: install_apk,
		uninstall_app: uninstall_app,
		get_version_info: get_version_info,
		local_serverport: local_serverport,
		zip: zip
	};

})();