<script language="javascript">
function invalid(frm) {
if (document.email.T1.value.length < 2){
alert("Yazdýðýnýz Ýsim Soyisim Bilgisi Yetersiz Veya Boþ...");
frm.T1.focus()
return false;
}
if (document.email.T2.value.length < 1){
alert("Yazdýðýnýz Yemek Adeti Yetersiz Veya Boþ...");
frm.T4.focus()
return false;
}
if (document.email.captchacode.value.length < 1){
alert("Yazdýðýnýz Güvenlik Kodu Eksik...");
frm.captchacode.focus()
return false;
}
return true;
}
</script>
<%if request.QueryString("gonder")="" then%>
<!--#include file="otomatiktamamla.asp"-->
<form name="email" method="POST" action="?gonder=gonder" onSubmit="return invalid(email);">
<table width="100%" border="0" cellpadding="2" cellspacing="2">
 <tr><td width="45%"><div align="right" class="stil4 stil1">Adýnýz Soyadýnýz</div></td>
   <td width="1%"><div align="left"><strong>:<strong><font color="#FF0000">*</font></strong></strong></div></td>
   <td width="54%"><div align="left">
     <input type="text" style="width:200px;font-weight:normal;color:#336666;text-decoration:none" name="T1" id="input" size="48" /> <b>Örn : <em style="color:#eb008c">Sehlan CAMCI</em></b>
   </div></td>
 </tr>
 <tr>
   <td><div align="right"> 
     <div align="right">Yemek Adeti</div>
   </div></td>
   <td><div align="left"><strong>:<font color="#FF0000">*</font></strong></div></td>
   <td><div align="left">
     <input type="text" style="width:50px;font-weight:normal;color:#336666;text-decoration:none" name="T2" id="T2" value="1" size="48" />
   </div></td>
 </tr>
  <tr>
   <td><div align="right">
     <div align="right">Telefon No </div>
   </div></td>
   <td><div align="left"><strong>:</strong></div></td>
   <td><div align="left">
     <input  name="T3" type="text" id="T3" style="width:200px;font-weight:normal;color:#336666;text-decoration:none" onKeyDown="dm()" size="20" maxlength="15" />
   </div></td>
 </tr>
 <tr>
   <td valign="top" ><div align="right">
     <div align="right">Açýklama</div>
   </div></td>
   <td valign="top" ><div align="left"><strong>:</strong></div></td>
   <td><div align="left">
     <textarea  name="T5" cols="38" style="width:350px;font-weight:normal;color:#336666;text-decoration:none" rows="5" id="T5"></textarea>
   </div></td>
 </tr>
 
 <tr>
 <td>
  <div align="right">
    <div align="right"><%
   Randomize
   sayi1= int((Rnd * 15 )+1 ) : sayi2= int((Rnd * 5 )+1 ) %><%session("guvenliksonuc")=sayi1+sayi2%>
   <b><%=sayi1%> + <%=sayi2%> =   </div>
  </div> </td>
 <td><span><strong>:<strong><font color="#FF0000">*</font></strong></strong></span></td>
 <td valign="top"><div align="left">
   <input name="captchacode" style="width:80px;font-weight:normal;color:#336666;text-decoration:none text-transform: uppercase" type="text" id="captchacode" size="8" maxlength="6"><strong> Ýþlemin Sonucunu Yazýnýz.</strong></div></td>
 </tr>
 <tr>
   <td><div align="right">
     <div align="right">ÝP Numaranýz</div>
   </div></td>
   <td><div align="left"><strong>:<strong></strong></strong></div></td>
   <td><div align="left"><input style="width:80px;font-weight:normal;color:#336666;text-decoration:none" name="T8" type="text" id="T8" value="<%=kip%>" size="20" maxlength="20" readonly="true" />
   Sahte kayýt kontrolü yapýlmaktadýr.</div></td>
 </tr>
 <tr>
   <td><div align="right">
     <div align="right">Tarih ve Saat</div>
   </div></td>
   <td><div align="left"><strong>:<strong></strong></strong></div></td>
   <td><div align="left"><input style="width:130px;font-weight:normal;color:#336666;text-decoration:none" name="T6" type="text" id="T6" value="<%=left(now(),16)%>" size="16" maxlength="16" readonly="true" /></div>
   <%session("iptalkodu")=int((Rnd * 10000 )+1 )%></td>
 </tr> 
