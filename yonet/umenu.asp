<html>

<head>
<meta http-equiv="Content-Language" content="tr">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1254">
<title>Blog</title>
<style>
body
a:active
{
font-size: 11px;
font-family: tahoma;
color: #000000;
text-decoration: none;
}
a:link
{
font-size: 11px;
font-family: tahoma;
color: #000000;
text-decoration: none;
}
a:visited
{
font-size: 11px;
font-family: tahoma;
color: #000000;
text-decoration: none;
}
a:hover
{
font-size: 11px;
font-family: tahoma;
color: #FF0000;
text-decoration: none;
}


.blog a:active
{
font-size: 11px;
font-family: tahoma;
color: #fff;
font-weight:bold;
height:20px; width:100%; padding-top:1px; padding-bottom:1px;
}
.blog a:link
{
font-size: 11px;
font-family: tahoma;
color: #fff;
font-weight:bold;
height:20px; width:100%; padding-top:1px; padding-bottom:1px;
}
.blog a:visited
{
font-size: 11px;
font-family: tahoma;
color: #fff;
font-weight:bold;
height:20px; width:100%; padding-top:1px; padding-bottom:1px;
}
.blog a:hover
{
font-size: 11px;
font-family: tahoma;
font-weight:bold;
color: #3659f0;
text-decoration: none;
height:20px; width:100%; padding-top:1px; padding-bottom:1px;
background-image: url('images/kalt.gif'); background-repeat: repeat-x;border:1px solid #3F5D38;
}
</style>
</head>

<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0" height="40">
	<tr>
		<td width="12%" align="center"><div align="center"><font class="blog">
	  <a href="sayfa_sec.asp?sayfa=anasayfa" onMouseover="showit(0)">&nbsp;S�TE Y�NET�M�&nbsp;</a></font></div></td>
		<td width="10%" align="center"><div align="center"><font class="blog">
	  <a href="sayfa_sec.asp?sayfa=referans" onMouseover="showit(5)">REFERANSLAR</a></font></div></td>
		<td width="8%" align="center"><div align="center"><font class="blog">
			<a href="sayfa_sec.asp?sayfa=haber" onMouseover="showit(7)">&nbsp;HABERLER&nbsp;</a></font></div></td>
		<td width="8%" align="center"><div align="center"><font class="blog">
			<a href="sayfa_sec.asp?sayfa=rezervasyon" onMouseover="showit(7)" >&nbsp;REZERVASYONLAR&nbsp;</a></font></div></td>
		<td width="10%" align="center"><div align="center"><font class="blog">
			<a href="sayfa_sec.asp?sayfa=sayfa" onMouseover="showit(7)">&nbsp;SAYFALAR&nbsp;</a></font></div></td>
		<td width="9%" align="center"><div align="center"><font class="blog">
	  <a href="sayfa_sec.asp?sayfa=banner" onMouseover="showit(7)">&nbsp;BANNERLAR&nbsp;</a></font></div></td>
		<td width="11%" align="center"><div align="center"><font class="blog">
	  <a href="sayfa_sec.asp?sayfa=defter" onMouseover="showit(7)">&nbsp;KONUK DEFTER�&nbsp;</a></font></div></td>
		<td width="15%" align="center"><div align="center"><font class="blog">
			<a href="sayfa_sec.asp?sayfa=formmail" onMouseover="showit(7)" >&nbsp;S�TE FORM SERV�S�&nbsp;</a></font></div></td>
		<td width="12%" align="center"><div align="center"><font class="blog">
			<a href="#" onMouseover="showit(2)">&nbsp;D��ER AYARLAR&nbsp;</a></font></div></td>
	</tr>
</table>

<div align="center">
<table border="0" width="100%" height="20" id="table2" cellpadding="0" style="border:1px solid #3F5D38; border-collapse: collapse; margin-top:1px; margin-bottom:1px" bgcolor="#F8F8F8">
	<tr>
		<td width="95%" height="20" align="left" style="padding-left: 5px"><div id="describe" onMouseover="clear_delayhide()"><b><font face="Tahoma" style="font-size: 11px"><%=siteslogan%></font></b></div></td>
	</tr>
</table>
</div>
</body>

<script language="JavaScript1.2">
var submenu=new Array()
submenu[0]='<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=anasayfa">Y�netim Ana Sayfa</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=ayarlar">Site Ayarlar�</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=blok">Blok Ayarlar�</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=kelimeler">Kelime Ayarlar�</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=hesap">Site Y�neticileri</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=saldiran">Siteye Sald�ranlar</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=etkinlik">Etkinlikler & Duyurular</a>'
submenu[1]='<img src="images/bosluk.gif" width="150"  height="10"><img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=urun">�r�n Listesi</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=urun_kat">�r�n Kategorileri</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=urun_altkat">�r�n Alt Kategorileri</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=urun_altkat2">�r�n Alt Alt Kategorileri</a>'
submenu[2]='<img src="images/bosluk.gif" width="550"  height="10"><img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=sayac">Saya� Y�netimi</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=anket">Anket Y�netimi</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=galeri">Resim Galerisi</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=album">Galeri Kategorileri</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=video">Video Galerisi</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=video_kat">Video Kategorileri</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=yemek">Yemek Listesi Y�netimi</a>'
submenu[3]='<img src="images/bosluk.gif" width="300" height="10"><img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=projeler" >Projeler Y�netimi</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=proje_kat">Proje Kategorileri</a>'
submenu[4]='<img src="images/bosluk.gif" width="750" height="10"><img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=formmail">�leti�im Formlar�</a>'
submenu[5]='<img src="images/bosluk.gif" width="70" height="10"><img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=referans" >Referanslar Y�netimi</a>&nbsp;<img src="images/vurgu.gif">&nbsp;<a href="sayfa_sec.asp?sayfa=referans_kat">Referans Kategorileri</a>'
submenu[7]=''
var delay_hide=500
var menuobj=document.getElementById? document.getElementById("describe") : document.all? document.all.describe : document.layers? document.dep1.document.dep2 : ""

function showit(which){
clear_delayhide()
thecontent=(which==-1)? "" : submenu[which]
if (document.getElementById||document.all)
menuobj.innerHTML=thecontent
else if (document.layers){
menuobj.document.write(thecontent)
menuobj.document.close()
}
}

function resetit(e){
if (document.all&&!menuobj.contains(e.toElement))
delayhide=setTimeout("showit(-1)",delay_hide)
else if (document.getElementById&&e.currentTarget!= e.relatedTarget&& !contains_ns6(e.currentTarget, e.relatedTarget))
delayhide=setTimeout("showit(-1)",delay_hide)
}

function clear_delayhide(){
if (window.delayhide)
clearTimeout(delayhide)
}

function contains_ns6(a, b) {
while (b.parentNode)
if ((b = b.parentNode) == a)
return true;
return false;
}
</script>
</html>
