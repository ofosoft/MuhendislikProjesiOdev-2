<%Function gununsozu(x)
		ay=month(Now)
		gun=day(now)
		sorgum="Select * from olay where ay="&"'"&ay&"'"&" and gun="&"'"&gun&"'"
		Rf.Open Sorgum, Baglantim, 1, 3 %>
	
	<% if x="soz" then %>

		<%= rf("soz") %>
	<% end if%>
	
	<% if x="olay" then %>
		<li><%= rf("olay1")&"<br>" %></li>
		<li><%= rf("olay2")&"<br>" %></li>
		<li><%= rf("olay3")&"<br>" %></li>
	<% end if %>
<%  rf.close %>
<%  End Function  %>
<% Function menu_yaz()
		sorgum="Select * from sayfa where (id<>10 and id<>11) and goster=true"
		Rf.Open Sorgum, Baglantim, 1, 3  %>
		<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center">
			 
		 	<% do while not rf.eof %>
			 <tr><td align="center">
			<table width="100%" height="20" border="0" cellpadding="0" cellspacing="0" align="center">
			  <tr>
			    <td width="10"><img src="images/vurgu.gif"></td>
			    <td align="center"><div align="left"><a href="/sayfalar-<%= rf("id") %>-<%=cevir(rf("adi"))%>.html">&nbsp;&nbsp;<%= rf("adi") %></a></div></td>
			    <td width="10" align="center">&nbsp;</td>
			  </tr>
			</table></td></tr>
			<% rf.movenext
			loop
			Rf.close %>
			 
			</table>
<% End Function  %>

<%	
	Function reklam_goster(id)
		id=PostKontrol(id)
		sorgum="Select * from reklam where id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		bittarihi=rx("bitis")
		if bittarihi>date() then
 		 if rx("detay")<>"" then
		  Response.Write rx("detay")	
		 else
		  Response.Write ("<center>"&siteadi&"</center>")
		 end if
		else
		 response.write("<center>Bu Bannerin Süresi Dolmustur.</center>")
		end if
		Rx.close
	End Function 
	
	Function sayfa_goster(id)
		sorgum="Select * from sayfa where id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("<center>Kayýt Bulamadým</center>")
		else
			Response.Write rx("detay")
		end if
		Rx.close
	End Function 

	Function sayfa_baslik(id)
		id=PostKontrol(id)
		sorgum="Select * from sayfa where id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("Album Kaldýrýlmýþ.")
		else
			Response.Write rx("adi")
		end if
		Rx.close
	End Function 
	
	Function galeri_baslik(id)
		id=PostKontrol(id)
		sorgum="Select * from galeri_kat where goster=1 and id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("Album Kaldýrýlmýþ.")
		else
			Response.Write rx("isim")
		end if
		Rx.close
	End Function 

	Function video_baslik(id)
		id=PostKontrol(id)
		sorgum="Select * from video_kat where goster=1 and id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("Kategori Kaldýrýlmýþ.")
		else
			Response.Write rx("isim")
		end if
		Rx.close
	End Function 

	Function subebul(id)
		id=cint(id)
		sorgum="Select * from subeler where sube_kodu="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			subebul="Kategori Bulunamadý."
		else
			subebul=rx("sube_adi")
		end if
		Rx.close
	End Function 

	Function urun_aciklama(id)
		sorgum="Select * from urun_kat where goster=1 and id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			snc=""
		else
			snc=rx("detay")
		end if
		Rx.close
		urun_aciklama=snc
	End Function 	

	Function urun_altbaslik(aid)
		aid=PostKontrol(aid)
		sorgum="Select * from urun_altkat where goster=1 and id="&aid
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("Kategori Bulunamadý.")
		else
			Response.Write rx("isim")
		end if
		Rx.close
	End Function 

	Function urun_altaltbaslik(aid)
		aid=PostKontrol(aid)
		sorgum="Select * from urun_altkat2 where goster=1 and id="&aid
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("Kategori Bulunamadý.")
		else
			Response.Write rx("isim")
		end if
		Rx.close
	End Function 

	Function referans_katbaslik(id)
		id=PostKontrol(id)
		sorgum="Select * from referans_kat where goster=1 and id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("Kategori Kaldýrýlmýþ.")
		else
			Response.Write rx("isim")
		end if
		Rx.close
	End Function 

	Function paket_baslik(id)
		id=PostKontrol(id)
		sorgum="Select * from paket_kat where goster=1 and id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof or rx.bof then
			Response.Write("Paket Kaldýrýlmýþ.")
		else
			Response.Write rx("isim")
		end if
		Rx.close
	End Function 
	Function urun_say(id)
		sorgum="Select * from urun where kat_id="&id&" and goster=1"
		Rx.Open Sorgum, Baglantim, 1, 3 
		Response.Write rx.recordcount
		Rx.close
	End Function
	Function haber_sayisi()
		sorgum="Select * from haber where goster=true"
		Rx.Open Sorgum, Baglantim, 1, 3 
		Response.Write rx.recordcount
		Rx.close
	End Function 
	
	Function hesapla_urun(sektor)
		sektor=PostKondtrol(sektor)
	    Set Rx=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from urun where Skodu="&sektor  
		Rx.Open Sorgum, Baglantim, 1, 3 
		Response.Write Rx.recordcount
		Rx.close
	End Function
	
	Function hesapla_talep_alt(kodu)
		kodu=PostKontrol(kodu)
		tablo="talepler"
		sorgum="Select * from "&tablo&" where Altsektor="&kodu  
		Rf.Open Sorgum, Baglantim, 1, 3 
		Response.Write Rf.recordcount
		Rf.close
	End Function 

