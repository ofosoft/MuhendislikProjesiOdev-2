function getText(s)
	{
    switch(s)
        {
		case "Folder deleted.": return "KLASOR SILINDI.";
		case "Folder does not exist.": return "YAZMA IZNI YOK.";
		case "Cannot delete Asset Base Folder.": return "SILINECEK KLASOR BULUNAMADI.";
        }
    }
function loadText()
	{
	document.getElementById("btnCloseAndRefresh").value = "KAPAT & YENILE";
	}
function writeTitle()
	{
	document.write("<title>KLASOR SIL</title>")
	}