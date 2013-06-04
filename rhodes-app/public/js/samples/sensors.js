KitchenSink.Samples.Sensors = KitchenSink.Samples.Sensors || (function() {

	function accelerometer_callback(params) {
		$(".ui-page-active .accelerometer_x").text(params["x"]);
		$(".ui-page-active .accelerometer_y").text(params["y"]);
		$(".ui-page-active .accelerometer_z").text(params["z"]);
	}
	
	function start_accelerometer() {
		Rho.Sensors.watchAccelerometer(200, accelerometer_callback);
	}
	
	function stop_accelerometer() {
		Rho.Sensors.stopAccelerometer();
	}
	
	
	return {
		start_accelerometer : start_accelerometer,
		stop_accelerometer : stop_accelerometer
	};

})();