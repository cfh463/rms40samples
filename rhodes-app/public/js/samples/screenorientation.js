KitchenSink.Samples.Screenorientation = KitchenSink.Samples.Screenorientation || (function() {

	
	function autoRotate() {
  	   Rho.ScreenOrientation.autoRotate=!Rho.ScreenOrientation.autoRotate;
	   is_auto_rotate = Rho.ScreenOrientation.autoRotate;
	   alert("Is Screen Autorotated:" + is_auto_rotate)
	}
	
	function orientation_callback(params) {
		alert("The screen changed orientation");
	}
	
	function set_callback() {
		ScreenOrientation.setScreenOrientationEvent(orientation_callback);
	}
	
	function left_handed() {
		Rho.ScreenOrientation.leftHanded();
	}
	
    function right_handed() {
		Rho.ScreenOrientation.rightHanded();
	}
	
	function normal() {
		Rho.ScreenOrientation.normal();
	}
	
	function upside_down() {
		Rho.ScreenOrientation.upsideDown();
	}
	
	return {
		auto_rotate: auto_rotate,
		set_callback: set_callback,
		upside_down: upside_down,
		left_handed: left_handed,
		right_handed: right_handed,
		normal: normal
	};

})();