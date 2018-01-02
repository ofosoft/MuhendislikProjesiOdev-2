<%sorgum="Select top 15 * from haber where goster=1 and turu=0 order by hkodu desc"
ru.open sorgum, baglantim, 1, 3  
if ru.eof or ru.bof then %>
<center><img src="/images/interact.png"><br>Kayýtlý Haber Bulunamadý.</center>
<%else%>
	<div id="mnsslider" class="onbes">
		<%do while not ru.eof
		if ru.eof then exit do%> 
		
		<a href="haberoku.asp?id=<%= ru("hkodu")%>&<%=cevir(ru("baslik"))%>.html" title="<%=ru("baslik")%>" alt="<%=ru("baslik")%>" class="item">
			<img src="<%=ru("resim")%>" onerror="src = 'images/resimyokbyk.gif'" alt="<%=ru("baslik")%>" class="img-responsive"/>
			<span style="font-size:15px; border-radius:10px"><%=ru("baslik")%></span>
		</a>
		<%ru.movenext
		loop %>	
	</div>
<%end if
ru.close%>