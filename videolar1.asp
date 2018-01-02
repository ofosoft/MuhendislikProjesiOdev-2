<div class="blokkenar"><div class="menubaslik"><%video_baslik(kat_id)%></div>
	<!--#include file="slaytust.asp"-->
      <%
	sorgum="Select * FROM video where kat_id="&kat_id&" and onay=1 order by id desc"
	rs.Open Sorgum, Baglantim, 1, 3  
	if rs.eof or rs.bof then  %>
    <div align="center" class="metinkalin"><img src="ofosoft_img/hata.png">
    <br><%=klm(92)%><br></div>
<%	else%>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<table width="100%" border="0" cellspacing="2" cellpadding="2" >
	<tr>
<%	    if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize =20 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	   j=0			
		  for i=1 to 20
		  	  if rs.eof then exit for 
				%>
              
            <td width="20%" height="145"> <center>
				<a href="<%=rs("resim")%>" rel='slayt[1]' title="<%= rs("isim")%>">
					<img onerror="src='ofosoft_img/resimyok.jpg'" src="<%=rs("resim")%>" width="175" height="135" border="0" class="resimkenar"><br>
					<a href="videogoster.asp?id=<%=rs("id")%>&<%=cevir(rs("isim"))%>.html" title="Videoyu Ýzlemek Ýçin Týklayýnýz.">
				 <img src="ofosoft_img/videoizle.png" border="0"></center></a>
				</a></div>
            </td>
		     
		     <% 
		  rs.movenext
		 	j=j+1
		  if j=5 then
		 	response.Write("</tr><tr>")
			j=0
		   end if
		  next %>
</tr>
</table> 
    
    </td>
  </tr>
  <tr>
    <td align="center"><br>
    <table width="25" height="25" id="tablokenar" border="0" cellpadding="0" cellspacing="0" align="center">

          <td><div align="center"><span class="metinkalin"><%= shf %></span></div>
          </td>

        </tr>
</table>
    </td>
  </tr><%if rs.recordcount>15 then%>
  <tr>
    <td>
    <br>
    
<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" id="tablokenar">
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