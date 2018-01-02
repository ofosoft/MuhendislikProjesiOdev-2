	<div class="col-md-12">
		<ul class="nav nav-tabs nav-justified" role="tablist">
			<% hks=1
			ru.open "select * from haber_kat where goster=1 and tur=1 order by id asc",baglantim,1,3 %>
			<% do while not ru.eof
			if ru.eof then exit do
			ikonno=ru("id")%>
			<li <%if hks=1 then%>class="active" style="background-color:#333333px"<%end if%>>
				<a class="buyukharf" href="#haber-<%= ru("id") %>" role="tab" data-toggle="tab">
					<i class="fa fa-<%if ikonno=1 then%>globe<%elseif ikonno=2 then%>newspaper-o<%elseif ikonno=3 then%>bullhorn<%elseif ikonno=5 then%>calendar<%else%><%end if%>"></i> <%= ru("isim") %></a>
			</li>
			<%hks=5
			ru.movenext
			loop
			ru.close %>			
		</ul>
		
		<div class="tab-content">
			<% hks=5
			ru.open "select * from haber_kat where goster=1 and tur=1 order by id asc",baglantim,1,3 %>
			<% do while not ru.eof
			if ru.eof then exit do%>
			
				<% hkss=1
				sorgum="Select top "&hks&" * from haber where goster=1 and kat_id="&ru("id")&" order by hkodu desc"
				rz.open sorgum, baglantim, 1, 3  
				if rz.eof or rz.bof then %>
				<center><img src="/images/interact.png"><br>Kayýtlý Haber Bulunamadý.</center>
				<%else
					if hks=5 then%>
						<div class="tab-pane fade active in" id="haber-<%= ru("id") %>">
							<div class="row">
								<div class="col-md-6">
								<%if hkss<>1 then
									divekle=1%>
									<div class="row">
								<%end if%>	
					<%else%>
						<div class="tab-pane fade" id="haber-<%= ru("id") %>">
							<div class="row">
								<div class="col-md-12">
									<div class="row">
					<%end if%>		
								<%
								do while not rz.eof
								if rz.eof then exit do 
								if hks=5 then
								%>
								
									<%if hkss=1 then
									 divekleson=1
									%>
							
										<a href="haberoku.asp?id=<%= rz("hkodu")%>&<%=cevir(rz("baslik"))%>.html" title="<%= rz("baslik")%>" rel="bookmark">
											<div class="kutu">
												<img src="<%=rz("resim")%>" onerror="src = 'images/resimyokbyk.gif'"" class="img-responsive" alt="<%= rz("baslik")%>" title="<%= rz("baslik")%>">
												<span class="shadow"></span>
												<div class="kutu-bolge">
													<div class="kutu-baslik">
														<p class="golge"><%= rz("baslik")%></p>
													</div>
												</div>
											</div>
										</a>
					
									<%
									if divekleson=1 then
										divekleson=2%>
									</div>
									<div class="col-md-6">									
									<%end if	
									else%>
										<div class="col-xs-12 col-sm-12 col-md-12">
											<div class="row inline10">
												<div class="spanpage">
													<div class="col-xs-4 col-sm-4 col-md-3">
														<a class="thumbnail-ba" style="background-image:url('<%=rz("resim")%>');" href="haberoku.asp?id=<%= rz("hkodu")%>&<%=cevir(rz("baslik"))%>.html" title="<%= rz("baslik")%>">
														</a>
													</div>
													<div class="col-xs-8 col-sm-8 col-md-9">
														<a class="kph4" href="haberoku.asp?id=<%= rz("hkodu")%>&<%=cevir(rz("baslik"))%>.html" title="<%= rz("baslik")%>" rel="bookmark">
															<%= rz("baslik")%>
														</a><br />
														<span class="date hidden-xs"><%= rz("update")%></span>
													</div>
												</div>
											</div>
										</div>								
									<%end if%>
								<%else%>	
								<div class="col-xs-6 col-sm-4 col-md-4">
									<article class="post postart2">
										<a class="thumbnail-fg" style="background-image:url('<%=rz("resim")%>');" href="haberoku.asp?id=<%= rz("hkodu")%>&<%=cevir(rz("baslik"))%>.html" title="<%= rz("baslik")%>" rel="bookmark">
										</a>
										<h4 class="post-title">
											<a href="haberoku.asp?id=<%= rz("hkodu")%>&<%=cevir(rz("baslik"))%>.html" title="<%= rz("baslik")%>" rel="bookmark"><%= rz("baslik")%></a>
											<br /><span class="date"><%= rz("update")%></span>
										</h4>
									</article>
								</div>								

								<%end if%>		
								<%hkss=5
								rz.movenext
								loop
								end if
								rZ.close %>	
					<%if hks=5 then
								if divekle=1 then%>
									</div>
								<%end if%>
								</div>
							</div>
						</div>	
					<%else%>
									</div>
								</div>
							</div>
						</div>
					<%end if%>	
			<%hks=6
			ru.movenext
			loop
			ru.close %>
		</div>
	</div>

