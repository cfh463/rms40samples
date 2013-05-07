
function setBarcodeProperty(propertyName, propertyValue)
{
	$.get('/app/BarcodeTest/setBarcodeProperty', {name:propertyName, value:propertyValue});
}

function setBarcodePropertySync(propertyName, propertyValue)
{
	jQuery.ajax({
         url:    '/app/BarcodeTest/setBarcodeProperty',
		 data: {name:propertyName, value:propertyValue},
         async:   false
    });  
}

function getBarcodeProperty(propertyName)
{
	var returnedValue = "umbrella";	//  Function is asynchronous so this should not be returned
	$.get('/app/BarcodeTest/getBarcodeProperty', {name:propertyName})
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
         url:    '/app/BarcodeTest/getBarcodeProperty',
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
         url:    '/app/BarcodeTest/getBarcodeProperty',
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
         url:    '/app/BarcodeTest/getScannerNumber',
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  
	return returnedValue;
}

//function barcodeEnable()
//{
//	$.get('/app/BarcodeTest/callBarcodeMethod', {method:'enable', dccParams:{}});
//}

function barcodeEnable()
{
		jQuery.ajax({
         url:    '/app/BarcodeTest/callBarcodeMethod',
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
         url:    '/app/BarcodeTest/callBarcodeMethod',
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
         url:    '/app/BarcodeTest/setDefaultScanner',
		 data:	{specifiedScanner:selectedScanner},
         success: function(result) 	{
					returnedValue = result;
                  },
         async:   false
    });  	
}

function onDecodeEventRuby(data,source,type,time,length,direction)
{
	document.getElementById('retProp').innerHTML = data;
}