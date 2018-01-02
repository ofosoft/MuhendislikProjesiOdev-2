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
<li><a href="sayfa_sec.asp?sayfa=anasayfa">Site Yönetimi</a>
 <ul>
  <li><a href="sayfa_sec.asp?sayfa=anasayfa">Yönetim Ana Sayfa</a></li>
  <li><a href="sayfa_sec.asp?sayfa=ayarlar">Site Ayarlarý</a></li>
  <li><a href="sayfa_sec.asp?sayfa=blok">Blok Ayarlarý</a></li>
  <li><a href="sayfa_sec.asp?sayfa=hesap">Site Yöneticileri</a></li>
  <li><a href="sayfa_sec.asp?sayfa=saldiran">Siteye Saldýranlar</a></li>
  <li><a href="sayfa_sec.asp?sayfa=bakim">Sistem Bakýmý</a></li>
  <li><a href="sayfa_sec.asp?sayfa=kelimeler">Kelime Ayarlarý</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=0 or adminyetkisi=4 then%>
<li><a href="sayfa_sec.asp?sayfa=haber">Ýçerik Yönetimi</a>
	<ul>
		<%if adminyetkisi=1 or adminyetkisi=0 then%>
		<li><a href="sayfa_sec.asp?sayfa=haber" >Haber Servisi Yönetimi</a>
			<ul>
				<li><a href="sayfa_sec.asp?sayfa=haber" >Haber Servisi Yönetimi</a></li>
				<li><a href="sayfa_sec.asp?sayfa=haber_kat">Haber Kategorileri</a></li>
			</ul>
		</li>
		<%end if%> 
		<li><a href="sayfa_sec.asp?sayfa=projeler">Projeler Yönetimi</a>
			<ul>
		   <li><a href="sayfa_sec.asp?sayfa=projeler">Projeler Yönetimi</a></li>
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
		<li><a href="sayfa_sec.asp?sayfa=etkinlik" >Etkinlik Yönetimi</a>
	</ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=3 then%>
<li><a href="#">Personel</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=memur_personel">Memur Personel Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=isci_personel">Ýþçi Personel Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=subeler">Þubeler Listesi</a></li>
</ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=2 then%>
<li><a href="#">Yemekhane</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=yemek">Aylýk Yemek Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=yemek ucretleri">Personel Günlük Yemek Kaydý</a></li>
    <li><a href="sayfa_sec.asp?sayfa=aylik yemek ucretleri">Personel Aylýk Yemek Listesi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=rezervasyonlar">Rezervasyon Kayýtlarý</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=5 then%>
<li><a href="#">Misafirhane</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=misafirhane">Personel Günlük Yemek Kaydý</a></li>
    <li><a href="sayfa_sec.asp?sayfa=misafirhane_aylik">Personel Aylýk Yemek Listesi</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=10 then%>
<li><a href="#">Diðer Ýçerikler</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=anket">Anket Yönetimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=guncel_bilgiler">Güncel Bilgiler Yönetimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=defter">Ziyaretçi Defteri</a></li>
    <li><a href="sayfa_sec.asp?sayfa=formmail">Ýletiþim Formu Mailleri</a></li>
	<li><a href="sayfa_sec.asp?sayfa=banner">Banner Alaný Yönetimi</a></li>
 </ul>
</li>
<%end if
if adminyetkisi=1 or adminyetkisi=0 or adminyetkisi=3 then%>
<li><a href="sayfa_sec.asp?sayfa=sayfa">Sayfalar</a></li>
<%end if
if adminyetkisi=1 or adminyetkisi=6 or adminyetkisi=7 then%>
<li><a href="#">Emlak Arþiv</a>
 <ul>
    <li><a href="sayfa_sec.asp?sayfa=emlak arsiv">Emlak Arþiv Yönetimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=emlak projeler">Emlak Projeler Yönetimi</a></li>
    <li><a href="sayfa_sec.asp?sayfa=emlak il listesi">Ýl - Ýlçe - Köy Listesi</a></li>
 </ul>
</li>
<%end if%>
<li><a href="logout.asp">Oturumu Kapat</a></li>
<li><a href="/default.asp" target="_blank">Siteyi Aç</a></li>
</ul>
</div>


