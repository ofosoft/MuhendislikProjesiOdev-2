<style type="text/css">
.clearFix:after { /* for modern browsers */
    content:".";
    display:block;
    height:0;
    clear:both;
    visibility:hidden;
}
.clearFix { /* for IE7/Win */
    min-height:1px;
}
* html .clearFix { /* for IE5-6/Win */
    height:1px;
}
* html>body .clearFix { /* for IE5/Mac */
    height:auto;
    display:inline-block;
}
-->
</style>
<script type="text/javascript" src="cconfig.js"></script>
<script type="text/javascript" src="csmartmenus.js"></script>
<ul id="Menu1" class="MM">
<li><a href="<%=siteurl%>" title="Ana Sayfa" ><%=klm(1)%></a></li>
<li><a href="/sayfa.asp?id=1&bolgemiz">BÖLGEMÝZ HAKKINDA</a></li>
<li><a href="/haber.asp?shf=1&tum_haberler.html"><%=klm(5)%></a></li>
<%if mn15=1 then%>
<li><a href="http://ebys.dsi.gov.tr/" target="_blank">EBYS</a></li>
<li><a href="https://yetki.dsi.gov.tr/Login.aspx?UygulamaUN=48900540-df89-4fa2-8f99-70ce9b4461fe" target="_blank">BYS</a></li>
<li><a href="http://10.119.1.19:8082/" target="_blank">PTS</a></li>
<li style="display:none"><a href="resimgalerisi.asp"><%=klm(22)%></a></li>
<li style="display:none"><a href="videogalerisi.asp"><%=klm(23)%></a></li>
<%end if
if 1=2 then 	
	sorgum="Select * from sayfa where (id<>10 and id<>11 and id<>60 and id<>61) and goster=true and turu=1 order by adi asc"
	ru.Open Sorgum, Baglantim, 1, 3  
	if ru.eof or ru.bof then 
	else%>
	<li><a href="#"><%=klm(55)%></a>
	<ul>
    <% do while not ru.eof
	   if ru.eof then exit do
	%>
		<li><a href="/sayfalar-<%= ru("id") %>-<%=cevir(ru("adi"))%>.html" title="<%=ru("adi")%>"><%=ru("adi")%></a></li>
	<% ru.movenext
	loop%>
	</ul></li>
	<%end if
	ru.close
end if%>
<li style="display:none"><a href="defteroku.asp?shf=1&tum_mesajlar.html"><%=klm(8)%></a></li>
<li><a href="iletisim.asp" title="Ýletiþim Bilgilerimiz"><%=klm(9)%></a></li>
</ul>