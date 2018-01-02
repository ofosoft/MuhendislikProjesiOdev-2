<html>
<head><!--#include file="bag.asp"-->
<title>İletişim Formu</title>
<meta http-equiv="Content-Language" content="tr" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<meta name="description" content="<%=meta1%>" />
<meta name="keywords" content="<%=meta2%>" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="javascript">
function invalid(frm) {
if (document.email.T1.value.length < 3){
alert("Yazdığınız İsim Bilgisi Yetersiz Veya Boş...");
frm.T1.focus()
return false;
}
if (document.email.T2.value.length < 5){
alert("Yazdığınız Mail Adresi Yetersiz Veya Boş...");
frm.T2.focus()
return false;
}
if (document.email.T4.value.length < 3){
alert("Yazdığınız Mesaj Konusu Yetersiz Veya Boş...");
frm.T4.focus()
return false;
}
if (document.email.T5.value.length < 10){
alert("Yazdığınız Mesaj Açıklama Bilgisi Yetersiz Veya Boş...");
frm.T5.focus()
return false;
}
if (document.email.captchacode.value.length < 1){
alert("Yazdığınız Güvenlik Kodu Eksik...");
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
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" bgcolor="#ffffff">
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
   <td><div align="left" class="style6 stil5 stil1"><strong>:<font color="#FF0000">*</font></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1">
     <input type="text" style="width:200px;font-weight:normal;color:#336666;text-decoration:none" name="T2" id="T2" size="48" />
   </div></td>
 </tr>
  <tr>
   <td><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">Telefon No </div>
   </div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>:</strong></div></td>
   <td><div align="left" class="style6 stil5 stil1">
     <input  name="T3" type="text" id="T3" style="width:200px;font-weight:normal;color:#336666;text-decoration:none" onKeyDown="dm()" size="20" maxlength="15" />
   </div></td>
 </tr>
 <tr>
   <td><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">Konu</div>
   </div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1">
     <input name="T4" type="text" id="T4" style="width:350px;font-weight:normal;color:#336666;text-decoration:none" value="" size="38">
   </div></td>
 </tr>

 <tr>
   <td valign="top" ><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">Mesajınız</div>
   </div></td>
   <td valign="top" ><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1">
     <textarea  name="T5" cols="38" style="width:350px;font-weight:normal;color:#336666;text-decoration:none" rows="7" id="T5"></textarea>
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
   <input name="captchacode" style="width:50px;font-weight:normal;color:#336666;text-decoration:none text-transform: uppercase" type="text" id="captchacode" size="8" maxlength="6"><strong> İşlemin Sonucunu Yazınız.</strong></div></td>
 </tr>
  <tr>
   <td><div align="right" class="style6 style7 stil2 stil5 stil1">
     <div align="right">Tarih</div>
   </div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td><div align="left" class="style6 stil5 stil1"><input style="width:150px;font-weight:normal;color:#336666;text-decoration:none" name="T6" type="text" id="T6" value="<%=now()%>" size="20" maxlength="20" readonly="true" /></div></td>
 </tr><tr>
   <td><div align="right"><span class="style3"><span class="style5"><span class="style7"><span class="style7"><span class="stil1"><span class="stil2"><span class="stil5"><span class="stil5"><span class="stil1"></span></span></span></span></span></span></span></span></span>
     
   </div></td>
   <td><div align="center"><span class="style3"><span class="style5"><span class="style7"><span class="style7"><span class="stil5"><span class="stil5"><span class="stil1"></span></span></span></span></span></span></span></div></td>
   <td><div align="left" class="style6 stil5 stil1"><strong>
     <input type="submit" style="width:100px;font-weight:normal;color:#000000;text-decoration:none" value="Gönder" name="B1" />
     &nbsp;&nbsp;&nbsp;
          <input type="reset" style="width:100px;font-weight:normal;color:#000000;text-decoration:none" name="button" id="button" value="Temizle" />
         </strong></div></td>
 </tr>
 <tr>
   <td colspan="3"><div align="center" class="stil6">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">(*) </font>İle İşaretli Alanların Doldurulması Zorunludur.</div></td>
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
       sorgum="select * from formmail"
	   Rs.Open Sorgum, Baglantim, 1, 3
	   rs.addnew
	   rs("ad_soyad")=postkontrol(Request.Form("T1"))		:	ad=Request.Form("T1")
	   rs("mail")=postkontrol(Request.Form("T2"))			: 	gonderenmail=Request.Form("T2")
   	   rs("tel")=postkontrol(Request.Form("T3"))			:	tel=Request.Form("T3")
   	   rs("konu")=postkontrol(Request.Form("T4"))			:	konu=Request.Form("T4")
   	   rs("mesaj")=Request.Form("T5")						: 	mesaj=Request.Form("T5")
   	   rs("tarih")=Request.Form("T6")   	   				: 	tarih=Request.Form("T6")
	   rs("durum")=false
   	   rs.update
	   rs.close%>
       
<%if 1>2 then
konu="İletişim Formu"%>
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
.HTMLBody =  "Sayın <b>Yetkili</b>;<br><b><a href="""&siteurl&""" target=""_blank"" title="""&siteslogan&""">" & siteadi & "</a></b>&nbsp;Siteniz üzerinden yeni " & konu &" gönderilmiştir.Mesaj Detayı Aşagıdakı Gibidir.<br>----------------------------------------------------------------<br>Gönderen : " & ad & "<br>----------------------------------------------------------------<br>Telefon : " & tel & "<br>----------------------------------------------------------------<br>Tarih : " & tarih & "<br>----------------------------------------------------------------<br>Mesaj : " & mesaj & "<br>----------------------------------------------------------------<br>İsterseniz sitenizdeki hesabınıza girirek mailleri okuyabilirsiniz...<br><br>"&siteyetkili&"<br><a href=""mailto:"&sitemail&"""> "&sitemail&"</a><br><a href="""&siteurl&""" target=""_blank"" title="""&siteslogan&""">" & siteadi & "</a><br><br>----------------------------------------------------------------------------------------------------------------<BR><b>NOT : </b><br>Bu mailin sizinle ilgilisi olmadığını düşünüyorsanız lütfen bize |<a href=""mailto:"&sitemail&"""> "&sitemail&"</a> | mail adresimizden bildiriniz."						'" "&siteadi			'	request("mail")
.Send
End with 
Set objCDOSYSMail1 = Nothing
end if
%>
 <br>
  <br><center>
  <img src="ofosoft_img/bilgi.png" width="128" height="128"><BR>
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff">
  Mesajınız Başarıyla Gönderilmiştir.<br>
  En Kısa Zamanda Okunup Değerlendirilecektir.<br>
  İlginiz için Teşekkürler...<br>
    <br>
    <font color="#ffffff"><%=siteadi%> Site Yönetimi Adına<br />
    <%=siteyetkili%></font><br/><BR></font></strong>
</center>

<%else%><center><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif" color="#ffffff"><br>
  Güvenlik Kodu Hatalı veya Eksik.<br>
  Lütfen Geri Dönüp Güvenlik Kodunu Doğru Bir Şekilde Tekrar Girin.</font></strong><br><br>
  <form><INPUT TYPE="button" VALUE="  Geri Dön  " onClick="history.go(-1)"></FORM>
   </center>
  <%end if%>
  <%end if%>
</body>
</html>
