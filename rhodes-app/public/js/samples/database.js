KitchenSink.Samples.Database = KitchenSink.Samples.Database || (function() {

	function open_db() {
		var db = new Rho.Database(Rho.Application.databaseFilePath('sample'), 'sample');
		return db;
	}
	
	function init_db() {
	    Rho.Log.info("Initializing database", "Init DB Sample");
	    var db = open_db();
	    Rho.Log.info("Database initialized", "Init DB Sample");
	    alert("Sample database initialized");
	    db.close();
	}
	
	function export_db() {
	   // export database
	   var export_path = Rho.Rhom.database_export("sample");
	   alert("Export path - " + export_path);
	}
	
	function import_db() {
		// export database
		var export_path = Rho.Rhom.database_export("sample");
		// import database
	    Rho.Rhom.database_import("sample",export_path);
	    alert("Database Import Succeeded");
	}
	
	function seed_db() {
		var db = open_db();

	    db.executeSql("Drop table if exists users_sample");
	    db.executeSql("Create table users_sample (user_id integer, active integer)");
	    db.executeSql("Insert into users_sample (user_id,active) values (0,1)");
	    db.executeSql("Insert into users_sample (user_id,active) values (1,1)");
	    db.executeSql("Insert into users_sample (user_id,active) values (2,1)");
	    db.executeSql("Insert into users_sample (user_id,active) values (3,1)");
	    db.executeSql("Insert into users_sample (user_id,active) values (4,1)");
	    db.executeSql("Insert into users_sample (user_id,active) values (5,1)");

	    db.executeSql("Drop table if exists products");
	    db.executeSql("Create table products (product_id integer, active integer)");    
	    db.executeSql("Insert into products (product_id,active) values (0,1)");
	    db.executeSql("Insert into products (product_id,active) values (1,1)");
	    db.executeSql("Insert into products (product_id,active) values (2,1)");
	    db.executeSql("Insert into products (product_id,active) values (3,1)");
	    db.executeSql("Insert into products (product_id,active) values (4,1)");
	    db.executeSql("Insert into products (product_id,active) values (5,1)");
	    db.executeSql("Insert into products (product_id,active) values (6,1)");
	    db.executeSql("Insert into products (product_id,active) values (7,1)");
	    db.executeSql("Insert into products (product_id,active) values (8,1)");
	    db.executeSql("Insert into products (product_id,active) values (9,1)");
	    
		db.close();
		
		alert("Database seeded successfully");
	}
	
	function transactions() {
	    // Let's assume we have a table called users_sample with a two columns, "user_id" and "active"
	    var db = open_db();

	    // Begin transaction
	    db.startTransaction();
	    
	    // Execute updates
	    db.executeSql("Delete from users_sample where active = 1");
	    
	    // Uh oh... maybe we should not really do that after all. Let's rollback the transaction
	    db.rollbackTransaction();

	    // At this point, our database is in exactly the same state as it was before we started.
	    // It's as if the "Delete" SQL statement had never existed
	    
	    // Now let's execute a different statement that we actually want
	    // Begin another transaction...
	    db.startTransaction();
	    
	    // Execute updates - we can issue multiple SQL commands within the same transaction
	    
	    db.executeSql("Update users_sample set active = 0 where user_id = 2");
	    db.executeSql("Update users_sample set active = 0 where user_id = 3");
	    db.executeSql("Update users_sample set active = 0 where user_id = 4");
	    db.executeSql("Update users_sample set active = 0 where user_id = 5");
	    
	    // This is the point of no return. After commitTransaction is called, all the updates will become permanent
	    db.commitTransaction();
	    
	    db.close();
	    
	    Rho.WebView.refresh();
	}

	return {
		init_db : init_db,
		export_db : export_db,
		import_db : import_db,
		seed_db : seed_db,
		transactions: transactions
	};

})();