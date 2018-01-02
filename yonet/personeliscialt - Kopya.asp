<table width="100%" border="0" cellpadding="2" cellspacing="0" >
  <tr>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Resim</div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Sicil No</div></td>
    <td class="altcizgiduz"><div align="left" style="font-weight: bold">Adý Soyadý / Dahili / Cep Telefonu</div></td> 
	<td width="100" class="altcizgiduz"><div align="left"><strong>Þubesi / Mail Adresi</strong></div></td>
	<td class="altcizgiduz"><div align="left" style="font-weight: bold">Ünvaný ve Fiili Görevi</div></td>
    <td class="altcizgiduz"><div align="left" style="font-weight: bold">Ýþ Durumu</div></td>
	<td class="altcizgiduz"><div align="center"><strong>Ýþlem</strong></div></td>
  </tr>
  <% if rs.eof or rs.bof then
		 else
			 shf = Request.QueryString("shf")
	 	 if shf="" then shf=1 end if %>
	  	<% rs.pagesize = 40
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
		   for i=1 to 40
		  if rs.eof then exit for 
		%><form name="form1" method="post" action="?islem=kisaguncelle&id=<%= rs("id") %>&shf=<%=shf%>">
    <tr class="altkesikcizgi">
     <td width="50" height="20" align="center" class="altcizgikesik" valign="top"><img onerror="src = '/ofosoft_img/resimyok.jpg'" src="/<%=rs("foto") %>" width="60" height="75" class="resimkenar" style="border-radius:5px;">
	 </td>
     <td width="70" align="center" class="altcizgikesik" valign="top" style="padding-top:15px;"><input name="sicil" type="text" id="sicil" value="<%= rs("sicil_no") %>" style="width:75px;"><br>
	 <input name="Button3" type="button" style="width:78px;" onClick="yenipencere('/ofosoft_editor/resimyukle.asp?id=<%= rs("id")%>&yer=foto<%=ss%>&klasor=personel_isci','','resizable=yes,status=yes,width=800,height=600')" value="Foto Yükle" />
	 </td>
     <td width="200" class="altcizgikesik" valign="top" style="padding-top:15px;"><input name="adi" type="text" id="adi" value="<%= rs("adi_soyadi") %>" style="width:195px;"><br>
	  <input name="dahili" type="text" id="dahili" value="<%= rs("dahili") %>" style="width:41px;">
	 <input name="ceptel" type="text" id="ceptel" value="<%= rs("ceptel") %>" style="width:145px;">
	 </td>
	 <td width="200" class="altcizgikesik" valign="top" style="padding-top:15px;"><%skodu= rs("subekodu") %>
	  <select name="subesi" id="subesi" style="width:230px;">
		<% ru.open "select * from subeler",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="<%= ru("sube_kodu") %>" <% if skodu=ru("sube_kodu") then  %>selected="selected" <% end if %>><%= ru("sube_adi") %></option>
		<% ru.movenext
		loop
		ru.close %>
      </select><br><input name="mail" type="text" id="mail" value="<%= rs("mail") %>" style="width:225px;">
	 
	 </td>
	 <td width="200" class="altcizgikesik" valign="top" style="padding-top:15px;"><input name="unvani" type="text" id="unvani" value="<%= rs("unvani") %>" style="width:200px;"><br>
	 <input name="gorev" type="text" id="gorev" value="<%= rs("fiili_gorev") %>" style="width:200px;">
	 </td>
     <td width="120" align="left" class="altcizgikesik" valign="top" style="padding-top:15px;">
	 <label>
  <input type="radio" name="durum" id="radio" value="1" <% if rs("durum")=1 then %>  checked="checked" <% end if %> />
  </label> 
  Çalýþýyor</br>
  <label>
  <input type="radio" name="durum" id="radio2" value="0" <% if rs("durum")=0 then %>  checked="checked" <% end if %> />
  </label>
Emekli</br>
<label>
<input type="radio" name="durum" id="radio3" value="2" <% if rs("durum")=2 then %>  checked="checked" <% end if %> />
</label> 
Tayin
	 </td>
	<td width="50" class="altcizgikesik" valign="top"><div align="center"><input name="guncelle" type="submit" id="guncelle" value="Güncelle" style="width:70px;" style="margin-bottom:3px;"><br>
	<a href="?islem=detay&id=<%= rs("id") %>"><img src="images/detay.png" border="0" /></a>
  <a href="?islem=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Personele Ait Tüm Kaydý Silmek Ýstediginizden Emin Misiniz?');"><img src="images/sil.png" border="0" /></a></div></td>
   </tr></form>
	 <% 
      rs.movenext
	next%>
 
  <tr>
    <td colspan="2" height="25">
    Toplam<b> <%=rs.recordcount %> </b> S/S</td>
    <td colspan="5" class="mc" align="center">						
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<b> <font color="red">[<%= y %>]</font></b>
							<% else
							if islem="kayitlarilistele" then%>
				 			 <a href="?shf=<%= y %>&ay=<%=ay %>&yil=<%=yil%>&sinif=<%=sinif%>&sicilno=<%=sicilno%>&islem=kayitlarilistele"><b><%= y %><b></a>
							<%else%>		
							 <a href="?shf=<%= y %>"><b><%= y %><b></a>
							<%end if
							end if
					next 
					end if%>
</td>
  </tr>
</table>