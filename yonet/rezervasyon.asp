<!--#include file="sifre.asp"-->
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
	' CompactDatabase ""&db_veriyolu & ".mdb"
	Response.Redirect("giris.asp")
	end if
 end if
 ' Yemek adetleri hesaplanýyor.
 yemeksayisi=0
 sorgum="select * from yemek_rezervasyon order by id desc"
 Rs.Open Sorgum, Baglantim, 1, 3 
 do while not rs.eof
  if rs.eof then exit do
  yemeksayisi= rs("adet")+yemeksayisi
  rs.movenext
 loop	: rs.close
 ' hesaplama bitiþ.
 sorgum="select * from yemek_rezervasyon order by id desc"
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>
 		<table width="100%" border="0" cellpadding="3" cellspacing="0" >
  <tr>
    <td height="30" align="center">
	<form name="form1" method="post" action="?islem=guncelle">
		<input name="kapat" type="submit" id="kapat"<%if rezervasyon="acik" then%> value="Rezervasyonu Kapat" onclick="return confirm('Rezervasyon Verme Ýþlemi Kapatýlacaktýr?');" <%else%> value="Rezervasyonu Aç" onclick="return confirm('Rezervasyon Verme Ýþlemi Açýlacaktýr?');"<%end if%> class="buton">&nbsp;&nbsp;
	</form></td>
  </tr></table>
		<div align="center">
		<br />
 		Gelen Yeni Rezervasyon Bulunmamaktadýr...<br /><br />
 		</div>
    <%else 
    kanal= Request.QueryString("kanal")
    if kanal="" then 
%>	
<table width="100%" border="0" cellpadding="3" cellspacing="0" >
  <tr>
    <td colspan="5" height="30">
	<form name="form1" method="post" action="?islem=guncelle">
		<input name="kapat" type="submit" id="kapat"<%if rezervasyon="acik" then%> value="Rezervasyonu Kapat" onclick="return confirm('Rezervasyon Verme Ýþlemi Kapatýlacaktýr?');" <%else%> value="Rezervasyonu Aç" onclick="return confirm('Rezervasyon Verme Ýþlemi Açýlacaktýr?');"<%end if%> class="buton">&nbsp;&nbsp;
		<input name="temizle" type="submit" id="temizle" value="Tüm Kayýtlarý Sil" onclick="return confirm('Tüm Rezervasyon Kayýtlarý Silinecektir. Silmek Ýstediginizden Emin Misiniz?');" class="buton">&nbsp;&nbsp;
	</form></td> <td colspan="2" height="30">
	<form name="form1" target="_blank" method="post" action="rezervasyonyazdir.asp">
		<input name="kapat" type="submit" id="kapat" value="Rezervasyonlarý Yazdýr" class="buton">
	</form>
	</td>
  </tr>
  <tr>
    <td width="250" class="altcizgiduz"><div align="center"><strong>Rezervasyon Tarihi</strong></div></td>
    <td class="altcizgiduz"><div align="left" style="font-weight: bold">Adý Soyadý</div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Adet</div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Bilgisayar ÝP'si</div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Ýptal Kodu</div></td>
    <td colspan="2" class="altcizgiduz"><div align="center"><strong>Ýþlemler</strong></div></td>
  </tr>
  <%     if rs.eof or rs.bof then
		 else
			 shf = Request.QueryString("shf")
	 	 if shf="" then shf=1 end if %>
	  	<% rs.pagesize = 20
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
		   for i=1 to 20
		  if rs.eof then exit for 
		%>
    <tr class="altkesikcizgi">
     <td width="250" align="center" class="altcizgikesik"><strong><%= rs("tarih") %></strong></td>
     <td width="194" valign="middle" class="altcizgikesik"><%= rs("adi_soyadi") %></td>
     <td width="146" align="center" class="altcizgikesik"><%= rs("adet") %></td>
     <td width="345" align="center" class="altcizgikesik"><%= rs("ip") %></td>
     <td width="157" align="center" class="altcizgikesik"><%=rs("iptalkodu")%></td>
     <td width="50" align="middle" class="altcizgikesik">
  <div align="center"><a href="?sayfa=rezervasyonlar&amp;kanal=oku&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div></td>
  <td width="50" class="altcizgikesik"><div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Rezervasyonu Silmek Ýstediginizden Emin Misiniz?');"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>
	 <% 
      rs.movenext
	next%>
 
  <tr>
    <td colspan="2" height="30">
    Toplam<b> <%=rs.recordcount %> </b> Kiþi <b><em><%=yemeksayisi%></em></b> Yemek Sipariþ Etmiþtir.</td>
    <td colspan="5" class="mc" align="center">						
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<strong>[<%= y %>]</strong>
							<% else %>
				 			 <a href="?shf=<%= y %>"><%= y %></a>	
							<% end if
					next 
					end if%>
</td>
  </tr>
</table>

<% end if
if kanal="sil" then %>
	<% rs.close
	sorgum="delete * from yemek_rezervasyon where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
<% end if
if kanal="oku" then
	rs.close
	sorgum="select * from yemek_rezervasyon where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
 'rs("durum")=true
 rs.update
%>

  <table width="80%" border="0" cellpadding="5" cellspacing="5">
    <tr>
      <td width="192"><div align="right" style="font-weight: bold">
        <div align="right">Rezervasyon Tarihi : </div>
      </div></td>
      <td width="197">
        <%= rs("tarih") %></td>
      <td width="123"><div align="right" style="font-weight: bold">Yemek Adeti :</div></td>
      <td width="408" colspan="3">
      <%= rs("adet") %></td>
    </tr>
    <tr>
      <td width="192"><div align="right" style="font-weight: bold">
        <div align="right">Adý Soyadý : </div>
      </div></td>
      <td width="197">
      <label><%= rs("adi_soyadi") %></label></td>
      <td><div align="right" style="font-weight: bold">Telefon No :</div></td>
      <td colspan="3"><%= rs("tel") %></td>
    </tr>
    <tr>
      <td width="192"><div align="right" style="font-weight: bold">
        <div align="right">Ýptal Kodu : </div>
      </div></td>
      <td width="197">
      <label><%= rs("iptalkodu") %></label></td>
      <td><div align="right" style="font-weight: bold">Gönderenin ÝP'si :</div></td>
      <td colspan="3"><%= rs("ip") %></td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        Açýklama :</div></td>
      <td colspan="3" valign="top"><%= rs("aciklama") %></td>
    </tr>
    <tr>
      <td height="34">&nbsp;</td>
      <td><div align="right"><a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Rezervasyonu Silmek Ýstediginizden Emin Misiniz?');"><img src="images/sil.jpg" border="0" /></a>&nbsp;&nbsp;</td>
      <td><input type="button" value="  Geri Dön  " onclick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" /></td>
      <td>&nbsp;</td>
    </tr>
  </table>
<% end if
end if %>
<%else%>
<div align="center"><img src="../ofosoft_img/hata.png"><br><br />Ulaþmaya Çalýstýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br><%=siteadi%><br><br></div>
<%end if%>