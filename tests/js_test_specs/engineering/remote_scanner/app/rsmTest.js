testCases = [
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothAuthentication Property",
		propertyName	:	"rsmBluetoothAuthentication",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothEncryption Property",
		propertyName	:	"rsmBluetoothEncryption",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothPinCode Property",
		propertyName	:	"rsmBluetoothPinCode",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["1234", "12345"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothPinCodeType Property",
		propertyName	:	"rsmBluetoothPinCodeType",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["UseStored", "PromptUser"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothReconnectionAttempts Property",
		propertyName	:	"rsmBluetoothReconnectionAttempts",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["30", "35", "40", "45", "50", "55", "60"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothBeepOnReconnectAttempt Property",
		propertyName	:	"rsmBluetoothBeepOnReconnectAttempt",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["false", "true"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothHidAutoReconnect Property",
		propertyName	:	"rsmBluetoothHidAutoReconnect",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["NeverReconnect", "ReconnectOnData", "ReconnectImmediately"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothFriendlyName Property",
		propertyName	:	"rsmBluetoothFriendlyName",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["FredTheScanner", "SmellySocks", "DonCorleone"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothInquiryMode Property",
		propertyName	:	"rsmBluetoothInquiryMode",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["General", "Limited"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmBluetoothAutoReconnect Property",
		propertyName	:	"rsmBluetoothAutoReconnect",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["none", "onPower", "onOutOfRange", "onPowerOutOfRange"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmForceSavePairingBarcode Property",
		propertyName	:	"rsmForceSavePairingBarcode",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmLowBatteryIndication Property",
		propertyName	:	"rsmLowBatteryIndication",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmLowBatteryIndicationCycle Property",
		propertyName	:	"rsmLowBatteryIndicationCycle",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["15", "30", "60", "90", "120"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmScanLineWidth Property",
		propertyName	:	"rsmScanLineWidth",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["wide", "narrow"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmGoodScansDelay Property",
		propertyName	:	"rsmGoodScansDelay",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["15000", "1000", "500", "300", "0", "200"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmDecodeFeedback Property",
		propertyName	:	"rsmDecodeFeedback",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["false", "true"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmIgnoreCode128Usps Property",
		propertyName	:	"rsmIgnoreCode128Usps",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmScanTriggerWakeup Property",
		propertyName	:	"rsmScanTriggerWakeup",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["false", "true"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmMems Property",
		propertyName	:	"rsmMems",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmProximityEnable Property",
		propertyName	:	"rsmProximityEnable",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmProximityContinuous Property",
		propertyName	:	"rsmProximityContinuous",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["true", "false"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmProximityDistance Property",
		propertyName	:	"rsmProximityDistance",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["Short", "Medium", "Long"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmPagingEnable Property",
		propertyName	:	"rsmPagingEnable",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["false", "true"]
	},
	{
		testName		:	"Testing setting and retrieving the rsmPagingBeepSequence Property",
		propertyName	:	"rsmPagingBeepSequence",
		propertyRW		: 	"RW",
		scannerTypes	:	"bluetooth",
		excludedDevices	:	"",
		excludedOS		:	"",
		values			:	["0", "5", "7", "10", "13", "15"]
	},
]



function setBarcodeProperty(propertyName, propertyValue)
{
	$.get('/app/RSMTest/setBarcodeProperty', {name:propertyName, value:propertyValue});
}
function getBarcodeProperty(propertyName)
{
	var returnedValue = "umbrella";	//  Function is asynchronous so this should not be returned
	$.get('/app/RSMTest/getBarcodeProperty', {name:propertyName})
		.always(function(data) 
			{
				document.getElementById('retProp').innerHTML = data;
				
			});
	return returnedValue;
}

function getBarcodePropertySync(propertyName)
{
	var returnedValue = "umbrella";	//  Function is asynchronous so this should not be returned
	jQuery.ajax({
         url:    '/app/RSMTest/getBarcodeProperty',
		 data: {name:propertyName},
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  
	return returnedValue;
}

function getScannerType()
{
	var returnedValue = "socks";
	jQuery.ajax({
         url:    '/app/RSMTest/getBarcodeProperty',
		 data: {name:"scannerType"},
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  
	return returnedValue;
}

function getScannerNumber()
{
	var returnedValue = 0;
	jQuery.ajax({
         url:    '/app/RSMTest/getScannerNumber',
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  
	return returnedValue;
}

//function barcodeEnable()
//{
//	$.get('/app/RSMTest/callBarcodeMethod', {method:'enable', dccParams:{}});
//}

function barcodeEnable()
{
		jQuery.ajax({
         url:    '/app/RSMTest/callBarcodeMethod',
		 data:	{method:'enable', dccParams:{}},
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  
}

function barcodeDisable()
{
		jQuery.ajax({
         url:    '/app/RSMTest/callBarcodeMethod',
		 data:	{method:'disable', dccParams:{}},
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  
}

function setDefaultScanner(id)
{
	var selectedScanner = "SCN" + (id + 1);
		jQuery.ajax({
         url:    '/app/RSMTest/setDefaultScanner',
		 data:	{specifiedScanner:selectedScanner},
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  	
}