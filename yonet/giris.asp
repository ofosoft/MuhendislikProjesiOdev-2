<%@LANGUAGE="VBSCRIPT" CODEPAGE="1254"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>..:: S�TE Y�NET�M� ::.. - OfoSoft Portal V1.5</title>
<!--#include file="bag.asp"-->
<% if Session("adminmi")<>"evet" then
	Response.Redirect("/giris.asp")
end if %>
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<link href="ofosoftfirma.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(img/yoneticibg.jpg);
	background-repeat:repeat-x;
	background-attachment: fixed;
	background-position: top-center;
	background-size:100% 100%;
-->
</style>
</head>
<body><br>
<%adminyetkisi=cint(session("adminyetkisi"))	:	akod=cint(session("adminyetkisi"))%>
<table width="1000px" border="0" cellpadding="2" cellspacing="2" align="center" id="tablokenar">
	<tr><td class="Menu">Y�NET�M PANEL� MEN�S�</td></tr>
	<tr><td id="menubg"><!--#include file="ustmenu.asp"--> </td></tr>
	<tr><td id="altzemin"><%=UCASE(Session("sayfa")) %> Y�netimi</td></tr>
    <tr>
		<td>			
			<% 
			islem=request.querystring("islem")
			select case Session("sayfa")
			case "" %>
				<!--#include file="anasayfa.asp"-->
	        <% case "yemek" %>
				<!--#include file="yemek.asp"-->
			<% case "anasayfa" %>
				<!--#include file="anasayfa.asp"-->
	        <% case "siparis" %>
				<!--#include file="siparis.asp"-->
	        <% case "etkinlik" %>
				<!--#include file="etkinlik.asp"-->
			<% case "ayarlar" %>
				<!--#include file="ayarlar.asp"-->
	        <% case "blok" %>
				<!--#include file="blok.asp"-->	
	        <% case "projeler" %>
				<!--#include file="paketler.asp"-->
	        <% case "proje_kat" %>
				<!--#include file="paket_kat.asp"-->				
	        <% case "etkinlik" %>
				<!--#include file="etkinlik.asp"-->
	        <% case "haber" %>
				<!--#include file="haber.asp"-->
			<% case "haber_kat" %>
				<!--#include file="haber_kat.asp"-->
	        <% case "sayfa" %>
				<!--#include file="sayfa_yon.asp"-->
	        <% case "kelimeler"%>
				<!--#include file="kelimeler.asp"-->
	        <% case "banner"%>
				<!--#include file="reklam.asp"-->
	        <% case "anket"%>
				<!--#include file="anket.asp"-->
	        <% case "album"%>
				<!--#include file="albumler.asp"-->
	        <% case "sayac"%>
				<!--#include file="Sayac.asp"-->
	        <% case "defter"%>
				<!--#include file="ziyaretcidefteri.asp"-->
	        <% case "saldiran"%>
				<!--#include file="saldiran.asp"-->				
	        <% case "hesap"%>
				<!--#include file="hesap.asp"-->
	        <% case "formmail"%>
				<!--#include file="formmail.asp"-->
	        <% case "memur_personel"%>
				<!--#include file="personelmemur.asp"-->
	        <% case "isci_personel"%>
				<!--#include file="personelisci.asp"-->
			<% case "projeler"%>
				<!--#include file="paketler.asp"-->
	        <% case "referans"%>
				<!--#include file="referans.asp"-->
	        <% case "galeri"%>
				<!--#include file="resimgalerisi.asp"-->
	        <% case "rezervasyonlar"%>
				<!--#include file="rezervasyon.asp"-->
	        <% case "guncel_bilgiler"%>
				<!--#include file="guncelbilgiler.asp"-->
	        <% case "yemek ucretleri"%>
				<!--#include file="yemekucret.asp"-->
	        <% case "aylik yemek ucretleri"%>
				<!--#include file="yemekucretay.asp"-->
			<% case "subeler"%>
				<!--#include file="subeler.asp"-->
	        <% case "proje_kat"%>
				<!--#include file="paket_kat.asp"--> 
			<% case "video"%>
				<!--#include file="videogalerisi.asp"-->
	        <% case "video_kat"%>
				<!--#include file="video_kat.asp"-->
	        <% case "misafirhane"%>
				<!--#include file="misafirhane.asp"-->
	        <% case "misafirhane_aylik"%>
				<!--#include file="misafirhane_aylik.asp"-->
			<% case "emlak arsiv"%>
				<!--#include file="emlakarsiv.asp"-->
			<% case "emlak projeler"%>
				<!--#include file="emlakprojeler.asp"-->
			<% case "emlak il listesi"%>
				<!--#include file="emlakillistesi.asp"-->
            <% end select%></td>
        </tr>
        <tr><td id="altzemin"><a href="/iletisim.asp" target="_blank" STYLE="color:#f8f8f8">Sivas Bilgi Teknolojileri �ube M�d�rl���</a></td></tr>
    </table>
</body>
</html>