<!--#include file="sifre.asp"-->
<%if adminyetkisi=1 or adminyetkisi=2 then
yemekucreti=session("yemekucreti")	: yemektarihi=session("yemektarihi")

'Seçime göre gelecek tarih bölümü 
 if islem="kayitgetir" then
	tarihgetir=request.form("timestamp2")
	session("kayitgetirtarih")=tarihgetir
	parcala=split(tarihgetir,".")
	gun=parcala(0)	: ay=parcala(1)	: yil=parcala(2)
	if gun<10 then
	 gun="0"&gun&""
	end if
	starih=""&gun&"."&ay&"."&left(yil,4)&""
	session("yemektarihiliste")=starih
 end if
'Seçime göre gelecek tarih bölümü bitiþ

'Yeni yemek kaydetme baþlangýç 
 if islem="yemekkaydet" then
	 sorgum="select * from yemek_ucret"
	 rx.Open Sorgum, Baglantim, 1, 3
	 tarih=request.form("timestamp")
	 parcala=split(tarih,".")
	 gun=parcala(0)	: ay=parcala(1)	: yil=parcala(2)
	 if gun<10 then
	  gun="0"&gun&""
	 end if
	 yil=left(yil,4)
	 starih=""&gun&"."&ay&"."&yil&""
	  parcala2=split(request.form("adisoyadi"),"/")
	  session("yemekucreti")=request.form("ucret")
	  session("yemektarihi")=request.form("timestamp")
	  session("yemektarihiliste")=starih
	  rx.addnew
		gadet=request.form("adet")
	   if Request.Form("misafir")<>"" then
			tucret=7*gadet
		else
			if gadet>1 then
				fadet=gadet-1
				tucret1=parcala2(2)*1
				tucret2=7*fadet
				tucret=tucret1+tucret2
			else
				tucret=parcala2(2)*gadet
			end if
		end if	
		rx("tarih")=starih 
	 	rx("adisoyadi")=parcala2(1)
	 	rx("adet")=request.form("adet")
	 	rx("ucret")=tucret
	 	rx("nakit")=request.form("nakit")
		rx("sicilno")=parcala2(0)
	 	rx("sinif")=parcala2(3)
		rx.update
		' ay tablosuna ekleniyor
			sicilno=parcala2(0)
			sorgump="select * from yemek_ucretay where ay="&ay&" and yil="&yil&" and sicilno='"&sicilno&"' order by id desc"
			Rz.Open Sorgump, Baglantim, 1, 3
			if rz.recordcount=0 then
			 rz.addnew
			 rz("sicilno")=sicilno 
			 rz("adisoyadi")=parcala2(1)
			 rz("adet")=request.form("adet")
			 rz("ucret")=tucret
			 rz("ay")=ay
			 rz("yil")=yil
			 rz("sinif")=parcala2(3)
			 rz.update
			else
			 rz("adet")=rz("adet")+cint(request.form("adet"))
			 rz("ucret")=rz("ucret")+tucret
			 rz.update
			end if
			rz.close
		'ay tablosuna eklenme sonu
		
		
	Response.Redirect("giris.asp")
 end if
ltarih=session("yemektarihiliste")
if ltarih<>"" then
 ' response.write(ltarih)
 else 
 ltarih=date()
 end if
 'response.write(ltarih)
 'Yemek adetleri hesaplanýyor.
 yemeksayisi=0
 
'Seçime göre tarihleri veya kiþileri listeleme bölümü 
 if islem="kayitlarilistele" then
	bastarihi=request.form("timestamp3")		:	bittarihi=request.form("timestamp4")	:	sicilno=request.form("sicilno")
	session("yemektarihibaslangic")=bastarihi	:	session("yemektarihibitis")=bittarihi	:	session("aramasicilno")=sicilno
	if bastarihi<>"" then
	  parcala=split(bastarihi,".")				:	gun=parcala(0)	: ay=parcala(1)	: yil=parcala(2)
	  if gun<10 then
	   gun="0"&gun&""
	   end if
	   btarih=""&gun&"."&ay&"."&left(yil,4)&""
	else
	  btarih="01.01.1900"
	end if 
	if bittarihi<>"" then
	  parcala=split(bittarihi,".")				:	gun=parcala(0)	: ay=parcala(1)	: yil=parcala(2)
	  if gun<10 then
	   gun="0"&gun&""
	  end if
	else
	  btarih="01.01.2999"
	end if 
	bitarih=""&gun&"."&ay&"."&left(yil,4)&""
	'session("yemektarihiliste")=starih
 end if
'bölümü bitiþ
 
  if islem="kayitlarilistele" then
	if sicilno="tumu" then
	 sorgum="select * from yemek_ucret order by id desc"
	 'response.write(sicilno)
	else
	 sorgum="select * from yemek_ucret where sicilno like '%"&sicilno&"%'"&" order by id desc"
	 'response.write(sicilno)
	end if
  else
  'response.write(sicilno)
   sorgum="select * from yemek_ucret where tarih like '%"&ltarih&"%'"&" order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 do while not rs.eof
  if rs.eof then exit do
  yemeksayisi= rs("adet")+yemeksayisi
  rs.movenext
 loop	: rs.close
 ' hesaplama bitiþ.
%>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td width="300px" valign="top"><!--#include file="yemekucretsol.asp"--></td>
    <td valign="top">
<%
   if islem="kayitlarilistele" then
	if sicilno="tumu" then
	'strSQL = "SELECT * FROM Tablo WHERE CDBL(Tarih) BETWEEN "& CDBL(Tarih1) &" AND "& CDBL(Tarih2) &""
	 sorgum="select * from yemek_ucret where tarih='"& btarih &"' or tarih='"& bitarih &"' order by id desc"
	' response.write(sicilno)
	else
	 ' yemek ucretleri ay olarak kaydediliyor
	' ptu=0 : pty=0
	'sorgum="select * from yemek_ucret where sicilno='"&sicilno&"' order by id desc"
	' Rx.Open Sorgum, Baglantim, 1, 3
	' if rx.recordcount>0 then
	'  do while not rx.eof
	'  if rx.eof then exit do
	'    ptu=ptu+rx("ucret")		: pty=pty+rx("adet")
	'    padi=rx("adisoyadi")	: psf=rx("sinif")
 	' rx.movenext
	'loop
    'end if
	' rx.close
	 sorgum="select * from yemek_ucret where sicilno='"&sicilno&"' order by id desc"
	' response.write(sicilno)
	end if
  else
  'response.write(sicilno)
   sorgum="select * from yemek_ucret where tarih='"&ltarih&"' order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 Rz.Open Sorgum, Baglantim, 1, 3
 if rs.eof or rs.bof then
%>
<div align="center"><img src="/images/hata.png"><br><br/>Aradýðýnýz Kriterlere Ait Yemek Kaydý Bulunmamaktadýr...<br/><br/></div>
<%else
do while not rz.eof
	toplamyemek=toplamyemek+int(rz("adet"))
rz.movenext
loop
rz.close%>
<!--#include file="yemekucretsag.asp"-->
<%end if%>
</td>
  </tr>
</table>
<%
if kanal="sil" then %>
	<% rs.close
	sorgum="delete * from yemek_ucret where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
<%' end if
end if %>
<%else%>
<div align="center"><img src="../ofosoft_img/hata.png"><br><br />Ulaþmaya Çalýstýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br><%=siteadi%><br><br></div>
<%end if%>