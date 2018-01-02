<table width="100%" class="Menu" style="padding:5px;" cellspacing="1" cellpadding="1">
<tr><td width="100%">
<form id="form1" name="tstest3" method="post" action="?islem=kayitlarilistele" style="margin:0px; padding:0px;">
<table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
<tr>
<td>Ay <select name="ay" id="ay">
    <%for i=1 to 12%>
	<option value="<%=i%>" <%if int(session("ayyemekay"))=i then%>selected="selected"<%end if%>><%=ayadibul(i)%></option>
    <%next%>
	</select></td>
<td>Yýl <select name="yil" id="ay">
    <%for i=2017 to 2050%>
	<option value="<%=i%>" <%if int(session("ayyemekyil"))=i then%>selected="selected"<%end if%>><%=i%></option>
	<%next%>
      </select>
	  </td>
	  
   <td>Personel Adý Soyadý <select name="sicilno" id="sicilno">
    <option value="tumu" style="background-color:#FFFFCC">Tüm Personel</option>
	<% sorgum="select * from personel_memur where durum=1 order by adi_soyadi asc"
	   rl.Open Sorgum, Baglantim, 1, 3 
		if rl.RecordCount > 0 Then
		Do While Not rl.eof
		if rl.eof then exit do%>
		<option value="<%=rl("sicil_no")%>" style="background-color:#FFFFCC"><%=rl("adi_soyadi")%></option>
		<%rl.MoveNext
		Loop
		End If
		rl.Close%>
       <% sorgum="select * from personel_isci where durum=1 order by adi_soyadi asc"
	   rl.Open Sorgum, Baglantim, 1, 3 
		if rl.RecordCount > 0 Then
		Do While Not rl.eof
		if rl.eof then exit do%>
		<option value="<%=rl("sicil_no")%>" style="background-color:#99FFFF"><%=rl("adi_soyadi")%></option>
		<%rl.MoveNext
		Loop
		End If
		rl.Close%>
     
      </select></td>
	  <td>Sýnýfý <select name="sinif" id="sinif">
		<option value="0" <%if session("ayyemeksinif")=0 then%>selected="selected"<%end if%>>Memur</option>
		<option value="1" <%if session("ayyemeksinif")=1 then%>selected="selected"<%end if%>>Ýþçi (S/S)</option>
		<option value="2" <%if session("ayyemeksinif")=2 then%>selected="selected"<%end if%>>Sözleþmeli</option>
		<option value="3" <%if session("ayyemeksinif")=3 then%>selected="selected"<%end if%>>4C'li</option>
		</select></td>
	<td align="center"><input name="kapat" type="submit" id="kapat" value="Seçimi Listele" class="buton"></td>

	</tr>
</table>
</form></td>
	<td align="center">
	<form id="form2" name="form2" target="_blank" method="post" action="misafirhaneucretayyazdir.asp" style="margin:0px; padding:0px;">
	<input name="yazdir" type="submit" id="yazdir" value="Tabloyu Yazdýr" class="buton">
	</form>
	</td>
<tr></table>