Function bcevir(metin)
	metin = Replace(metin, "a", "A")
	metin = Replace(metin, "b", "B")
	metin = Replace(metin, "c", "C")
	metin = Replace(metin, "ç", "Ç")
	metin = Replace(metin, "d", "D")
	metin = Replace(metin, "e", "E")
	metin = Replace(metin, "f", "F")
	metin = Replace(metin, "g", "G")
	metin = Replace(metin, "ð", "Ð")
	metin = Replace(metin, "h", "H")
	metin = Replace(metin, "i", "Ý")
	metin = Replace(metin, "ý", "I")
	metin = Replace(metin, "j", "J")
	metin = Replace(metin, "k", "K")
	metin = Replace(metin, "l", "L")
	metin = Replace(metin, "m", "M")
	metin = Replace(metin, "n", "N")
	metin = Replace(metin, "o", "O")
	metin = Replace(metin, "ö", "Ö")
	metin = Replace(metin, "p", "P")
	metin = Replace(metin, "r", "R")
	metin = Replace(metin, "s", "S")
	metin = Replace(metin, "þ", "Þ")
	metin = Replace(metin, "t", "T")
	metin = Replace(metin, "u", "U")
	metin = Replace(metin, "ü", "Ü")
	metin = Replace(metin, "v", "V")
	metin = Replace(metin, "w", "W")
	metin = Replace(metin, "x", "X")
	metin = Replace(metin, "y", "Y")
	metin = Replace(metin, "z", "Z")
 	bcevir = metin
End Function

Function kcevir(kelime)
	kelime = Replace(kelime, "A", "a")
	kelime = Replace(kelime, "B", "b")
	kelime = Replace(kelime, "C", "c")
	kelime = Replace(kelime, "Ç", "ç")
	kelime = Replace(kelime, "D", "d")
	kelime = Replace(kelime, "E", "e")
	kelime = Replace(kelime, "F", "f")
	kelime = Replace(kelime, "G", "g")
	kelime = Replace(kelime, "Ð", "ð")
	kelime = Replace(kelime, "H", "h")
	kelime = Replace(kelime, "I", "ý")
	kelime = Replace(kelime, "Ý", "i")
	kelime = Replace(kelime, "J", "j")
	kelime = Replace(kelime, "K", "k")
	kelime = Replace(kelime, "L", "l")
	kelime = Replace(kelime, "M", "m")
	kelime = Replace(kelime, "N", "n")
	kelime = Replace(kelime, "O", "o")
	kelime = Replace(kelime, "Ö", "ö")
	kelime = Replace(kelime, "P", "p")
	kelime = Replace(kelime, "R", "r")
	kelime = Replace(kelime, "S", "s")
	kelime = Replace(kelime, "Þ", "þ")
	kelime = Replace(kelime, "T", "t")
	kelime = Replace(kelime, "U", "u")
	kelime = Replace(kelime, "Ü", "ü")
	kelime = Replace(kelime, "V", "v")
	kelime = Replace(kelime, "W", "w")
	kelime = Replace(kelime, "X", "x")
	kelime = Replace(kelime, "Y", "y")
	kelime = Replace(kelime, "Z", "z")
 	Kcevir = kelime
End Function%>