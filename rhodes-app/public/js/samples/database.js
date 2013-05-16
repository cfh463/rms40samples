KitchenSink.Samples.Database = KitchenSink.Samples.Database || (function() {
	function transactions() {
		// Let's assume we have a table called Users with a two columns, "user_id" and "active"

		// Begin transaction
		Rho.Database.startTransaction();

		// Execute updates
		Rho.Database.executeSQL("Delete from Users where active = 1")

		// Uh oh... maybe we should not really delete those users after all. Let's rollback the transaction
		Rho.Database.rollbackTransaction();

		// At this point, our database is in exactly the same state as it was before we started.
		// It's as if the "Delete" SQL statement had never existed

		// Now let's execute a different statement that we actually want:

		// Begin another transaction...
		Rho.Database.startTransaction();

		// Execute updates - we can issue multiple SQL commands within the same transaction

		Rho.Database.executeSQL("Update Users set active = 0 where user_id = 2");
		Rho.Database.executeSQL("Update Users set active = 0 where user_id = 3");
		Rho.Database.executeSQL("Update Users set active = 0 where user_id = 4");
		Rho.Database.executeSQL("Update Users set active = 0 where user_id = 5");

		// This is the point of no return. After commit() is called, all the updates will become permanent
		Rho.Database.commit();
	}

	return {
		transactions: transactions
	};

})();