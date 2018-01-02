<div class="panel panel-blockdefault">
	<div class="panel-heading">
		<h3 class="panel-title">ETKÝNLÝKLER</h3>
	</div>
	<div class="panel-body">
		<div class="row">
			<div class="col-md-12">
				<div id="my-calendar"></div>
				
					<%
					sorgum="Select * from etkinlik where goster=1 order by id desc"
					rs.Open Sorgum, Baglantim, 1, 3 %>
				   <%
					if rs.eof then%>
					<%else%>
					<script type="application/javascript">
						var hasEvent = [
							<%sy=0
							  do while not rs.eof
							  if  rs.eof then exit do
							  if sy=0 then%>

							  <%end if
							  sy=sy+1
							%>
							{
							
									"date": "<%=right(rs("baslama"),4)%>-<%=right(left(rs("baslama"),5),2)%>-<%=left(rs("baslama"),2)%>",
									"badge": true,
									"title": "<%=rs("baslama")%> Günü Etkinlikleri",
									"body": '<%= rs("adi")%><div class="row"><div class="col-md-3"><img src="<%= rs("resim")%>" alt="<%= rs("adi")%>" class="img-responsive"><p class="bg-warning etkat"></p></div><div class="col-md-9"><table class="table table-hover" style="margin-bottom:-15px"><tbody><tr><th scope="row"><i class="fa fa-bookmark fagns"></i> Etkinlik Adý </th> <td><%= rs("adi")%></td> </tr><tr> <th scope="row"><i class="fa fa-calendar fagns"></i> Baþlama Tarihi</th> <td><%= rs("baslama")%></td> </tr><tr> <th scope="row"><i class="fa fa-calendar-o fagns"></i> Bitiþ Tarihi</th> <td><%= rs("bitis")%></td> </tr><tr> <th scope="row"><i class="fa fa-map-marker fagns"></i> Yer</th> <td><%= rs("yer")%></td> </tr> <tr> <th scope="row"></th><td> <a href="etkinlikdetay.asp?id=<%= rs("id")%>" title="<%= rs("adi")%>"><i class="fa fa-external-link-square"></i> <strong>ETKÝNLÝK DETAYI</strong></a></td> </tr></tbody> </table> </div></div>',
									"footer": "Etkinlik Takvimi"
									
									
									
								},
							<%if sy=2 then
							  sy=0%>

						<%end if
						rs.movenext
						loop%>
						];
						$(document).ready(function() {
							$("#my-calendar").zabuto_calendar({
								data: hasEvent,
								cell_border: true,
								today: true,
								language: "tr"
							});
						});
					</script>
					<%end if
					rs.close
					%>
			</div>
		</div>
	</div>
</div>