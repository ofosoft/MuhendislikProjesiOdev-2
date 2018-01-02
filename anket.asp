<%
	sorgum = "select * from ankets order by id desc"
	ras.open sorgum,baglantim,1,3
	if not ras.eof then
%>
	<table width="100%" border="0" cellpadding="1" cellspacing="1" id="table1" style="border-collapse: collapse">
<form action="islem.asp?islem=anket&id=<%=ras("id")%>&s=<%=session.sessionID%>" method="post">
		<tr>
			<td colspan="3" align="center">
			<b><font class="metinkalin"><%=ras("soru")%></font></b></td>
		</tr>
<!--Anket Siklari-->
<%
        Set tAnc = Server.CreateObject("ADODB.RecordSet") 
        tAnc.Open "anket Where a_id Like '"&ras("id")&"'",data,1,3
        Vote = 0
        Do While Not tAnc.EOF
        Vote = Vote + tAnc("deger")
        tAnc.MoveNext
        Loop
        tAnc.Close
        Set tAnc = NoThing

        Set tAnc = Server.CreateObject("ADODB.RecordSet")
        tAnc.Open "anket Where a_id Like '"&ras("id")&"'",data,1,3
Do While Not tAnc.EOF

                strOy = tAnc("deger")
                If strOy = "0" Then
                tOy = "0"
                Else
                tOy = (strOy /Vote) * 100
                End If
%>
		<tr>
			<td width="2%">
			 <input type="radio" name="cevap" value="<%=tAnc("id")%>">		  </td>
		  <td width="67%"><font class="metinyazi"><%=tAnc("cevap")%></font></td>
		    <td width="31%"><div align="left"><font class="metinyazi">%<%=Left(tOy,4)%></font></div></td>
		</tr>
		<tr>
			<td width="2%"></td>
			<td colspan="2">
<div style="width: 170px; height: 5px; border: 1px solid #000000">
<img src="ofosoft_img/mavibaslik.jpg" height="5" width="<%=(Int(tOy)*1.7)%>"></div>		  </td>
		</tr>
<% tAnc.MoveNext
                Loop 
                Set tOy = data.Execute("anket Where a_id Like '"&ras("id")&"'")
                Do While Not tOy.EOF
                AraToplam = tOy("deger")
                OySayisi = OySayisi + AraToplam
                tOy.MoveNext
                Loop
                tOy.Close : Set tOy = Nothing	%>

		<tr>
			<td colspan="3">
			<div align="center" class="metinyazi">Toplam Oy : <b><%=OySayisi%></b></div>		  </td>
		</tr>
		<tr>
			<td colspan="3">
			<div align="center" class="metinyazi">
            <input type="submit" value="Oy Ver » " style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            </div>		  </td>
		</tr>
		<tr>
			<td colspan="3" align="center"><a href="/anketler.asp"><%=klm(31)%></a></td>
	</tr>
</form>
<!--/Anket Siklari-->
	</table>

<%end if%>