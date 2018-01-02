<%shf=request("shf")

'kisa güncelleme bölümü
if islem="kisaguncelle" then
	rs.open "select * from personel_isci where id="&id,baglantim,1,3
	rs("subesi")=Request.Form("subesi")	:	rs("fiili_gorev")=Request.Form("gorev")
	rs("dahili")=Request.Form("dahili")	:	rs("ceptel")=Request.Form("ceptel")
	rs("mail")=Request.Form("mail")		:	rs("subekodu")=Request.Form("subesi")
	rs("sicil_no")=Request.Form("sicil")
	rs("adi_soyadi")=Request.Form("adi")
	rs("unvani")=Request.Form("unvani")
	rs("durum")=Request.Form("durum")
	rs.update
	rs.close
	Response.Redirect("giris.asp?shf="&shf&"")
end if

' Yeni Personel Ekle Bölümü
if islem="yenipersonel" then
		    sorgum="select * from personel_isci"
	    	Ra.Open Sorgum, Baglantim, 1, 3
			ra.addnew  
			ra("adi_soyadi")="....."
			ra("eklenme")=date()
			ra.update
			ra.close
'			Response.Redirect("giris.asp?hkodu="&hid&"")
end if

' personel silme bölümü
if Request.form("sil")<>"" or islem="sil" then
  			sorgum="delete * from personel_isci where id="&id
	    	Rs.Open Sorgum, Baglantim, 1, 3  
			hata "Personel Baþarýyla Silindi",16
			Response.Redirect("giris.asp?shf="&shf&"")
end if
%><a href="giris.asp?islem=yenipersonel"><img src="images/yenipersonel.png" border="0"></a>