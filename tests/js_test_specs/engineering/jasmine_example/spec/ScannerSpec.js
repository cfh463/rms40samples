describe("ScannerModuleTestSuite", function() {
describe("B91030 - As a RhoElements app developer targetting Motorola Android devices \
	I want to use an API called Scanner to use the Motorola scanner capabilities from Javascript and EMML", function() {
	
	beforeEach(function() {
		document.getElementById("divOutput").innerHTML='Output goes here...';
		document.getElementById('textAreaOutput').value = 'Output goes here...';
		scanner.decodeEvent = '';
		scannerEnable();
	});
    
	
	afterEach(function() {
        scannerDisable();
	});
	
	it("AT15200 - The truth is the truth", function() {
		expect(true).toBe(true);
	});
	
	it("AT15201 - enables the scanner", function() {
		scannerEnable();
	});
	
	it("AT15202 - disables the scanner", function() {
		scannerDisable();
	});
	
	it("AT15204 - scans and output the scanned data as key strokes", function() {
		document.getElementById('textAreaOutput').focus()
		runs(function() {
			document.getElementById('textAreaOutput').value = '';
			scannerStart();
		}, "scanning and generate key strokes...");
		
		waitsFor(function() {
            return document.getElementById('textAreaOutput').value == "9780201546101"
        }, "Scanner didn't work", 10000);
	});
	
	it("AT15207 - scans and sends the scanned data to a callback", function() {
		runs(function() {
			scanToCallback();
		}, "scanning to callback...");
		
		waitsFor(function() {
            return document.getElementById("divOutput").innerHTML == "9780201546101"
        }, "Scanner didn't work", 10000);
	});
});
});
