<%sorgum="select top 20 * from haber where goster=1 order by hkodu desc"
  rs.Open Sorgum, Baglantim, 1, 3 
if rs.eof or Rs.bof then%><center><img src="images/hata.png"><br><%=klm(92)%></center>
<%else%>
<link rel="stylesheet" type="text/css" media="all" href="nivo-slider.css" />
<script type="text/javascript" src="jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="jquery.nivo.slider.pack.js"></script>		
<!-- BEGIN SLIDER -->
<div id="slider">
<%do while not rs.eof
if rs.eof then exit do
hss=1%>
	<a href="/haberler-<%= rs("hkodu")%>-<%=cevir(rs("baslik"))%>.html"><%if rs("resim")<>"" then%><img onerror="src = 'images/resimyok.jpg'" src="<%=rs("resim")%>" border="0" height="350px" width="530px" alt="<%=hss%>" title="<%=rs("baslik")%>"><% else %><img  src="images/resimyok.jpg" border="0" height="350px" width="530px" alt="<%=hss%>" title="<%=rs("baslik")%>">	<% end if %></a>
<%hss=hss+1
rs.movenext
loop
%>
	 </div>
	 <div style="width:530px; margin:0 auto 30px; background:url(bk_shadow_slider.png) 0 -13px no-repeat; height:15px;"></div>
	  <!-- END SLIDER -->
	  <!-- SLIDER SETTINGS -->
	  <script type="text/javascript">
			$(window).load(function() {
				$('#slider').nivoSlider({
					effect:'random',
					slices:15,
					animSpeed:500,
					pauseTime:3000,
					startSlide:0, //Set starting Slide (0 index)
					directionNav:true, //Next &amp; Prev
					directionNavHide:true, //Only show on hover
					controlNav:true, //1,2,3...
					controlNavThumbs:false, //Use thumbnails for Control Nav
					controlNavThumbsFromRel:false, //Use image rel for thumbs
					controlNavThumbsSearch: '.jpg', //Replace this with...
					controlNavThumbsReplace: '_thumb.jpg', //...this in thumb Image src
					keyboardNav:true, //Use left &amp; right arrows
					pauseOnHover:true, //Stop animation while hovering
					manualAdvance:false, //Force manual transitions
					captionOpacity:0.8, //Universal caption opacity
					beforeChange: function(){},
					afterChange: function(){},
					slideshowEnd: function(){} //Triggers after all slides have been shown
				});
			});
			</script>
<%end if%>			