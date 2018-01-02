<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
   <table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td>
 
     <% sorgum="select * from mesaj where onay=true order by id desc"
	  Rs.Open Sorgum, Baglantim, 1, 3 
		if Rs.eof or Rs.bof then%>
			<center><img src="images/hata.png">
    <br><%=klm(92)%><br /></center>
		<%else
		if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize = 11 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	 				
		   for i=1 to 11
		  
			  if rs.eof then exit for %>

            <table width="100%" align="center" border="0" class="tablokenar">
   <tr>
     <td width="85%" valign="top"><div align="justify">Sayýn; <b><%=rs("cinsiyet")%>&nbsp;<%= rs("adi") %></b>, <%= rs("sehir") %>&nbsp;Ýlinden&nbsp;<strong><%= rs("tarih") %></strong>&nbsp;<strong></strong>Tarihinde Yazmýþtýr. <br />
            <hr><%=rs("mesaj")%><%if rs("cevap")<>"" then%><br>
			     <table width="98%"  border="0" align="right" cellpadding="0" cellspacing="0" class="resimkenar">
              <tr>
                <td><b>Yönetici Cevabý :</b> </td>
              </tr>
              <tr>
                <td><%=rs("cevap")%></td>
              </tr>
            </table>
			<%end if%>
</div></td>
  </tr>
    </table>              <br>
            <% 		  
		      rs.movenext
			next%>
                
</td>
  </tr><%if rs.recordcount>11 then%>
  <tr>
    <td align="center">
    <table width="25" height="25" border="0" cellpadding="0" cellspacing="0" align="center" class="tablokenar">

          <td><div align="center"><b><%= shf %></b></div>
          </td>

        </tr>
</table>
</td>
  </tr>

  <tr>
    <td>

<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="tablokenar">
  <tr>
    <td align="center">
     <% onceki=shf-1%>
     <%if shf=1 then%>
     ««
     <%else%>

     <a href="defteroku.asp?shf=1&tum_mesajlar.html">««</a>
     <%end if%>
     &nbsp;|&nbsp;<%if onceki<1 then%>
     «
     <%else%>
	 <a href="defteroku.asp?shf=<%=onceki%>&tum_mesajlar.html">«</a>
     <%end if%>

     &nbsp;|&nbsp;
						 
						 <% for y=1 to sayfa %>
                         	
						 <% 
							 if shf=y then
							 response.write ""&y&"&nbsp;|&nbsp;"
							 else%>
							 <a href="defteroku.asp?shf=<%=y%>&tum_mesajlar.html"><%=y%></a>&nbsp;|&nbsp;
							<% end if
	                   			
						next 
					   sonraki=shf+1
					   if sonraki>sayfa then
					   %>
                        	»
                        <%else%>
                       <a href="defteroku.asp?shf=<%=sonraki%>&tum_mesajlar.html">»</a>
                       <%end if%>
                       &nbsp;|&nbsp;
                       <%if shf=sayfa then%>
                      	»»
                        <%else%>
                       <a href="defteroku.asp?shf=<%=sayfa%>&tum_mesajlar.html">»»</a>
                       <%end if%>    </td>
  </tr>
</table></td>
  </tr>

<%end if%>

<%end if
rs.close%></table>
</td>
  </tr>
</table>