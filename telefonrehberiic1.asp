<%islem=request("islem")
if islem="aramayap" or islem="aramayapsayfa" then
	if arananad="" then
		sorgum="select * from personel_"&sinif&" where durum=1 "&subeid&" order by "&oncelik&" "&sekil&""
	else
		arananad1=bcevir(arananad)	:	arananad2=kcevir(arananad)
		sorgum="select * from personel_"&sinif&" where durum=1 "&subeid&" and (adi_soyadi like '%"&arananad1&"%'"&" or adi_soyadi like '%"&arananad2&"%'"&") order by "&oncelik&" "&sekil&""
	end if
  else
	sorgum="select * from personel_memur where durum=1 order by adi_soyadi asc"
end if
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	 <%'sorgum="select * from personel_memur where durum=1 order by sirano asc"
	  Rs.Open Sorgum, Baglantim, 1, 3 
		if Rs.eof or Rs.bof then%><center><img src="images/hata.png"><br><%=klm(92)%></center>
<%
		else
		if shf="" then shf=1 end if %>
	  	<% rs.pagesize = 8 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
		   for i=1 to 8
			  if rs.eof then exit for%>
			  
			   <table width="100%" height="110" border="0" align="center" cellpadding="1" cellspacing="1" class="kucukmetin">
				<tr>
				 <td width="9%" rowspan="4">                    
					<%if rs("foto")<>"" and rs("rgoster")=1 then%><a href="<%=rs("foto")%>" rel='slayt[1]' title="<%= rs("adi_soyadi")%>">
						<img onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("foto")%>" border="0" width="90" height="110" class="resimkenar"></a>
					<% else %>
						<img src="ofosoft_img/resimyok.jpg" border="0" width="90" height="110" class="resimkenar">
					<% end if %>
				</td>
                <td height="30"><strong>Adý</strong></td>
                <td height="25"><strong>: </strong><%= rs("adi_soyadi") %></td>
				                    <td width="14%"><strong> Fiili Görev</strong></td>
                    <td width="38%"><strong>: </strong><%= rs("fiili_gorev") %></td>

                  </tr>
                  <tr>
                    <td width="10%" height="30"><strong>Ýþe Baþlama</strong></td>
                    <td width="38%"><strong>: </strong><%= rs("ise_giris") %></td>
                    <td height="25" style="background-color:#fff1a4;"><strong> Dahili Tel</strong></td>
                <td height="25" style="background-color:#fff1a4;"><strong>: </strong><%= rs("dahili")%></td>
                  </tr>
                  <tr>
                    <td height="30"><strong>Ünvaný</strong></td>
                    <td><strong>: </strong><%= rs("unvani")%></td>
                    <td><strong> Lojman Tel</strong></td>
                    <td><strong>: </strong><%= rs("lojtel")%></td>
                  </tr>
                  <tr>
                    <td height="30"><strong>Þubesi</strong></td>
                    <td><strong>: </strong><%=subebul(rs("subekodu"))%></td>
                    <td><strong> E-Mail</strong></td>
                    <td><strong>: </strong><%= rs("mail") %></td>
                  </tr>
                </table>
		<% 
	    rs.movenext
		next%>
	</td>
  </tr>
  <tr>
    <td align="center">
	 <table width="25" height="25" border="0" cellpadding="0" cellspacing="0" align="center" class="kucukmetin">

          <td><div align="center"><b><%= shf %></b></div>
          </td>

        </tr>
</table>
	
	</td>
  </tr><%if rs.recordcount>8 then%>
  <tr>
    <td>
<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="kucukmetin">
  <tr>
    <td align="center">
     <% onceki=shf-1%>
     <%if shf=1 then%>
     ««
     <%else%>

     <a href="telefonrehberi.asp?shf=1&<%=linkuzanti%>">««</a>
     <%end if%>
     &nbsp;|&nbsp;<%if onceki<1 then%>
     «
     <%else%>
	 <a href="telefonrehberi.asp?shf=<%=onceki%>&<%=linkuzanti%>">«</a>
     <%end if%>

     &nbsp;|&nbsp;
						 
						 <% for y=1 to sayfa %>
                         	
						 <%  if shf=cint(y) then
							 response.write "<b>"&y&"</b>&nbsp;|&nbsp;"
							 else%>
							 <a href="telefonrehberi.asp?shf=<%=y%>&<%=linkuzanti%>"><%=y%></a>&nbsp;|
							<% end if
						next 
					   sonraki=shf+1
					   if sonraki>sayfa then
					   %>
                        	»
                        <%else%>
                       <a href="telefonrehberi.asp?shf=<%=sonraki%>&<%=linkuzanti%>">»</a>
                       <%end if%>
                       &nbsp;|&nbsp;
                       <%if shf=sayfa then%>
                      	»»
                        <%else%>
                       <a href="telefonrehberi.asp?shf=<%=sayfa%>&<%=linkuzanti%>">»»</a>
                       <%end if%>    </td>
  </tr>
</table>
<%end if%>
<%end if
rs.close%></td>
  </tr>
</table>