<%shf=request("shf")
'tekrar listele bölümü
if islem="tekrarlistele" or listele="evet" then
	tskodu=int(Request("tskodu"))	
	tdurum=int(Request("tdurum"))
	tsayfa=int(Request("tsayfa"))	
	listele="evet"
end if
if tsayfa="" then
 tsayfa=250
end if

if islem="guncelle" then

'tümünü güncelleme bölümü
if Request.Form("tguncelle")<>"" then
	if listele="evet" then
 	 sorgum="select * from personel_memur where subekodu="&tskodu&" and durum="&tdurum&" order by adi_soyadi asc"
    else
     sorgum="select * from personel_memur order by adi_soyadi asc"
    end if
	rs.open sorgum, baglantim, 1, 3 
	do while not rs.eof
	'if rs.eof then exit do
		rs("subesi")=Request.Form("subesi_"&rs("id")&"")	:	rs("fiili_gorev")=Request.Form("gorev_"&rs("id")&"")
		rs("dahili")=Request.Form("dahili_"&rs("id")&"")	:	rs("ceptel")=Request.Form("ceptel_"&rs("id")&"")
		rs("mail")=Request.Form("mail_"&rs("id")&"")		:	rs("subekodu")=Request.Form("subesi_"&rs("id")&"")
		rs("sicil_no")=Request.Form("sicil_"&rs("id")&"")	:	rs("adi_soyadi")=Request.Form("adi_"&rs("id")&"")
		rs("unvani")=Request.Form("unvani_"&rs("id")&"")	:	rs("durum")=Request.Form("durum_"&rs("id")&"")
		if Request.Form("unvani_"&rs("id")&"")="4C" then
		  rs("unvank")=3
		end if 
		rs.update
	rs.movenext
	loop
end if

'kisa güncelleme bölümü
if Request.Form("guncelle")<>"" then
	rs.open "select * from personel_memur where id="&id,baglantim,1,3
	rs("subesi")=Request.Form("subesi_"&id&"")	:	rs("fiili_gorev")=Request.Form("gorev_"&id&"")
	rs("dahili")=Request.Form("dahili_"&id&"")	:	rs("ceptel")=Request.Form("ceptel_"&id&"")
	rs("mail")=Request.Form("mail_"&id&"")		:	rs("subekodu")=Request.Form("subesi_"&id&"")
	rs("sicil_no")=Request.Form("sicil_"&id&"")	:	rs("adi_soyadi")=Request.Form("adi_"&id&"")
	rs("unvani")=Request.Form("unvani_"&id&"")	:	rs("durum")=Request.Form("durum_"&id&"")
	if Request.Form("unvani_"&id&"")="4C" then
	 rs("unvank")=3
	end if 
	rs.update
end if

	rs.close
	if listele<>"evet" then
	Response.Redirect("giris.asp?shf="&shf&"")
	else
	Response.Redirect("giris.asp?shf="&shf&"&listele="&listele&"&tdurum="&tdurum&"&tskodu="&tskodu&"&tsayfa="&tsayfa&"")
	end if
end if

' Yeni Personel Ekle Bölümü
if islem="yenipersonel" then
		    sorgum="select * from personel_memur"
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
  			sorgum="delete * from personel_memur where id="&id
	    	Rs.Open Sorgum, Baglantim, 1, 3  
			hata "Personel Baþarýyla Silindi",16
			Response.Redirect("giris.asp?shf="&shf&"")
end if




%>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><a href="giris.asp?islem=yenipersonel"><img src="images/yenipersonel.png" border="0"></a></td>
    <form action="giris.asp?islem=tekrarlistele" name="form1" method="post" style="margin:0px; padding:0px;">
	<td>
	  <select name="tskodu" id="tskodu" style="width:230px;">
		<% ru.open "select * from subeler",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="<%= ru("sube_kodu") %>" <% if tskodu=ru("sube_kodu") then  %>selected="selected" <% end if %>><%= ru("sube_adi") %></option>
		<% ru.movenext
		loop
		ru.close %>
      </select></td><td>
	  <select name="tdurum" id="tdurum" style="width:150px;">
		<option value="1" <% if tdurum=1 then  %>selected="selected" <% end if %>>Çalýþanlar</option>
		<option value="0" <% if tdurum=0 then  %>selected="selected" <% end if %>>Emekli Olanlar</option>
		<option value="2" <% if tdurum=2 then  %>selected="selected" <% end if %>>Tayin Olanlar</option>
      </select></td><td>
	  <select name="tsayfa" id="tsayfa" style="width:50px;">
		<option value="25" <% if tdurum=25 then  %>selected="selected" <% end if %>>25</option>
		<option value="50" <% if tdurum=50 then  %>selected="selected" <% end if %>>50</option>
		<option value="100" <% if tdurum=100 then  %>selected="selected" <% end if %>>100</option>
		<option value="250" <% if tdurum=250 then  %>selected="selected" <% end if %>>250</option>
		<option value="500" <% if tdurum=500 then  %>selected="selected" <% end if %>>500</option>
      </select></td><td> <input name="tlistele" type="submit" id="tlistele" value="Tekrar Listele" style="width:100px;margin:5px;"> </td>
	</form>
  
 <td align="right" width="250px"></td>
  </tr>
  </table>