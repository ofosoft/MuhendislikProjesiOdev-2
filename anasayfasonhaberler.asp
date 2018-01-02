<div id="news-container" style="overflow: hidden; height: 179px;">
<%
sira=0
	sorgum="Select top 10 * from haber where goster=1 order by hkodu desc"
	rs.Open Sorgum, Baglantim, 1, 3  
	if rs.eof or rs.bof then%> 
	 <center><br><br>Kayýtlý Haber Bulunmamaktadýr.</center>
	<%else%>

    <ul class="mainhaberler">
	<%
do while not rs.eof
if rs.eof then exit do  
%>
	<li>
          <div class="title"><a href="/haberler-<%=rs("hkodu")%>-<%=cevir(rs("baslik"))%>.html"><%=rs("baslik")%></a></div>
            <div class="icerik">
				<a href="/haberler-<%=rs("hkodu")%>-<%=cevir(rs("baslik"))%>.html"><%=rs("aciklama")%></a>
				<br><br><div align="right"><%=rs("update")%>&nbsp;&nbsp;</div>
				
		  </div>
        </li>
<%
rs.movenext
loop
%>
</ul>
<% end if
rs.close%>
</div>