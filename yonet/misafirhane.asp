<!--#include file="sifre.asp"-->
<%if adminyetkisi=1 or adminyetkisi=5 then
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
	 sorgum="select * from misafirhane_ucret"
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
		rx("tarih")=starih 
	 	rx("adisoyadi")=parcala2(1)
	 	tucret=request.form("ucret")
	 	rx("ucret")=tucret
		rx("sicilno")=parcala2(0)
	 	rx("sinif")=parcala2(2)
		rx.update
		' ay tablosuna ekleniyor
			sicilno=parcala2(0)
			sorgump="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" and sicilno='"&sicilno&"' order by id desc"
			Rz.Open Sorgump, Baglantim, 1, 3
			if rz.recordcount=0 then
			 rz.addnew
			 rz("sicilno")=sicilno 
			 rz("adisoyadi")=parcala2(1)
			 rz("ucret")=tucret
			 rz("ay")=ay
			 rz("yil")=yil
			 rz("sinif")=parcala2(2)
			 rz.update
			else
			 rz("ucret")=rz("ucret")+replace(tucret,".",",")
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
	 sorgum="select * from misafirhane_ucret order by id desc"
	 'response.write(sicilno)
	else
	 sorgum="select * from misafirhane_ucret where sicilno like '%"&sicilno&"%'"&" order by id desc"
	 'response.write(sicilno)
	end if
  else
  'response.write(sicilno)
   sorgum="select * from misafirhane_ucret where tarih like '%"&ltarih&"%'"&" order by id desc"
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
    <td width="300px" valign="top"><!--#include file="misafirhanesol.asp"--></td>
    <td valign="top">
<%
   if islem="kayitlarilistele" then
	if sicilno="tumu" then
	'sorgun = "select * from tablo where cdbl(tarih) between "& CDBL(btarih) &" and "& CDBL(btarih) &""
	 sorgum="select * from misafirhane_ucret where tarih>='"& btarih &"' or tarih<='"& bitarih &"' order by id desc"
	else
	 sorgum="select * from misafirhane_ucret where sicilno='"&sicilno&"' order by id desc"
	end if
  else
   sorgum="select * from misafirhane_ucret where tarih='"&ltarih&"' order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then
%>
<div align="center"><img src="/images/hata.png"><br><br/>Aradýðýnýz Kriterlere Ait Kayýt Bulunmamaktadýr...<br/><br/></div>
<%else%>
		<!--#include file="misafirhanesag.asp"-->
<%end if%>
</td>
  </tr>
</table>
<%
if kanal="sil" then %>
	<% rs.close
	
	sorgum="delete * from misafirhane_ucret where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	sicilno=request.querystring("sicilno")
	ucret=request.querystring("ucret")
	ay=request.querystring("ay")
	ay=replace(ay,".","")
		sorgump="select top 1 * from misafirhane_ucretay where ay="&ay&" and sicilno='"&sicilno&"' order by id desc"
		Rz.Open Sorgump, Baglantim, 1, 3
		rz("ucret")=rz("ucret")-ucret
		rz.update
		rz.close
	Response.Redirect("giris.asp")
	%>
<%' end if
end if %>
<%else%>
<div align="center"><img src="../ofosoft_img/hata.png"><br><br />Ulaþmaya Çalýstýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br><%=siteadi%><br><br></div>
<%end if%>