<%
if session("sayfahit-"&rs("id")&"")<>"evet" then
 rs("hit")=rs("hit")+1
 session("sayfahit-"&rs("id")&"")="evet"
 rs.update
end if
%>
<div class="blokkenar"><div class="menubaslik"><%=rs("adi")%></div><%=rs("detay")%>
<div align="right" style="margin-top:2px;"> Gösterim Sayısı : <strong><%=rs("hit")%></strong></div>