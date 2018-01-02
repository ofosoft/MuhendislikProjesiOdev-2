	<div class="col-md-12">
		<ul class="nav nav-tabs2 nav-justified2" role="tablist">
			<% pis=1
			sorgum="select * from paket_kat where goster=1 order by isim asc"
			Ru.Open Sorgum, Baglantim, 1, 3
			ks=ru.recordcount
			if ks<>0 then

			do while not ru.eof
			if ru.eof then exit do%>
				<li class="<%if pis=1 then%>active<%end if%>">
						<a class="buyukharf" href="#proje-<%= ru("id") %>" role="tab" data-toggle="tab"><i class="fa fa-tachometer"></i> <%= ru("isim") %></a>
				</li>
			<% ru.movenext
			pis=2
			loop
			end if
			ru.close %>
		</ul>

		<div class="tab-content">
			<% pis=1
			sorgum="select * from paket_kat where goster=1 order by isim asc"
			Ru.Open Sorgum, Baglantim, 1, 3
			ks=ru.recordcount
			if ks<>0 then
			do while not ru.eof
			if ru.eof then exit do%>
				<div class="tab-pane fade<%if pis=1 then%> active in<%end if%>" id="proje-<%= ru("id") %>">
					<div class="row">

					<%sorgum="Select top 3 * from paket where goster=1 and kat_id="&ru("id")&" order by id desc"
						rs.Open Sorgum, Baglantim, 1, 3 %>
					<%if rs.eof or rs.bof then %>
						<div align="center" class="metinkalin"><img src="ofosoft_img/hata.png">
						<br><%=klm(92)%><br></div>
					<%else
					pis=1%>
						<%do while not rs.eof
						if rs.eof then exit do%>
							<div class="col-xs-12 col-sm-6 col-md-4 bottom-20">
								<article class="post">
									<a class="thumbnail-160ba" style="background-image:url('<%= rs("resim") %>');" href="projedetay.asp?id=<%= rs("id")%>&<%=cevir(rs("adi"))%>.html" title="<%= rs("adi") %>" rel="bookmark">
										<div class="itemcok"><%=pis%></div>
									</a>
									<h4 class="cokpost-titleba">
										<a href="projedetay.asp?id=<%= rs("id")%>&<%=cevir(rs("adi"))%>.html" title="Belediyemize yakýþýr stadyum projesi" rel="bookmark"><%= rs("adi") %></a>
									</h4>
								</article>
							</div>
						<%
						rs.movenext
						pis=pis+1
						loop%>
					<% end if
					rs.close%>
					</div>
				</div>		
			<% ru.movenext
			pis=2
			loop
			end if
			ru.close %>
		</div>
	</div>