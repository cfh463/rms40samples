KitchenSink.Samples.Screenorientation = KitchenSink.Samples.Screenorientation || (function() {

	
	function autoRotate() {
  	   Rho.ScreenOrientation.autoRotate=true;
	   is_auto_rotate = Rho.ScreenOrientation.autoRotate;
		alert("Is Screen Autorotated:" + is_auto_rotate)
	}

	return {
		autoRotate: autoRotate
	};

})();