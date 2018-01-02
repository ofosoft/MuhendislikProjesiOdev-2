<!--#include file="sifre.asp"-->
<%if adminyetkisi=1 or adminyetkisi=5 then
yemekucreti=session("yemekucreti")	: yemektarihi=session("yemektarihi")

yemeksayisi=0
 
'Seçime göre tarihleri veya kiþileri listeleme bölümü 
 if islem="kayitlarilistele" then
	ay=request("ay")			:	yil=request("yil")				:	sinif=request("sinif")			:	sicilno=request("sicilno")
	session("ayyemekay")=ay		:	session("ayyemekyil")=yil		:	session("ayyemeksinif")=sinif	:	session("ayaramasicilno")=sicilno
	if sicilno="tumu" then
	  sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" and sinif="&sinif&" order by adisoyadi asc"
 	 else
	  sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" and sinif="&sinif&" and sicilno like '%"&sicilno&"%'"&" order by adisoyadi asc"
	end if
  else
   ay=month(date) : yil=year(date)
   sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" order by adisoyadi asc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 do while not rs.eof
  if rs.eof then exit do
  yemeksayisi= rs("adet")+yemeksayisi
  rs.movenext
 loop	: rs.close
 'hesaplama bitiþ.

if kanal="sil" then
 'rs.close
	sorgum="delete * from misafirhane_ucretay where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
end if	

if Request.Form("guncelle")<>"" then
	rs.open "select * from misafirhane_ucretay where id="&id,baglantim,1,3
	adet=int(Request.Form("adet"))
	rs("adet")=adet
	if rs("sinif")=1 then
	 rs("ucret")=adet*5.50
	elseif rs("sinif")=0 then
	 rs("ucret")=adet*4.00
	end if	
	'rs("sifre")=Request.Form("sifre")
	'rs("mail")=Request.Form("mail")
	'rs("yetki")=Request.Form("yetki")
	rs.update
	rs.close
	Response.Redirect("giris.asp")
end if
%>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td width="300px" valign="top"><!--#include file="misafirhaneaylikust.asp"--></td></tr>
    <tr><td valign="top">
<%
   if islem="kayitlarilistele" then
	if sicilno="tumu" then
	 sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" and sinif="&sinif&" order by adisoyadi asc"
	else
	 sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" and sinif="&sinif&" and sicilno='"&sicilno&"' order by adisoyadi asc"
	end if
  else
   sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" order by adisoyadi asc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then
%>
<div align="center"><img src="/images/hata.png"><br><br/>Aradýðýnýz Kriterlere Ait Kayýt Bulunmamaktadýr...<br/><br/></div>
<%else%>
<!--#include file="misafirhaneaylikalt.asp"-->
<%end if%>
</td>
  </tr>
</table>
<%else%>
<div align="center"><img src="/ofosoft_img/hata.png"><br><br />Ulaþmaya Çalýstýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br><%=siteadi%><br><br></div>
<%end if%>