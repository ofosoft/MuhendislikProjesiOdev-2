<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
          <td>
<% 	rs("hit")=rs("hit")+1
	rs.update
	kod=rs("kod")
	snc2 = InStr(1,kod, ".flv")
	       if snc2=0 then %>
		   <embed style="WIDTH:710px; HEIGHT:650px" height="500px" type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/Downloads/Contents/MediaPlayer/" width="520" src="<%=kod%>" autorewind="true" showdisplay="false" showstatusbar="false" showcontrols="true" autostart="true" filename="<%=kod%>" />
			<%else%>
				<!--#include file="videogoster1icflash.asp"-->
			<%end if%>
			
			
			
	</td>
     </tr>
         <tr>
          <td><br><div align="right"> Ýzlenme Sayýsý : <strong><%=rs("hit")%></strong> | Eklenme Tarihi : <strong><%=rs("tarih")%></strong></div>
          </td>
       </tr>
</table>