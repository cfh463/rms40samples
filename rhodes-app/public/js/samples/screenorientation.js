KitchenSink.Samples.Screenorientation = KitchenSink.Samples.Screenorientation || (function() {

	
	function autoRotate() {
  	   Rho.ScreenOrientation.autoRotate=true;
	   is_auto_rotate = Rho.ScreenOrientation.autoRotate;
		alert("Is Screen Autorotated:" + is_auto_rotate)
	}
	
	function setCallback() {
	    Rho.ScreenOrientation.upsideDown();
		ScreenOrientation.setScreenOrientationEvent('/app/Screenorientation/orientation_callback');
	}
	
	function leftHanded() {
		Rho.ScreenOrientation.leftHanded();
	}
	
    function rightHanded() {
		Rho.ScreenOrientation.rightHanded();
	}
	
	function normal() {
		Rho.ScreenOrientation.normal();
	}
	
	function upsideDown() {
		Rho.ScreenOrientation.upsideDown();
	}
	return {
		autoRotate: autoRotate,
		setCallback: setCallback,
		upsideDown: upsideDown,
		leftHanded: leftHanded,
		rightHanded: rightHanded,
		normal: normal
	};

})();