<tr>
   <td></td>
   <td></td>
   <td><div align="left"><strong>
     <input type="submit" style="width:100px;font-weight:normal;color:#000000;text-decoration:none" value="Gönder" name="B1" />
     &nbsp;&nbsp;&nbsp;
          <input type="reset" style="width:100px;font-weight:normal;color:#000000;text-decoration:none" name="button" id="button" value="Temizle" />
         </strong></div></td>
 </tr>
 <tr>
   <td colspan="3"><div align="center" class="stil6">&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">(*) </font>Ýle Ýþaretli Alanlarýn Doldurulmasý Zorunludur.</div></td>
   </tr>
 </table>
 <div style="color:red; padding:15px;">NOT : Memur yemek yardýmý günlük 1 adet yemek ile sýnýrlýdýr. 2 ve üzeri yemeklerde sistem yemek ücretini 7 TL olarak hesaplamaktadýr.</div>
</form>
<%end if%>
<% if request.QueryString("gonder")="gonder" then
   guvenliksonuc=cint(session("guvenliksonuc"))
   adet=cint(Request.Form("T2"))
   if adet>3 then%>
   <center><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
  Rezervasyonunuz Kaydedilmedi...<br><br>Yemek Adeti En Fazla 3 Tane Yazýlabilir...<br><img src="images/hata.png"><br>
  Lütfen Geri Dönüp Yemek Adetinizi Düþürünüz.</font></strong><br><br>
  <form><INPUT TYPE="button" VALUE="  Geri Dön  " onClick="history.go(-1)"></FORM>
   </center>
   <%
   else
   
   
   if Request.Form("captchacode")<>0 then
	gelensayi=cint(Request.Form("captchacode"))
	else
	gelensayi=1
   end if
 if guvenliksonuc=gelensayi then
	   sorgum="select * from yemek_rezervasyon"
	   Rs.Open Sorgum, Baglantim, 1, 3
	   rs.addnew
	   if Request.Form("T1")="ofo" then
		rs("adi_soyadi")="Ömer Faruk ÖZTÜRK"
	   elseif Request.Form("T1")="ssö" then
		rs("adi_soyadi")="Þaban Semih ÖZKIRANARTLI"
	   elseif Request.Form("T1")="sc" then
		rs("adi_soyadi")="Sehlan CAMCI"
	   elseif Request.Form("T1")="yk" then
		rs("adi_soyadi")="Yusuf KAYA"		
	   elseif Request.Form("T1")="rs" then
		rs("adi_soyadi")="Rabia SELVÝ"			
	    elseif Request.Form("T1")="mb" then
		rs("adi_soyadi")="Mehmet BARDAKÇI"			
		else
		rs("adi_soyadi")=Request.Form("T1")
		end if	
	   rs("adet")=adet
   	   rs("tel")=Request.Form("T3")
   	   rs("aciklama")=Request.Form("T5")
   	   rs("tarih")=Request.Form("T6")
	   rs("iptalkodu")=session("iptalkodu")
	   rs("ip")=Request.Form("T8")
   	   rs.update
	   rs.close
	   session("guvenliksonuc")=0	
	  %>
  <br>
  <br><center>
  <img src="ofosoft_img/bilgi.png" width="128" height="128"><BR>
  <font size="2" face="Verdana, Arial, Helvetica, sans-serif">
  Rezervasyon Kaydýnýz Baþarýyla Gönderilmiþtir.<br>
  <br>
  Ýlginiz için Teþekkürler...<br>
    <br>
    <%=siteadi%> Site Yönetimi<br />
    <%=siteyetkili%><br/><BR>
	Rezervasyon Ýptal Kodunuz : <b><%=session("iptalkodu")%></b></font></strong>
<br><br>
<a href="yemekrezervasyon.asp"> ...::: Yeni Rezervasyon Yap :::...</a></center>
<%else%><center><strong><font size="2" face="Verdana, Arial, Helvetica, sans-serif"><br>
  Güvenlik Kodu Hatalý veya Eksik.<br><br><img src="images/hata.png"><br>
  Lütfen Geri Dönüp Güvenlik Kodunu Doðru Bir Þekilde Tekrar Girin.</font></strong><br><br>
  <form><INPUT TYPE="button" VALUE="  Geri Dön  " onClick="history.go(-1)"></FORM>
   </center>
  <%end if
  end if
  end if%>