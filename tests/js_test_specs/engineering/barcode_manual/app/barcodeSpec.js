describe("ScannerModuleTestSuite", function() {
	describe("Manual Scanner Tests.  ", function() {
	
		beforeEach(function() {
			document.getElementById('instruction').innerHTML = "Please Wait";
			document.getElementById('retProp').innerHTML = "";
		});
		
	
		afterEach(function() {
		});

		//  We need to hard code this information 
		var deviceOS = "windows"
		var deviceType = generic.OEMInfo;
		var currentK = -1;
		
		var numberOfScanners = getScannerNumber();
		var scannerTypeUnderTest = "Laser";
				  
		for (var k=0; k<numberOfScanners; k++)
		{
			(function(idk) 
			{ 
				it ("Scanning a barcode on scanner " + idk + " with device " + deviceType, function()
				{ 
					var currentScannerType = "";
					var scannerFriendlyName = "";
					runs(function() 
					{
						if (idk != currentK)
						{
							barcodeDisable();
							setDefaultScanner(idk);
							barcodeEnable();
							document.getElementById('scannerReady').innerHTML = "no"
							setTimeout(function(){document.getElementById('scannerReady').innerHTML = "yes"},10000);
							waitsFor(function() 
							{
								return document.getElementById('scannerReady').innerHTML == "yes";
							}, "Giving Scanner 10 seconds to enable", 11000);
							currentK = idk;
						}
						
						runs(function() 
						{
							waitsFor(function()
							{
								document.getElementById('instruction').innerHTML = "Scan the Test Barcode with " + getBarcodePropertySync("scannerType");
								return document.getElementById('retProp').innerHTML == "681131693387";
							}, "Scanned barcode did not get recorded", 60000);
						});
					});
				}); 
			})(k); 
		}
	});
});
