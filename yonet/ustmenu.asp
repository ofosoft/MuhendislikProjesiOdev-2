<link rel="stylesheet" type="text/css" href="ddsmoothmenu.css"/>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script type="text/javascript">
ddsmoothmenu.init({
	mainmenuid: "smoothmenu1", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})
</script>
<div id="smoothmenu1" class="ddsmoothmenu">
<ul>
 <%if adminyetkisi=1 then%>
<li><a href="sayfa_sec.asp?sayfa=anasayfa">Site Y�netimi</a>
 <ul>
  <li><a href="sayfa_sec.asp?sayfa=anasayfa">Y�netim Ana Sayfa</a></li>
  <li><a href="sayfa_sec.asp?sayfa=ayarlar">Site Ayarlar�</a></li>
  <li><a href="sayfa_sec.asp?sayfa=blok">Blok Ayarlar�</a></li>
  <li><a href="sayfa_sec.asp?sayfa=hesap">Site Y�neticileri</a></li>
  <li><a href="sayfa_sec.asp?sayfa=saldiran">Siteye Sald�ranlar</a></li>
  <li><a href="sayfa_sec.asp?sayfa=bakim">Sistem Bak�m�</a></li>
  <li><a href="sayfa_sec.asp?sayfa=kelimeler">Kelime Ayarlar�</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=0 or adminyetkisi=4 then%>
<li><a href="sayfa_sec.asp?sayfa=haber">��erik Y�netimi</a>
	<ul>
		<%if adminyetkisi=1 or adminyetkisi=0 then%>
		<li><a href="sayfa_sec.asp?sayfa=haber" >Haber Servisi Y�netimi</a>
			<ul>
				<li><a href="sayfa_sec.asp?sayfa=haber" >Haber Servisi Y�netimi</a></li>
				<li><a href="sayfa_sec.asp?sayfa=haber_kat">Haber Kategorileri</a></li>
			</ul>
		</li>
		<%end if%> 
		<li><a href="sayfa_sec.asp?sayfa=projeler">Projeler Y�netimi</a>
			<ul>
		   <li><a href="sayfa_sec.asp?sayfa=projeler">Projeler Y�netimi</a></li>
		   <li><a href="sayfa_sec.asp?sayfa=proje_kat">Proje Kategorileri</a></li>
		  </ul>
		</li>
		<li><a href="sayfa_sec.asp?sayfa=galeri">Resim Galerisi</a>
			<ul>
				<li><a href="sayfa_sec.asp?sayfa=galeri">Galerideki Resimler</a></li>
			   <li><a href="sayfa_sec.asp?sayfa=album">Galeri Kategorileri</a></li>
			</ul>
		</li>
		<li><a href="sayfa_sec.asp?sayfa=video">Video Galeregisi</a>
			<ul>
				<li><a href="sayfa_sec.asp?sayfa=video">Galerideki Videolar</a></li>
				<li><a href="sayfa_sec.asp?sayfa=video_kat">Video Kategorileri</a></li>
			</ul>
		</li>
		<li><a href="sayfa_sec.asp?sayfa=etkinlik" >Etkinlik Y�netimi</a>
	</ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=3 then%>
<li><a href="#">Personel</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=memur_personel">Memur Personel Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=isci_personel">���i Personel Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=subeler">�ubeler Listesi</a></li>
</ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=2 then%>
<li><a href="#">Yemekhane</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=yemek">Ayl�k Yemek Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=yemek ucretleri">Personel G�nl�k Yemek Kayd�</a></li>
    <li><a href="sayfa_sec.asp?sayfa=aylik yemek ucretleri">Personel Ayl�k Yemek Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=rezervasyonlar">Rezervasyon Kay�tlar�</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=5 then%>
<li><a href="#">Misafirhane</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=misafirhane">Personel G�nl�k Yemek Kayd�</a></li>
    <li><a href="sayfa_sec.asp?sayfa=misafirhane_aylik">Personel Ayl�k Yemek Listesi</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=10 then%>
<li><a href="#">Di�er ��erikler</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=anket">Anket Y�netimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=guncel_bilgiler">G�ncel Bilgiler Y�netimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=defter">Ziyaret�i Defteri</a></li>
    <li><a href="sayfa_sec.asp?sayfa=formmail">�leti�im Formu Mailleri</a></li>
	<li><a href="sayfa_sec.asp?sayfa=banner">Banner Alan� Y�netimi</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=0 or adminyetkisi=3 then%>
<li><a href="sayfa_sec.asp?sayfa=sayfa">Sayfalar</a></li>
<%end if
if adminyetkisi=1 or adminyetkisi=6 or adminyetkisi=7 then%>
<li><a href="#">Emlak Ar�iv</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=emlak arsiv">Emlak Ar�iv Y�netimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=emlak projeler">Emlak Projeler Y�netimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=emlak il listesi">�l - �l�e - K�y Listesi</a></li>
 </ul>
</li>
<%end if%>
<li><a href="logout.asp">Oturumu Kapat</a></li>
<li><a href="/default.asp" target="_blank">Siteyi A�</a></li>
</ul>
</div>


