<div class="blokkenar"><div class="menubaslik">TÜM ANKETLER</div>
   <table width="99%" border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
          <td>
          <center class="resimkenar"> Yayýndan Kalkmýþ Anketlere Oy Kullanýlamaz.</center>

<%
set ab = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from ankets order by id desc"
ab.open SQL,data,1,3
Do While not ab.eof
%>
<table width="100%" border="0" cellpadding="2" cellspacing="2" align="center" class="tablokenar">
	<tr>
		<td	align="center"><b><font class="resimkenar"><%=ab("soru")%></font></b></td>
	</tr>
<%
        Set tAnc = Server.CreateObject("ADODB.RecordSet") 
        tAnc.Open "anket Where a_id="&ab("id")&"",data,1,3
        Vote = 0
        Do While Not tAnc.EOF
        Vote = Vote + tAnc("deger")
        tAnc.MoveNext
        Loop
        tAnc.Close
        Set tAnc = NoThing

        Set tAnc = Server.CreateObject("ADODB.RecordSet")
        tAnc.Open "anket Where a_id="&ab("id")&"",data,1,3
Do While Not tAnc.EOF

                strOy = tAnc("deger")
                If strOy = "0" Then
                tOy = "0"
                Else
                tOy = (strOy /Vote) * 100
                End If
%>
		<tr>
			<td width="100%"><font class="blok"><%=tAnc("cevap")%> [ <%=strOy%> Vote - % <%=Left(tOy,4)%>]</font></td>
		</tr>
		<tr>
			<td width="100%">
<div style="width: 700px; height: 5px; border: 1px solid #000000">
<img src="ofosoft_img/mavibaslik.jpg" height="6" width="<%=Int(tOy)*7%>"></div>			</td>
		</tr>
<% 
tAnc.MoveNext
Loop 
set toy = Server.CreateObject("ADODB.RecordSet")
SQL = "select SUM(deger) as oy_say from anket where a_id="&ab("id")&""
toy.open SQL,data,1,3
%>

		<tr>
			<td>
			<p align="center"><font class="orta">Toplam Oy : <%=toy("oy_say")%></font></p>			</td>
		</tr></table><br>

<%
toy.close
set toy = Nothing
ab.movenext : loop
%>
          
          </td>

        </tr>
</table>
</div>