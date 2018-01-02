<!--#include file="slaytust.asp"-->
      <%gis=0
			sorgum="Select top 8 * from galeri where onay=1 and goster=1 order by id desc"
			Rj.Open Sorgum, Baglantim, 1, 3 %>
            <%
			if rj.eof then
			 response.Write("<center><br>Kayitli Resim Bulunamadi<br></center>")
			else%>
            <table width="100%" border="0" align="center" cellpadding="3" cellspacing="2">
		      <%do while not rj.eof
			  if  rj.eof then exit do
			%>
            <td width="25%" align="center" valign="top">
                <a href="<%=rj("url")%>" rel="slayt[1]" title="<%= rj("isim")%>">
			        <img onerror="src = 'images/resimyuklenemedib.gif'" src="<%=rj("url")%>" width="120" height="100" border="0" class="resimkenar"></a>
           </td>
            <%gis=gis+1
		if gis=4 then
		gis=0
		response.Write("</tr><tr>")
		end if
			rj.movenext
			loop%></tr>
        </table>
			<%end if
			rj.close
			%>
          
