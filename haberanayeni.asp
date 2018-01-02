<%sorgum="Select top 9 * from haber where goster=1 order by hkodu desc"
ru.open sorgum, baglantim, 1, 3  
if ru.eof or ru.bof then %>
<center><img src="/images/interact.png"><br>Kayýtlý Haber Bulunamadý.</center>
<%else%>
<script type="text/javascript" src="js/jqueryyeni.js"></script>
<script type="text/javascript" src="js/plugins.js"></script>
<script type="text/javascript" src="js/dsi.js"></script>
<link href="habermanset.css" type="text/css" rel="stylesheet" />
<div id="divGuncelHaber" class="tab ">
 <div class="haberKutu">
  <div class="haber"></div>
  <div class="resimler"></div>
 </div>
 <div class="masetHaber hidden">
        <ul class="haberListesi">
		
<%hssayi=10
do while not ru.eof
   if ru.eof then exit do%> 
        <li class="haber" id="li_4ed04018-0fb3-4d27-83e9-588b32af70b5" >
            <h3 class="haberBaslýk">
                <a id="ctl00_cphGuncelHaber_C001_newsFrontendList_ctl00_ctl00_NewsList_ctr<%=hssayi%>_DetailsViewHyperLink1" title="<%= ru("baslik")%>" href="haberoku.asp?id=<%= ru("hkodu")%>&<%=cevir(ru("baslik"))%>.html">
				<%= ru("baslik")%></a>
            </h3>
<div id="ctl00_cphGuncelHaber_C001_newsFrontendList_ctl00_ctl00_NewsList_ctrl0_ctl00">
            <div id="ctl00_cphGuncelHaber_C001_newsFrontendList_ctl00_ctl00_NewsList_ctr<%=hssayi%>_ctl00_ctl00_ctl00_viewControl" class="sfRTFContent">
		<% if ru("resim")<>"" then%>
        <img src="<%=ru("resim")%>" onerror="src = 'images/resimyokbyk.gif'" border="0" sfref="[images]d1e01211-9102-4208-aa60-65258be17908" alt="" width="240" height="190">
      <%else %>
        <img src="/images/resimyokbyk.gif" border="0" height="190" sfref="[images]d1e01211-9102-4208-aa60-65258be17908" alt="" width="240">
      <%end if%>
	
	</div>
</div>
            <div class="haberTarih">
                10.04. 2013
            </div>
			<div class="haberOzet"><%=ru("aciklama")%>
             

            <a id="ctl00_cphGuncelHaber_C001_newsFrontendList_ctl00_ctl00_NewsList_ctr<%=hssayi%>_FullStory" class="sfnewsFullStory" href="haberoku.asp?id=<%= ru("hkodu")%>&<%=cevir(ru("baslik"))%>.html">devamý...</a>
			</div>
			
			
            
        </li>
 <%hssayi=hssayi+1
 ru.movenext
      loop %>   
 
    
        </ul>
    <input id="ctl00_cphGuncelHaber_C001_newsFrontendList_ctl00_ctl00_NewsList_ClientState" name="ctl00_cphGuncelHaber_C001_newsFrontendList_ctl00_ctl00_NewsList_ClientState" type="hidden" /><span id="ctl00_cphGuncelHaber_C001_newsFrontendList_ctl00_ctl00_NewsList" style="display:none;"></span>



</div><span></span>
  </div>
<%end if
ru.close%>  