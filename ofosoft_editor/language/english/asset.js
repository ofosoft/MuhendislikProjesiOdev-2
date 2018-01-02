function getText(s)
	{
	switch(s)
		{
		case "Cannot delete Asset Base Folder.":return "Cannot delete Asset Base Folder.";
		case "Delete this file ?":return "Dosya Silinsin Mi?";
		case "Uploading...":return "Yükleniyor...";
		case "File already exists. Do you want to replace it?":return "File already exists. Do you want to replace it?";
				
		case "Files": return "Files";
		case "del": return "Sil";
		case "Empty...": return "Empty...";
		}
	}
function loadText()
	{
	var txtLang = document.getElementsByName("txtLang");
	txtLang[0].innerHTML = "YENI KLASOR";
	txtLang[1].innerHTML = "KLASORU SIL";
	txtLang[2].innerHTML = "DOSYAYI YUKLE";
	
	var optLang = document.getElementsByName("optLang");
    optLang[0].text = "Tüm Dosyalar";
    optLang[1].text = "Video";
    optLang[2].text = "Resim";
    optLang[3].text = "Flash";
	
    document.getElementById("btnOk").value = " Kaydet ";
    document.getElementById("btnUpload").value = "Yükle";
	}
function writeTitle()
    {
    document.write("<title>Asset manager</title>")
    }