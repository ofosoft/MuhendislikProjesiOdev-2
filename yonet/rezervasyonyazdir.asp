<%@LANGUAGE="VBSCRIPT" CODEPAGE="1254"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>..:: SİTE YÖNETİMİ ::.. - OfoSoft Portal V1</title>
<!--#include file="bag.asp"-->
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<link href="ofosoftfirma.css" rel="stylesheet" type="text/css">
</head>
<body onLoad="javascript:window.print();">
<%adminyetkisi=cint(session("adminyetkisi"))	:	akod=cint(session("adminyetkisi"))%>
<%if adminyetkisi=1 or adminyetkisi=2 then
 if islem="guncelle" then
   if request.form("kapat")<>"" then
	 sorgum="select * from ayarlar"
	 rx.Open Sorgum, Baglantim, 1, 3
	 if rezervasyon="acik" then
		rx("rezervasyon")="kapali" 
	 else
 		rx("rezervasyon")="acik"
	 end if	
	 rx.update
	Response.Redirect("giris.asp")
	end if
	if request.form("temizle")<>"" then
	 sorgum="delete * from yemek_rezervasyon"
	 rx.Open Sorgum, Baglantim, 1, 3
	Response.Redirect("giris.asp")
	end if
 end if
sorgum="select * from yemek_rezervasyon order by adi_soyadi asc"
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>
		<div align="center">
		<br />
 		Gelen Yeni Rezervasyon Bulunmamaktadır...<br /><br />
 		</div>
    <%else 
%>	
<table width="800px" border="0" cellpadding="3" cellspacing="0" align="center" class="kenarlik">
    <TR><TD COLSPAN="6" class="kalinbaslik">ONLİNE REZERVASYON LİSTESİ</td></tr>
  <tr>
    <td width="250" class="altcizgiduz"><div align="center"><strong>Rezervasyon Tarihi</strong></div></td>
    <td class="altcizgiduz"><div align="left" style="font-weight: bold">Adı Soyadı</div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Adet</div></td>
    <td class="altcizgiduz" height="25"><div align="center" style="font-weight: bold">Sonuç</div></td>
  </tr>
  <% yemeksayisi=0
		do while not rs.eof
		if rs.eof then exit do 
		%>
    <tr class="altkesikcizgi">
     <td width="250" height="25" align="center" class="altcizgiduz"><strong><%= rs("tarih") %></strong></td>
     <td width="194" valign="middle" class="altcizgiduz"><%= rs("adi_soyadi") %></td>
     <td width="146" align="center" class="altcizgiduz"><%= rs("adet") %><%yemeksayisi= rs("adet")+yemeksayisi %></td>
     <td width="345" align="center" class="altcizgiduz">&nbsp;</td>
  </tr>
	 <% 
      rs.movenext
	loop%>
 
  <tr>
    <td colspan="2" height="30">Toplam<strong> <%=rs.recordcount %> </strong>Adet Kayıt Bulunmaktad&#305;r. </td>
    <td colspan="3" align="center">Toplam<strong> <%=yemeksayisi%> </strong> Yemek Sayısı Vardır. 
</td>
  </tr>
</table>

<% end if
'end if %>
<%else%>
<div align="center"><img src="../ofosoft_img/hata.png"><br><br />Ulaşmaya Çalıstığınız Sayfaya Erişim Yetkiniz Bulunmamaktadır.<br /><br><%=siteadi%><br><br></div>
<%end if%>
<SCRIPT Language="Javascript">
function printit(){
if (window.print) {
window.print() ;
} else {
var WebBrowser = '<OBJECT ID="WebBrowser1" WIDTH=0 HEIGHT=0 CLASSID="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"></OBJECT>';
document.body.insertAdjacentHTML('beforeEnd', WebBrowser);
WebBrowser1.ExecWB(6, 2);
}
}
      </script>
</body>
</html>