<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td>
	 <%sorgum="select * from haber where goster=1 order by hkodu desc"
	  Rs.Open Sorgum, Baglantim, 1, 3 
		if Rs.eof or Rs.bof then%><center><img src="images/hata.png"><br><%=klm(92)%></center>
<%
		else
		if shf="" then shf=1 end if %>
	  	<% rs.pagesize = 10 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
		   for i=1 to 10
			  if rs.eof then exit for 
			  if rs("goster")=1 then%>
				<table width="100%" align="center" class="tablokenar" cellspacing="0" cellpadding="0">
				  <tr>
					<td width="110" rowspan="2" align="center">
<a href="/haberoku.asp?id=<%= rs("hkodu")%>&<%=cevir(rs("baslik"))%>.html">
<%if rs("resim")<>"" then%>
				<img  onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("resim")%>" border="0" width="100" height="80" class="resimkenar">
		      <% else %>
                <img  src="ofosoft_img/resimyok.jpg" border="0" width="100" height="80" class="resimkenar">
			  <% end if %></a>
</td>
					<td colspan="2" valign="top" height="70"><div align="justify"><b><a href="/haberoku.asp?id=<%= rs("hkodu")%>&<%=cevir(rs("baslik"))%>.html"><%= rs("baslik") %></a></b><br />
		              <%=left( rs("aciklama"),200) %></div></td>
			</tr>
				  <tr>
					<td width="37%"></td>
					<td width="48%"><div align="right"><strong>Eklenme Tarihi : </strong><%= rs("ekleme") %>
					</div>					  
					</tr>
	  </table> 
	    <% 
		end if
	    rs.movenext
		next%>
	</td>
  </tr><%if rs.recordcount>10 then%>
  <tr>
    <td align="center">
	 <table width="25" height="25" border="0" cellpadding="0" cellspacing="0" align="center" class="tablokenar">

          <td><div align="center">
            <span class="metinkalin"><%= shf %></span></div>
          </td>

        </tr>
</table>
	
	</td>
  </tr>
  <tr>
    <td>
<br>
<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="tablokenar">
  <tr>
    <td align="center">
     <% onceki=shf-1%>
     <%if shf=1 then%>
     ««
     <%else%>

     <a href="haber.asp?shf=1&tum_haberler.html">««</a>
     <%end if%>
     &nbsp;|&nbsp;<%if onceki<1 then%>
     «
     <%else%>
	 <a href="haber.asp?shf=<%=onceki%>&tum_haberler.html">«</a>
     <%end if%>

     &nbsp;|&nbsp;
						 
						 <% for y=1 to sayfa %>
                         	
						 <%  if shf=cint(y) then
							 response.write ""&y&"&nbsp;|&nbsp;"
							 else%>
							 <a href="haber.asp?shf=<%=y%>&tum_haberler.html"><%=y%></a>&nbsp;|&nbsp;
							<% end if
						next 
					   sonraki=shf+1
					   if sonraki>sayfa then
					   %>
                        	»
                        <%else%>
                       <a href="haber.asp?shf=<%=sonraki%>&tum_haberler.html">»</a>
                       <%end if%>
                       &nbsp;|&nbsp;
                       <%if shf=sayfa then%>
                      	»»
                        <%else%>
                       <a href="haber.asp?shf=<%=sayfa%>&tum_haberler.html">»»</a>
                       <%end if%>    </td>
  </tr>
</table>
<%end if%>
<%end if
rs.close%></td>
  </tr>
</table>