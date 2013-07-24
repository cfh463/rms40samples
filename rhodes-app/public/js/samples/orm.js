KitchenSink.Samples.ORM = KitchenSink.Samples.ORM || (function() {

	function create_model() {
		var model = get_model();
		if (!model) {
			model = Rho.ORM.addModel(function(model) {
				model.modelName("Product");
				model.enable("sync");
				model.property("name", "string");
				model.property("brand", "string");
				model.property("price", "float");
				model.set("partition", "user");
			});
		}
		return model;
	}
	
	function get_model() {
		var model = Rho.ORM.getModel("Product");
		return model;
	}
	
	function if_model_exists(callback) {
		var model = get_model();
		if (!model) {
			alert("The \"Product\" model does not exist. Please create it before running this sample");
			return false;
		} else {
			if (callback) {
				return callback(model);
			}
		}
	}
	
	function create_object() {
		var product = if_model_exists(function(model) {
			var product = model.create({
				  brand: 'Motorola',
				  name: 'ET1',
				  price: 199.99});	
			return product
		});
		
		
	}

	return {		
		create_model : create_model,		
		create_object : create_object
	};

})();