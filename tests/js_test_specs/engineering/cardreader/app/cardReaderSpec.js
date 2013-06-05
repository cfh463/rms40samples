describe("CardReaderTestSuite", function() {
	describe("Testing Card Reader Module in Ruby via AJAX.  ", function() {
	
		beforeEach(function() {
			//Set card reader properties
			//setProperties();
		});
		
	
		afterEach(function() 
		{			
		});		
		
		//  Global Properties
		var pinTimeout = "5000";
		var pinEntry = "TRUE";
		var autoTab = "TRUE";
		var autoEnter = "TRUE";
		var moduleName = "DCR7000";
		var panData = "4292435445672345";
		
		it("AT55551 - opens the card reader", function() {			
			openCardReader();			
		});
		
		it("AT55552 - closes the card reader", function() {
			closeCardReader();	
		});
	});
});
