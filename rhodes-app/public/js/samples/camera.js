KitchenSink.Samples.Camera = KitchenSink.Samples.Camera || (function($) {
	  
    var cameras = [];
      
    function picture_taken_callback(params) {
      // Did we receive an image?
      if (params["status"]=="ok") {
        $("#captured_image").attr("src", Rho.Application.expandDatabaseBlobFilePath(params["imageUri"]));
      }

    }
    
    function take_picture_with_default_camera() {
      // Capture an image from the default camera on the device, using the default image settings
      Rho.Camera.take_picture({}, picture_taken_callback);
    }

    function take_picture_with_camera(cameraIndex) {
      var camera = cameras[cameraIndex];
      camera.take_picture({}, picture_taken_callback);
    }
    
    function choose_camera() {
      // get all available cameras
      cameras = Rho.Camera.enumerate();

      // build an HTML list
      var cameraList = "<ul>";
           
      for (var cameraIndex=0; cameraIndex<cameras.length; cameraIndex++) {
        var camera = cameras[cameraIndex];
        // Create a link for each camera with an onclick handler
        cameraList = cameraList +'<li><a href="#" class="take_picture_with_selected_camera" onclick="take_picture_with_camera('+cameraIndex+')">'+camera.cameraType+'</a></li>';
      }
      
      cameraList = cameraList+"</ul>";
      
      // make camera list visible to the user
      $("#camera_list").html(cameraList);
    }
    
    function determine_camera_capabilities() {
      var capabilitiesList = "<ul>"; 
    
      // Get all capabilities of the camera...
      var capabilities = Rho.Camera.getAllProperties();

      // ... compose a nicely formatted list with their names and values ...
      for (var capability in capabilities) {
        capabilitiesList+="<li>"+capability+": "+capabilities[capability]+"</li>";
      }

      capabilitiesList += "</ul>";
      
      // ... and show it
      $("#camera_capabilities").html(capabilitiesList);
    }
    
    function control_image_properties() {
      // Instead of accepting the defaults, let's set some properties to our liking
      
      // We will ask for a PNG file...
      Rho.Camera.compressionFormat = "png";
      
      // ...a particular image size...
      Rho.Camera.desiredWidth = 1024;
      Rho.Camera.desiredHeight = 768;
      
      // ...and force the flash to be used
      Rho.Camera.flashMode = "on";
      
      // Now, take the picture
      Rho.Camera.take_picture({}, picture_taken_callback);   
    }
    
    function select_picture_from_gallery() {
      Rho.Camera.choose_picture({}, picture_taken_callback);
    }
    
    function picture_taken_callback_save_to_gallery(params) {
      if (params["status"]=="ok") {
        Rho.Camera.saveImageToDeviceGallery(Rho.Application.expandDatabaseBlobFilePath(params["imageUri"]));
          
        alert("Image saved to gallery");
      }
    }
    
    function take_picture_and_save_it_to_gallery() {
      Rho.Camera.choose_picture({}, picture_taken_callback_save_to_gallery);
    }
    	
	return {
		take_picture_with_default_camera : take_picture_with_default_camera,
		choose_camera : choose_camera,
		determine_camera_capabilities : determine_camera_capabilities,
		control_image_properties : control_image_properties,
		take_picture_and_save_it_to_gallery : take_picture_and_save_it_to_gallery
	}

})(jQuery);