<div class="blokkenar"><div class="menubaslik">Tüm Ay Yemek Listesi</div>
<%	   sorgum="Select * from yemek order by id asc"
	   set rf=Baglantim.Execute(Sorgum)
		if not rf.eof then%>
			<table width="100%" border="0" align="center" cellpadding="3" cellspacing="3">
		<tr class="kucukmetin" style="background-color:#fff693" height="30">
				<td width="50"><center>Tarih</center></td>
				<td width="120">1. Yemek</td>
				<td width="120">2. Yemek</td>
				<td width="120">3. Yemek</td>
				<td width="120">4. Yemek</td>
				<td width="150">Açýklama</td>
			</tr><tr><td colspan="6" height="3"><hr></td></tr>
		<%	do while not rf.eof
		if rf("yemek1")<>"" or rf("yemek2")<>"" or rf("yemek3")<>"" or rf("yemek4")<>"" or rf("aciklama")<>"" then%>
			<tr class="kucukmetin" height="30">
				<td width="50"><b><%=rf("id")%>.<%=month(now())%>.<%=year(now())%></b></td>
				<td width="100">» <%=rf("yemek1")%></td>
				<td width="100">» <%=rf("yemek2")%></td>
				<td width="100">» <%=rf("yemek3")%></td>
				<td width="100">» <%=rf("yemek4")%></td>
				<td width="200">» <%=rf("aciklama")%></td>
			</tr><tr><td colspan="6" height="3"></td></tr>
			
    		<%end if
			rf.movenext
			loop		
		 end if %>
</table>	 
</div>		 