<html>
<head><!--#include file="bag.asp"-->
<title>Deftere Mesaj Yaz</title>
<meta http-equiv="Content-Language" content="tr" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<meta name="description" content="<%=meta1%>" />
<meta name="keywords" content="<%=meta2%>" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function invalid(frm) {
if (document.email.T1.value.length < 3){
alert("Yazd���n�z �sim Bilgisi Yetersiz Veya Bo�...");
frm.T1.focus()
return false;
}
if (document.email.T5.value.length < 10){
alert("Yazd���n�z Mesaj Bilgisi Yetersiz Veya Bo�...");
frm.T5.focus()
return false;
}
if (document.email.captchacode.value.length < 1){
alert("Yazd���n�z G�venlik Kodu Eksik...");
frm.captchacode.focus()
return false;
}
return true;
}
</script>
<style type="text/css">
<!--
body {
	width:100%;
	height:100%;
	background-color:#ffffff;
	line-height:1;
	font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;

}
.stil1 {font-size: 11px}
.stil2 {font-size: 12px}
.stil4 {font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; }
.stil5 {font-family: Verdana, Arial, Helvetica, sans-serif}
.stil6 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 12px;
}
-->
</style>
</head>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0">
<%if request.QueryString("gonder")="" then%>
<form name="email" method="POST" action="?gonder=gonder" onSubmit="return invalid(email);">
<table width="100%" border="0" cellpadding="2" cellspacing="2">
 <tr><td width="45%"><div align="right" class="stil4 stil1">Ad Soyad</div></td>
   <td width="1%"><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td width="54%"><div align="left" class="style6 stil5 stil1">
     <input type="text" style="width:200px;font-weight:normal;color:#336666;text-decoration:none" name="T1" id="T1" size="48" />
   </div></td>
 </tr>
 <tr>
   <td><div align="right" class="style6 style7 stil2 stil5 stil1"> 
     <div align="right">Mail Adresi</div>
   </div></td>
   <td><div align="left" class="style6 stil5 stil1"><b>:</b></div></td>
   <td><div align="left" class="style6 stil5 stil1">
     <input type="text" style="width:200px;font-weight:normal;color:#336666;text-decoration:none" name="T2" id="T2" size="48" />
   </div></td>
 </tr>
 <tr>
   <td><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">Cinsiyet</div>
   </div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1">
   <select size="1" name="T4" style="width:150px;font-weight:normal;color:#336666;text-decoration:none" >
                 <option value="Bay">Bay</option>
                 <option value="Bayan">Bayan</option>
          </select>
   </div></td>
 </tr>
 <tr>
   <td><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">�ehir</div>
   </div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1">
   <select size="1" name="T6" style="width:150px;font-weight:normal;color:#336666;text-decoration:none" > <option>Sivas</option>
