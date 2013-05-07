var scannerData = "";

function scannerEnable()
{
	scanner.enable();
}

function scannerDisable()
{
	scanner.disable();
}

function scannerStart()
{
	scanner.start();
}

function scanToCallback()
{
    scanner.decodeEvent = 'onScan(%json)';
	scanner.start();
}

function onScan(scanData)
{
	scannerData = scanData;
	document.getElementById("divOutput").innerHTML = scannerData.data;
}