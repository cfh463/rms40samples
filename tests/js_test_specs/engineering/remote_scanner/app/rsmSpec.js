describe("BluetoothScannerModuleTestSuite", function() {
	describe("Testing R+W RSM Property Retrieval in Ruby via AJAX for the Bluetooth Scanner.  ", function() {
	
		beforeEach(function() {
			document.getElementById('retProp').innerHTML = "blank";
		});
		
	
		afterEach(function() {
		});

		//  We need to hard code this information 
		var deviceOS = "windows"
		var deviceType = generic.OEMInfo;
		var currentK = -1;
		var scannerType = "bluetooth"
		
//		var numberOfScanners = getScannerNumber();
//		var scannerTypeUnderTest = "Laser";
				  
//		for (var k=0; k<numberOfScanners; k++)
//		{
			for ( var i=0; i<testCases.length; i++ ) 
			{ 
				for (var j=0; j<testCases[i].values.length; j++)
				{
					if (testCases[i].excludedDevices == "" || 
						(testCases[i].excludedDevices != "" && deviceType.toLowerCase().indexOf(testCases[i].excludedDevices.toLowerCase()) == -1))
					{
						if (testCases[i].excludedOS == "" || 
							(testCases[i].excludedOS != "" && deviceOS.toLowerCase().indexOf(testCases[i].excludedOS.toLowerCase()) == -1))
						{
							(function(idx, idj) 
							{ 
								it (testCases[idx].testName + " with Value " + testCases[idx].values[idj], function()
								{ 
									document.getElementById('retProp').innerHTML = "blank";
//									var currentScannerType = "";
//									var scannerFriendlyName = "";
//									runs(function() 
//									{
//										if (idk != currentK)
//										{
//											barcodeDisable();
//											setDefaultScanner(idk);
//											barcodeEnable();
//											document.getElementById('scannerReady').innerHTML = "no"
//											setTimeout(function(){document.getElementById('scannerReady').innerHTML = "yes"},10000);
//											waitsFor(function() 
//											{
//												return document.getElementById('scannerReady').innerHTML == "yes";
//											}, "Giving Scanner 10 seconds to enable", 11000);
//											currentK = idk;
//										}
										
										runs(function() 
										{
											//  We need to retrieve this here as the scanner is required to be enabled
//											currentScannerType = getBarcodePropertySync("scannerType");
									
											if (testCases[idx].scannerTypes.toLowerCase() == "all" ||
												testCases[idx].scannerTypes == "" ||
												testCases[idx].scannerTypes.toLowerCase() == "bluetooth")
											{
												runs(function() 
												{
													setBarcodeProperty(testCases[idx].propertyName, testCases[idx].values[idj]);
													var storedPropertyValue = getBarcodeProperty(testCases[idx].propertyName);
												});
										
												waitsFor(function() 
												{
													return document.getElementById('retProp').innerHTML != "blank";
												}, "Property didn't get retrieved", 5000);

												runs(function() 
												{
													expect(document.getElementById('retProp').innerHTML.toLowerCase()).toBe(testCases[idx].values[idj].toLowerCase());
												});
											}
										});
									//});
								}); 
							})(i, j); 
						}
					}
				}
			} 
		//}
	});
});
