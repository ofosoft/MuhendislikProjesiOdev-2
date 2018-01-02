<script type="text/javascript" src="modal/prototype.js"></script>
<script type="text/javascript" src="modal/scriptaculous.js?¬load=builder,effects"></script>
<script type="text/javascript" src="modal/modalbox.js"></script>
<link rel="stylesheet" href="modal/modalbox.css" type="text/css" media="screen" />
<div class="blokkenar"><div class="menubaslik"><%=klm(23)%></div>
	<!--#include file="slaytust.asp"-->
   <table width="100%" border="0" cellpadding="3" cellspacing="3" align="center">
          <tr>
            <%
			sorgum="Select top 15 * from video where onay=1 order by id desc"
			rs.Open Sorgum, Baglantim, 1, 3 %>
           <%
			if rs.eof then%>
    <div align="center" class="metinkalin"><img src="images/hata.png">
    <br><%=klm(92)%><br></div>
			<%else
		      do while not rs.eof
			  if  rs.eof then exit do
			  sy=sy+1
			%>
            <td width="20%" align="center">
				 <center><a href="<%=rs("resim")%>" rel='slayt[1]' title="<%= rs("isim")%>">
					<img onerror="src = 'ofosoft_img/resimyok.jpg'" src="<%=rs("resim")%>" width="137" height="120" border="0" class="resimkenar"><br>
					<a href="videogoster.asp?id=<%=rs("id")%>&<%=cevir(rs("isim"))%>.html" title="Videoyu Ýzlemek Ýçin Týklayýnýz.">
				 <img src="ofosoft_img/videoizle.png" border="0"></center></a>
				</a>
            </td>
			<%if sy=5 then
			  sy=0%></tr><tr>
			  <%end if
			 rs.movenext
			loop
			end if
			rs.close
			%></tr></table>
</div>