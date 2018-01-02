<table width="100%" border="0" cellpadding="3" cellspacing="0" >
  <tr>
    <td width="150" class="altcizgiduz"><div align="center"><strong>Yemek Tarihi</strong></div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Sicil No</div></td>
    <td class="altcizgiduz"><div align="left" style="font-weight: bold">Adý Soyadý</div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Adet</div></td>
    <td class="altcizgiduz"><div align="right" style="font-weight: bold">T.Ücret</div></td>
    <td class="altcizgiduz"><div align="center" style="font-weight: bold">Ödeme</div></td>
    <td class="altcizgiduz"><div align="center"><strong>Ýþlem</strong></div></td>
  </tr>
  <% if rs.eof or rs.bof then
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
     <td width="130" align="right" class="altcizgikesik"><strong><%= rs("tarih") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
     <td width="130" align="center" class="altcizgikesik"><%= rs("sicilno") %></td>
     <td width="400" class="altcizgikesik"><%= rs("adisoyadi") %></td>
     <td width="50" align="center" class="altcizgikesik"><%= rs("adet") %></td>
     <td width="120" align="right" class="altcizgikesik">
	 <%yazi= rs("ucret")
	sonuc = InStr(1,yazi, ",")
	if sonuc<>0 then
	 response.write (""&rs("ucret")&"0")
	else
	 response.write (""&rs("ucret")&",00")
	end if%> TL</td>
     <td width="157" align="center" class="altcizgikesik"><%if rs("nakit")=true then%>Nakit<%else%>Veresiye<%end if%></td>
  <td width="50"><div align="center">
  <a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Kaydý Silmek Ýstediginizden Emin Misiniz?');"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>
	 <% 
      rs.movenext
	next%>
 
  <tr>
    <td colspan="3" height="25">
    Toplam<b> <%=rs.recordcount %> </b> Kiþiye Toplam <b><em><%=toplamyemek%></em></b> Adet Yemek Kaydedilmiþtir.</td>
    <td colspan="4" class="mc" align="center">						
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<b> <font color="red">[<%= y %>]</font></b>
							<% else %>
				 			 <a href="?shf=<%= y %>"><b><%= y %><b></a>	
							<% end if
					next 
					end if%>
</td>
  </tr>
</table>