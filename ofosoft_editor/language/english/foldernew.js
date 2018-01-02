function getText(s)
	{
	switch(s)
		{
		case "Folder already exists.": return "Yazma Izýnlerý Verilmemiþ.";
		case "Folder created.": return "KLASOR OLUSTURULDU.";
		case "Invalid input.": return "KLASOR ADI GIRILMEDI";
		}
	}	
function loadText()
	{
    document.getElementById("txtLang").innerHTML = "KLASOR ADI";
    document.getElementById("btnCloseAndRefresh").value = "KAPAT & YENILE";
    document.getElementById("btnCreate").value = "OLUSTUR";
	}
function writeTitle()
	{
	document.write("<title>YENI KLASOR OLUSTUR</title>")
	}
