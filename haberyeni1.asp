<div class="container">
	<div class="syfgnl">
        <div class="row">
            <div class="col-md-12">
                    <h1 class="entry-title" itemprop="name"><%=klm(5)%></h1>
                    <div class="inline20"></div>
                    <div class="entry-content">
						
						<%sorgum="select * from haber where goster=1 order by hkodu desc"
						  Rs.Open Sorgum, Baglantim, 1, 3 
							if Rs.eof or Rs.bof then%><center><img src="images/hata.png"><br><%=klm(92)%></center>
							<%
							else
							if shf="" then shf=1 end if %>
							<% 	rs.pagesize = 32 
								rs.absolutepage = shf
								cellcolor="#FFFFFF"
								sayfa = rs.pagecount
								for i=1 to 32
								if rs.eof then exit for%>
								    <div class="col-xs-6 col-sm-6 col-md-3">
										<article class="post postart3">
											<a class="thumbnail-fg" style="background-image:url('<%=rs("resim")%>');background-size:100% 100%;" href="/haberokuyeni.asp?id=<%= rs("hkodu")%>&<%=cevir(rs("baslik"))%>.html" title="<%= rs("baslik") %>" rel="bookmark">
											</a>
											<h2 class="car-title">
												<a href="/haberokuyeni.asp?id=<%= rs("hkodu")%>&<%=cevir(rs("baslik"))%>.html" title="<%= rs("baslik") %>" rel="bookmark"><%= rs("baslik") %></a>
											</h2>
										</article>
									</div>
							<%
								rs.movenext
								next
							%>
						<%if rs.recordcount>32 then%>
						<div style="width:100%;height:20px;clear:both;"></div>
							<div class="col-xs-12 col-sm-12 col-md-12">
								<ul class="pagination">
									<% onceki=shf-1%>
									<%if shf=1 then%>
										<li><a href="javascript:void(0);">««</a></li>
									<%else%>
										<li><a href="haberyeni.asp?shf=1&tum_haberler.html">««</a></li>
									<%end if%>
									<%if onceki<1 then%>
										<li><a href="javascript:void(0);">«</a></li>
									<%else%>
										<li><a href="haberyeni.asp?shf=<%=onceki%>&tum_haberler.html">«</a></li>
									<%end if%>
									<% for y=1 to sayfa %>
										<%  if cint(shf)=cint(y) then%>
											<li><a href="javascript:void(0);" style="background:#333333; color:#f8f8f8"><b><%=y%></b></a></li>
										<% else%>
											<li><a href="haberyeni.asp?shf=<%=y%>&tum_haberler.html"><%=y%></a></li>
										<% end if
									next 
									sonraki=shf+1
									if sonraki>sayfa then%>
										<li><a href="javascript:void(0);">»</a></li>
									<%else%>
										<li><a href="haberyeni.asp?shf=<%=sonraki%>&tum_haberler.html">»</a></li>
									<%end if%>
									<%if shf=sayfa then%>
										<li><a href="javascript:void(0);">»»</a></li>
									<%else%>
										<li><a href="haberyeni.asp?shf=<%=sayfa%>&tum_haberler.html">»»</a></li>
									<%end if%> 
			
								</ul>
							</div>
						<%end if
						end if
						rs.close
						%>						
					</div>
            </div>
        </div>
    </div>
</div>
