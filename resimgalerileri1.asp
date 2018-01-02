<div class="blokkenar"><div class="menubaslik"><%=klm(22)%> - <%galeri_baslik(kat_id)%></div>
	<!--#include file="slaytust.asp"-->
   
   <%
	sorgum="Select * FROM galeri where kat_id="&kat_id&" and onay=1 ORDER BY isim asc"
	rs.Open Sorgum, Baglantim, 1, 3  
	if rs.eof or rs.bof then  %>
    <div align="center" class="metinkalin"><img src="ofosoft_img/hata.png">
    <br><%=klm(92)%><br></div>
<%	else%>
 <table width="100%" border="0" cellspacing="3" cellpadding="3">
  <tr>
    <td>
	<table width="100%" border="0" cellspacing="3" cellpadding="3" >
	<tr>
<%rsy=1
	    if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize =20 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	   x=0			
		  for i=1 to 20
		  	  if rs.eof then exit for 
				  for j=1 to 30
			   if rs("resim"&j&"")<>"" then
			    rsy=rsy+1%>
			    <a href="<%=rs("resim"&j&"")%>" rel='slayt[<%=rs("id")%>]' title="<%= rs("isim")%>">
					<img  onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("resim"&j&"")%>" width="0" border="0" style="display:none">
				</a>
			<% end if
			  next	
			%>
              
            <td width="25%" align="center">
				<a href="<%=rs("url")%>" rel='slayt[1]' title="<%= rs("isim")%> - Toplam Resim : <%=rsy%>">
					<img  onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("url")%>" width="120" border="0" class="resimkenar">
				</a>
            </td>
		     
		     <% 
		  rs.movenext
		 	x=x+1
		  if x=4 then
		 	response.Write("</tr><tr>")
			x=0
		   end if
		  next %>
</tr>
</table> 
    
</td>
  </tr>
  <tr>
    <td align="center">
    <table width="25" height="25" class="resimkenar" border="0" cellpadding="0" cellspacing="0" align="center">

          <td><div align="center"><span class="metinkalin"><b><%= shf %></b></span></div>
          </td>

        </tr>
</table>
    </td>
  </tr><%if rs.recordcount>15 then%>
  <tr>
<td>
<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="resimkenar">
  <tr>
    <td align="center">
     <% onceki=shf-1%>
     <%if shf=1 then%>
     ««
     <%else%>
     <a href="/galeriler-<%=kat_id%>-1-<%=katadi%>">««</a>
     <%end if%>
     &nbsp;|&nbsp;<%if onceki<1 then%>
     «
     <%else%>
	 <a href="/galeriler-<%=kat_id%>-<%=onceki%>-<%=katadi%>">«</a>
     <%end if%>
     &nbsp;|&nbsp;
						 
						 <% for y=1 to sayfa %>
                         	
						 <% 
							 if shf=y then
							 response.write ""&y&"&nbsp;|&nbsp;"
							 else%>
							 <a href="/galeriler-<%=kat_id%>-<%=y%>-<%=katadi%>"><%=y%></a>&nbsp;|&nbsp;
							 <%end if
	                   			
						next 
					   sonraki=shf+1
					   if sonraki>sayfa then
					   %>
                        	»
                        <%else%>
                       <a href="/galeriler-<%=kat_id%>-<%=sonraki%>-<%=katadi%>">»</a>
                       <%end if%>
                       &nbsp;|&nbsp;
                       <%if shf=sayfa then%>
                      	»»
                        <%else%>
                       <a href="/galeriler-<%=kat_id%>-<%=sayfa%>-<%=katadi%>">»»</a>
                       <%end if%>
    </td>
  </tr>
</table>
	 
    
    </td>
  </tr><% end if%>
</table>
<%	end if
Rs.Close%>
</div>