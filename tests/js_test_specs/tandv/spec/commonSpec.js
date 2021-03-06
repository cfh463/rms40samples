var checkSource = "";
var deviceID = generic.UUID;
var moduleName = "";

//Name Parameter Getter and Setter
var Name = function (val){
	var value = val;

	this.getValue = function(){
		return value;
	};
   
	this.setValue = function(val){
		value = val;
	};
}

var objName = new Name();

var fillDetailsDiv = function(arr){

	var html = "<table><tr><td>"+arr[0][0]+"</td><td>"+arr[0][1]+"</td></tr>";
	for (var i = 1;i < arr.length; i++){

		if(arr[i][2] == "method"){
			html += "<tr><td colspan='2'>" + arr[i][0] + "." + arr[i][1] + "(); </td><tr>";
		}
		else{
			html += "<tr><td colspan='2'>" + arr[i][0] + "." + arr[i][1] + "=" + arr[i][2] + " </td><tr>";
		}

	}

	document.getElementById('detailsdiv').innerHTML = html;
	displayflag = false;
}

var setParams = function(arr){

	if(arr['0'] != "" || arr['1'] !=""){
		paramvalue = arr['2'];
		paramormethodname = arr['1'];
		objectname = arr['0'];

		if(paramormethodname == "destination"){
			checkDestination = paramvalue;
			moduleName = objectname;

			if(paramvalue.indexOf("http:") !== -1){
				var split = paramvalue.slice(0, -2)
				paramvalue = split + "?foldername="+deviceID+"')";
			}

			else if (paramvalue.indexOf("ftp:") !== -1){

				destinationPath = paramvalue.substring(0, Math.max(paramvalue.lastIndexOf("/"), paramvalue.lastIndexOf("\\\\"))); 
				var split = paramvalue.match(/'(.*?)'/);
				var filename = split[1].replace(/^.*[\\\/]/, '')

				paramvalue = destinationPath + "/" + deviceID + "/" + filename+"')";
			}
		}
		if(paramormethodname == "source"){
			checkSource = paramvalue
		}

		if(paramormethodname == "name"){
			objName.setValue(paramvalue);
		}

		if(paramvalue=="method")
		{
			try{
				eval(objectname)[paramormethodname]();
			}
			catch(err){
				alert(err.message);
			}
		}
		else
		{
			try{
				eval(objectname)[paramormethodname] = paramvalue;
			}
			catch(err){
				alert(err.message);
			}
		}
	}
}

var dispCurrentProcess = function (data){
	document.getElementById('detailsdiv').innerHTML = data;
}

var checkFileExist = function (){

	if(checkDestination){

		var m = checkDestination.match(/'(.*?)'/);
		destinationPath = m[1];

		if(destinationPath.indexOf("file:") !== -1){
			// Need To Remove this when File Exist API will be available
			fileExist = true;
			fileExistMsg = "OK: File Exist";
		}
		else if(destinationPath.indexOf("http:") !== -1 || destinationPath.indexOf("ftp:") !== -1 || destinationPath.indexOf(".") !== -1 || destinationPath.indexOf("..") !== -1){
			checkFileAtServer();
		}

	}
}

// Code to check files at Destination or not.
var checkFileAtServer = function(){

	var fileLocation = "";
	var filename = "";
	if(destinationPath.indexOf("http:") !== -1){
		destinationPath = destinationPath.substring(0, Math.max(destinationPath.lastIndexOf("/"), destinationPath.lastIndexOf("\\\\"))); 

		if(checkSource){
		var split = checkSource.match(/'(.*?)'/);
			filename = split[1].replace(/^.*[\\\/]/, '')
		}
		else if(moduleName == 'signatureCapture'){

			if(objName.getValue())
				filename = objName.getValue()+".bmp";
			else
				filename = "Signature.bmp";
			
		}
		else if(moduleName == 'imager'){

				filename = "Img";
			
		}

		var path = destinationPath + "/" + deviceID + "/" + filename;

	$.ajax({
	    	url:path,
	    	type:'HEAD',
			beforeSend: function (xhr){ 
			xhr.setRequestHeader("Authorization", "Basic " + "admin:Motorola@123");
			},
	    	success: function(msg){
	    		fileExist = true;
	    		fileExistMsg = "OK: File Exist";
   			},
		   error: function(jqXHR, textStatus, errorThrown){
		   		fileexist = false;
		   		fileExistMsg = "Error: In Ajax Call";
		   }
		});
	}
	else if(destinationPath.indexOf("ftp:") !== -1){

	var filename = destinationPath.replace(/^.*[\\\/]/, '');
	destinationPath = destinationPath.substring(0, Math.max(destinationPath.lastIndexOf("/"), destinationPath.lastIndexOf("\\\\"))); 
	var path = destinationPath + "/" + deviceID + "/" + filename;

    var msg = "";
        $.ajax({        
            type: 'POST',
            url: "http://192.168.6.18/jasmine/filecheck/fileexist.aspx",
            data: { path : path },
            success: function (msg) {
            	fileExist = true;
                fileExistMsg = msg ;
            },
            error: function(jqXHR, textStatus, errorThrown){
            	fileExist = false;
				fileExistMsg = "Error: In Ajax Call";
            },
            dataType: 'text'
        });
            }

	else if (destinationPath.indexOf(".") !== -1 || destinationPath.indexOf("..") !== -1){
					
	}

}

// Methods To Do All Stuff Before File Execution Start.
var beforeFileExecute = function (){

	// Create FTP Folder if The specified Device folder is not there.
	var url = "http://192.168.6.18/ciasp/createftpfolder/Default.aspx?newfolder="+deviceID;
	$.ajax({
		url:url,
		type:'HEAD',

		success: function(msg){

		},
	   error: function(jqXHR, textStatus, errorThrown){

	   }
	});

}

var extraInfoOnTop = function (testcaseId,testcaseDesc){

	var node=document.createElement("LI");
	var textnode =document.createTextNode(testcaseId + " - " + testcaseDesc);
	node.appendChild(textnode);
	document.getElementById("myList").appendChild(node);
	node = document.createElement("LI");
	var output = "Output:"+ '<br/>' + eventOutput;
	textnode=document.createTextNode(output);
	node.appendChild(textnode);
	document.getElementById("myList").appendChild(node);

}


