<%sorgum="Select top 16 * from haber where goster=1 and turu=0 order by hkodu desc"
ru.open sorgum, baglantim, 1, 3  
if ru.eof or ru.bof then %>
<center><img src="/images/interact.png"><br>Kayýtlý Haber Bulunamadý.</center>
<%else%>
<style type="text/css">
    <!--
    .innerController_mod48 {display: block
    }
    .dir_buttons_mod48 {display: block
    }
    .slider-navbar_mod48 {display:none
    }
.gn_clear { clear:both; height:0; line-height:0; }
.gn_header_1 { border:0px solid #1E9622; border-bottom:none; padding:2px; }
.gn_slider_1 { border:0px solid #1E9622; padding:2px; height:200px; overflow:hidden; border-bottom:none; }
.gn_slider_1 .gn_opacitylayer { height:100%; filter:progid:DXImageTransform.Microsoft.alpha(opacity=100); -moz-opacity:1; opacity:1; }
.gn_pagination_1 {border-top:none; padding:2px 2px; text-align:center;}
.gn_pagination_1 a:link {border:1px solid #1E9622; width:50px; font-weight:bold; padding-left:6px; padding-top:2px; padding-bottom:2px; padding-right:6px; color:#FF0000; margin-right:1px;  }
.gn_pagination_1 a:hover, .gn_pagination_1 a.selected { color:#f8f8f8; background-color:#0000FF; }
    -->
  </style>
  <script type="text/javascript" src="ofosoft_js/jquery-sinema1.js"></script>
  <script type="text/javascript" src="ofosoft_js/sinemaslider1.js"></script>
  <script type="text/javascript">
function addLoadEvent(func) { if (typeof window.onload != 'function') { window.onload = func; } else { var oldonload = window.onload; window.onload = function() { if (oldonload) { oldonload(); } func(); } } }
addLoadEvent(function(){GN_ContentSlider('gn_slider_1_1',3000,'»','');});
addLoadEvent(function(){GN_ContentSlider('gn_slider_1_2',4000,'Sonraki','');});
addLoadEvent(function(){GN_ContentSlider('gn_slider_1_3',4000,'Sonraki','');});
</script>
<div id="gn_slider_1_1" class="gn_slider_1">
  <div class="gn_opacitylayer">
  <%do while not ru.eof
   if ru.eof then exit do%> 
   <div class="gn_news">
	 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	<% if ru("resim")<>"" then%><a href="haberoku.asp?id=<%= ru("hkodu")%>&<%=cevir(ru("baslik"))%>.html" title="<%= ru("baslik")%>">
        <img src="<%=ru("resim")%>" onerror="src = 'images/resimyokbyk.gif'" border="0" height="190" class="resimkenar"></a>
      <%else %>
        <img src="/images/resimyokbyk.gif" border="0" height="190" class="resimkenar">
      <%end if%></td>
	  <td align="center"><div class="tablokenar"><a href="haberoku.asp?id=<%= ru("hkodu")%>&<%=cevir(ru("baslik"))%>.html"><strong>
				  <%=ru("baslik")%></strong></a></div>
				  <%=ru("aciklama")%>
				  </td>
  </tr>

</table>
</div>
    <%ru.movenext
      loop %>
   </div>
</div>
<div class="gn_pagination_1" id="paginate-gn_slider_1_1"></div>
</div>
<%end if
ru.close%>