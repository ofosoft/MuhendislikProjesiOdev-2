<div class="blokkenar"><div class="menubaslik"><%=klm(22)%></div>
	<!--#include file="slaytust.asp"-->
   <table width="100%" border="0" cellpadding="3" cellspacing="3" align="center">
          <tr>
            <%
			sorgum="Select top 20 * from galeri where onay=1 order by isim asc"
			rs.Open Sorgum, Baglantim, 1, 3 %>
           <%
			if rs.eof then%>
    <div align="center" class="metinkalin"><img src="ofosoft_img/hata.png">
    <br><%=klm(92)%><br></div>
			<%else
			rsy=1
		      do while not rs.eof
			  if  rs.eof then exit do
			  sy=sy+1
			  for i=1 to 30
			   if rs("resim"&i&"")<>"" then
			    rsy=rsy+1%>
			    <a href="<%=rs("resim"&i&"")%>" rel='slayt[<%=rs("id")%>]' title="<%= rs("isim")%>">
					<img  onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("resim"&i&"")%>" width="0" border="0" style="display:none">
				</a>
			<% end if
			  next	
			%>
            <td width="25%" align="center">
				<a href="<%=rs("url")%>" rel='slayt[<%=rs("id")%>]' title="<%= rs("isim")%> - Toplam Resim : <%=rsy%>">
					<img  onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("url")%>" width="120" border="0" class="resimkenar">
				</a>
            </td>
			<%if sy=4 then
			  sy=0%></tr><tr>
			  <%end if
			 rs.movenext
			loop
			end if
			rs.close
			%></tr></table>
</div>