<option>Adana</option>
		        <option>Ad�yaman</option>
		        <option>Afyon</option>
		        <option>A�r�</option>
		        <option>Aksaray</option>
		        <option>Amasya</option>
		        <option>Ankara</option>
		        <option>Antalya</option>
		        <option>Ardahan</option>
		        <option>Artvin</option>
		        <option>Ayd�n</option>
		        <option>Bal�kesir</option>
		        <option>Bart�n</option>
		        <option>Batman</option>
		        <option>Bayburt</option>
		        <option>Bilecik</option>
		        <option>Bing�l</option>
		        <option>Bitlis</option>
		        <option>Bolu</option>
		        <option>Burdur</option>
		        <option>Bursa</option>
		        <option>�anakkale</option>
		        <option>�ank�r�</option>
		        <option>�orum</option>
		        <option>Denizli</option>
		        <option>Diyarbak�r</option>
		        <option>D�zce</option>
		        <option>Edirne</option>
		        <option>Elaz��</option>
		        <option>Erzincan</option>
		        <option>Erzurum</option>
		        <option>Eski�ehir</option>
		        <option>Gaziantep</option>
		        <option>Giresun</option>
		        <option>G�m��hane</option>
		        <option>Hakkari</option>
		        <option>Hatay</option>
		        <option>I�d�r</option>
		        <option>Isparta</option>
		        <option>��el</option>
		        <option>�stanbul</option>
		        <option>�zmir</option>
		        <option>Kahramanmara�</option>
		        <option>Karab�k</option>
		        <option>Karaman</option>
		        <option>Kars</option>
		        <option>Kastamonu</option>
		        <option>Kayseri</option>
		        <option>K�br�s</option>
		        <option>K�r�kkale</option>
		        <option>K�rklareli</option>
		        <option>K�r�ehir</option>
		        <option>Kilis</option>
		        <option>Kocaeli</option>
		        <option>Konya</option>
		        <option>K�tahya</option>
		        <option>Malatya</option>
		        <option>Manisa</option>
		        <option>Mardin</option>
		        <option>Mu�la</option>
		        <option>Mu�</option>
		        <option>Nev�ehir</option>
		        <option>Ni�de</option>
		        <option>Ordu </option>
		        <option>Osmaniye</option>
		        <option>Rize</option>
		        <option>Sakarya</option>
		        <option>Samsun</option>
		        <option>Siirt</option>
		        <option>Sinop</option>
		        <option>�anl�urfa</option>
		        <option>��rnak</option>
		        <option>Tekirda�</option>
		        <option>Tokat</option>
		        <option>Trabzon</option>
		        <option>Tunceli</option>
		        <option>U�ak</option>
		        <option>Van</option>
		        <option>Yalova</option>
		        <option>Yozgat</option>
		        <option>Zonguldak</option>
          </select>
   </div></td>
 </tr>
 <tr>
   <td valign="top" ><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">Mesaj�n�z</div>
   </div></td>
   <td valign="top" ><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1">
     <textarea  name="T5" cols="38" style="width:400px;font-weight:normal;color:#336666;text-decoration:none" rows="7" id="T5"></textarea>
   </div></td>
 </tr>
 <tr>
 <td>
  <div align="right" class="style2 style5 stil2 stil5 stil1">
    <div align="right"><%
   Randomize
   sayi1= int((Rnd * 15 )+1 ) : sayi2= int((Rnd * 5 )+1 ) %><%session("guvenliksonuc")=sayi1+sayi2%>
   <b><%=sayi1%> + <%=sayi2%> =   </div>
  </div> </td>
 <td><span class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></span></td>
 <td valign="top"><div align="left" class="style6 stil5 stil1">
   <input name="captchacode" style="width:50px;font-weight:normal;color:#336666;text-decoration:none text-transform: uppercase" type="text" id="captchacode" size="8" maxlength="6"><strong> ��lemin Sonucunu Yaz�n�z.</strong></div></td>
 </tr>
  <tr>
   <td><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">Tarih</div>
   </div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1"><input style="width:150px;font-weight:normal;color:#336666;text-decoration:none" name="T7" type="text" id="T6" value="<%=now()%>" size="20" maxlength="20" readonly="true" /></div></td>
 </tr><tr>
   <td></td>
   <td><div align="center"><span class="style3"><span class="style5"><span class="style7"><span class="style7"><span class="stil5"><span class="stil5"><span class="stil1"></span></span></span></span></span></span></span></div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>
     <input type="submit" style="width:100px;font-weight:normal;color:#000000;text-decoration:none" value="G�nder" name="B1" />
     &nbsp;&nbsp;&nbsp;
          <input type="reset" style="width:100px;font-weight:normal;color:#000000;text-decoration:none" name="button" id="button" value="Temizle" />
         </strong></div></td>
 </tr>
 <tr>
   <td colspan="3"><div align="center" class="stil6">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">(*) </font>�le ��aretli Alanlar�n Doldurulmas� Zorunludur.</div></td>
   </tr>
 </table>
