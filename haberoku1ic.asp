<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
          <td>
<% 	
if session("hit-"&rs("hkodu")&"")<>"evet" then
rs("hit")=rs("hit")+1
	rs.update
	session("hit-"&rs("hkodu")&"")="evet"
end if	
	%>
			<%= rs("aciklama")  %><hr>
			<div align="justify"><%= rs("detay")  %></div></td>

        </tr><tr>
          <td align="center"><!-- #include file="haberresim.asp" --></td>
       </tr>
         <tr>
          <td><div align="right"> Okunma Sayısı : <strong><%=rs("hit")%></strong></div>
          </td>
       </tr>
</table>