	<div class="panel panel-blok-galeri">
		<div class="panel-heading">
			<h3 class="panel-title" style="color:#919e13">
				<a href="resimgalerisi.asp" data-toggle="tooltip" data-placement="right" title="Tüm Galeriler"> FOTO GALERÝ</a>
				<span id="afoto-next" style="float:right"></span> <span id="afoto-prev" style="float:right"></span>
			</h3>
		</div>
		<div class="panel-body">
		
			<%
			sorgum="Select top 10 * from galeri where onay=1 order by id desc"
			rs.Open Sorgum, Baglantim, 1, 3 %>
		   <%
			if rs.eof then%>
				<div align="center" class="metinkalin"><img src="ofosoft_img/hata.png">
				<br><%=klm(92)%><br></div>
			<%else%>
			<ul id="afoto">
					<%sy=0
					  do while not rs.eof
					  if  rs.eof then exit do
					  if sy=0 then%>
					  <li>
						<div class="row">
					  <%end if
					  sy=sy+1
					%>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<a href="resimgoster.asp?id=<%= rs("id")%>" title="<%= rs("isim")%>" rel="bookmark">
								<div class="kutu">
									<img style="height:191px; width:100%;" onerror="src = 'images/resimyok.png'"" src="<%=rs("url")%>" class="img-responsive" alt="<%= rs("isim")%>" title="<%= rs("isim")%>">
									<div class="afgico"><i class="fa fa-camera fa-2x"></i></div>
									<span class="shadow"></span>
									<div class="kutu-bolge">
										<div class="kutu-baslik">
											<p class="golge"><%= rs("isim")%></p>
										</div>

									</div>
								</div>
							</a>
						</div>
					<%if sy=2 then
					  sy=0%>
					</div>
				</li>
				<%end if
				rs.movenext
				loop%>

			</ul>
			<%end if
			rs.close
			%>
		</div>
		<script>
			$('#afoto').bxSlider({
				auto: true,
				pause: 4000,
				nextSelector: '#afoto-next',
				prevSelector: '#afoto-prev',
				nextText: '<i class="fa fa-chevron-right" style="margin-left:4px;color:#fff"></i>',
				prevText: '<i class="fa fa-chevron-left" style="margin-right:4px;color:#fff"></i>'
			});
		</script>
	</div>