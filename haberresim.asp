<!--#include file="slaytust.asp"-->
<div align="center">
<%for i=1 to 20
if i=1 then
rss=""
else
rss=i
end if
if rs("resim"&rss&"")<>"" then
yazi="evet" %>
<a href="<%=rs("resim"&rss&"")%>" rel='slayt[1]' title="<%= rs("baslik")%>">
<img  onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("resim"&rss&"")%>" width="140" border="0" class="resimkenar">
</a>
<%end if
next%><br>
<%if yazi="evet" then%>
<b><center>Resimleri Orjinal Boyutlarýnda Görmek Ýçin Resmin Üzerine Týklayýnýz.</center></b><br></div>
<%end if%>