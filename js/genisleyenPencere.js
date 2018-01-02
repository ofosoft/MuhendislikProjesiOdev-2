
function genisleyenPencere(adres) {

if (document.all) 
{
	var genislikYap = 900;
	var genislikArtir = 8;
	var yukseklikYap = 700;
	var yukseklikArtir = 8;
	
	var yeniPencere = window.open("","","left=50,top=50,width=1,height=1,scrollbars=1,resizable=1");
    //img.OnClientClick = "window.open('urun_detay.aspx?ID=" + idno + "','x','width=550,height=550,resizable=no,scrollbars=yes,toolbar=no,userbar=no,location=no,statusbar=no,menubar=no,top=0,left=0');return false";

	for (yukseklik = 1; yukseklik < yukseklikYap; yukseklik += yukseklikArtir) 
	{
	yeniPencere.resizeTo("1", yukseklik);
	}	
	for (genislik = 1; genislik < genislikYap; genislik += genislikArtir) 
	{
	yeniPencere.resizeTo(genislik, yukseklik);
	}	
	yeniPencere.location = adres;
}
else
	window.location = adres;
}