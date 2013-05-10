
function openCardReader()
{
	jQuery.ajax({
         url:    '/app/CardReaderTest/funopen',		
         async:   true	
	});
}

function closeCardReader()
{
	jQuery.ajax({
         url:    '/app/CardReaderTest/funclose',		 
         async:   true	
	});
}

function swipedata(data)
{	
	document.getElementById('output').innerHTML = data;
}