</form>
<%end if%>
<% if request.QueryString("gonder")="gonder" then
   guvenliksonuc=cint(session("guvenliksonuc"))
   if Request.Form("captchacode")<>0 then
	gelensayi=cint(Request.Form("captchacode"))
	else
	gelensayi=1
   end if
 if guvenliksonuc=gelensayi then
       sorgum="select * from mesaj"
	   Rs.Open Sorgum, Baglantim, 1, 3
	   rs.addnew
	   rs("adi")=Request.Form("T1")			:	ad=Request.Form("T1")
	   rs("mail")=Request.Form("T2")		: 	gonderenmail=Request.Form("T2")
   	 '  rs("web")=Request.Form("T3")			:	tel=Request.Form("T3")
   	   rs("cinsiyet")=Request.Form("T4")	:	konu=Request.Form("T4")
   	   rs("sehir")=Request.Form("T6")
   	   rs("mesaj")=Request.Form("T5")			: 	mesaj=Request.Form("T5")
   	   rs("tarih")=now()			: 	tarih=Request.Form("T6")
	   rs("onay")=false
   	   rs.update
	   rs.close%>
       
<%if 1>2 then
konu="�leti�im Formu"%>
<%
serverip = "127.0.0.1"

Dim objCDOSYSCon1
Set objCDOSYSMail1 = Server.CreateObject("CDO.Message")
Set objCDOSYSCon1 = Server.CreateObject ("CDO.Configuration")
With objCDOSYSCon1
.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = serverip
.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25
.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 2000
.Fields.Update 
End With
Set objCDOSYSMail1.Configuration = objCDOSYSCon1
With objCDOSYSMail1 
.From = smtpmail					'	request("gonderen")
.to = sitemail						'	request("alici")
.Subject = 	"" & siteadi & " Sitenizden Yeni " & konu &" var"		'	""&request("konu")
.HTMLBody =  "Say�n <b>Yetkili</b>;<br><b><a href="""&siteurl&""" target=""_blank"" title="""&siteslogan&""">" & siteadi & "</a></b>&nbsp;Siteniz �zerinden yeni " & konu &" g�nderilmi�tir.Mesaj Detay� A�ag�dak� Gibidir.<br>----------------------------------------------------------------<br>G�nderen : " & ad & "<br>----------------------------------------------------------------<br>Telefon : " & tel & "<br>----------------------------------------------------------------<br>Tarih : " & tarih & "<br>----------------------------------------------------------------<br>Mesaj : " & mesaj & "<br>----------------------------------------------------------------<br>�sterseniz sitenizdeki hesab�n�za girirek mailleri okuyabilirsiniz...<br><br>"&siteyetkili&"<br><a href=""mailto:"&sitemail&"""> "&sitemail&"</a><br><a href="""&siteurl&""" target=""_blank"" title="""&siteslogan&""">" & siteadi & "</a><br><br>----------------------------------------------------------------------------------------------------------------<BR><b>NOT : </b><br>Bu mailin sizinle ilgilisi olmad���n� d���n�yorsan�z l�tfen bize |<a href=""mailto:"&sitemail&"""> "&sitemail&"</a> | mail adresimizden bildiriniz."						'" "&siteadi			'	request("mail")
.Send
End with 
Set objCDOSYSMail1 = Nothing
end if
%>
 <br>
  <br><center>
  <img src="ofosoft_img/bilgi.png" width="128" height="128"><BR>
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
  Mesaj�n�z Ba�ar�yla G�nderilmi�tir.<br>
  En K�sa Zamanda Onaylan�p Sitemizde Yay�nlanacakt�r.<br>
  �lginiz i�in Te�ekk�rler...<br>
    <br>
    <font><%=siteadi%> Site Y�netimi Ad�na<br />
    <%=siteyetkili%></font><br/><BR></font></strong>
</center>

<%else%><center><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
  G�venlik Kodu Hatal� veya Eksik.<br>
  L�tfen Geri D�n�p G�venlik Kodunu Do�ru Bir �ekilde Tekrar Girin.</font></strong><br><br>
  <form><INPUT TYPE="button" VALUE="  Geri D�n  " onClick="history.go(-1)"></FORM>
   </center>
  <%end if%>
  <%end if%>
</body>
</html>