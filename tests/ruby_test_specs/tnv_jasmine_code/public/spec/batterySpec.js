var intervalcount = 0;
var sampleInterval = "" ;

var startBatterySet = function (arrFile){

	describe("Battery Module Test Starts Here", function() {

		describe(arrFile[0][0] + " - " + arrFile[0][1],function(){
		
			beforeEach(function() {
				m = 1;
			});

			it("Display TestCase/Set Params", function() {
			
				runs(function(){
					fillDetailsDiv(arrFile);
					setTimeout(function() {
	        			displayflag = true;
	     			}, 9000);
				});

				waitsFor(function() {
	    			return displayflag;
	    		}, "Interval after Div Updates", 10000);

				for (var k = 1; k < arrFile.length; k++){

					runs(function() {
						//Common Method to Set the Parameters
						setParams(arrFile[m]);
	    				flag = false;
	      				setTimeout(function() {
	        			flag = true;
	     				}, 2000);
	     				m++;
		    		});

		    		waitsFor(function() {
						dispCurrentProcess(arrFile[m-1]+" Executed");
		    			return flag;
		    		}, "Interval Between Each API Call", 5000);

				}

	 		    runs(function(){
					expect(flag).toBeTruthy();
					window.scrollTo(0,document.body.scrollHeight);
				});

			});

		});

	});
}

var startSampleInterval = function (arrFile){


	describe("Battery Sample Interval Test Starts Here", function() {

		describe(arrFile[0][0] + " - " + arrFile[0][1],function(){

			beforeEach(function() {
				$.get('/app/Auto/reset');
				eventFired = false;
				intervalcount = 0;
				m = 1;
			});

			it("Display TestCase/Set Params", function() {
			
				runs(function(){
					fillDetailsDiv(arrFile);
					setTimeout(function() {
	        			displayflag = true;
	     			}, 9000);
				});

				waitsFor(function() {
	    			return displayflag;
	    		}, "Interval after Div Updates", 10000);

				for (var k = 1; k < arrFile.length; k++){

					runs(function() {
						//Common Method to Set the Parameters
						setParams(arrFile[m]);
	    				flag = false;
	      				setTimeout(function() {
	        			flag = true;
	     				}, 2000);
	     				m++;
		    		});

		    		waitsFor(function() {
						dispCurrentProcess(arrFile[m-1]+" Executed");
		    			return flag;
		    		}, "Interval Between Each API Call", 5000);

				}
				
				runs(function() {
	    		});

	    		waitsFor(function() {

					if(eventFired){
		      			var node=document.createElement("LI");
						var textnode =document.createTextNode(arrFile[0][0] + " - " + arrFile[0][1]);
						node.appendChild(textnode);
						document.getElementById("myList").appendChild(node);
		      			node=document.createElement("LI");
		      			var output = "Output:"+ '<br/>' + eventOutput;
		      			textnode=document.createTextNode(output);
		      			node.appendChild(textnode);
						document.getElementById("myList").appendChild(node);
						eventFired = false;
					}

					if((60000/5000) == intervalcount){
						intervalcount = 0;
						eventOutput = "";
						sampleInterval = "";
						return true;
					}

	    			else{
						dispCurrentProcess("Counting the Event Fired Count for 1 Mins<br/>Current count is:"+intervalcount);
	      				return false;
	      			}

    			}, "Interval count should be"+ (60000/5000), 60000);

	    		runs(function(){
					//expect(flag).toBeTruthy();
					//window.scrollTo(0,document.body.scrollHeight);
				});

			});
		});
	});
}

//CallBack Method Implementation

function getsettingsjsFunction(theOutput)
{

	intervalcount++;
	eventOutput = theOutput + " "+ intervalcount;
	eventFired = true;
}

function smartBatteryjsonFunction(theOutput){

	intervalcount++;
	eventOutput = theOutput + " "+ intervalcount;
	eventFired = true;
}