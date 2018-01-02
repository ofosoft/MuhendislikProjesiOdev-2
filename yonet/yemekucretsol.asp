<form id="form1" name="tstest" method="post" action="?islem=yemekkaydet">
<table width="99%" border="0" cellspacing="1" cellpadding="1" class="buton">
  <tr>
    <td colspan="2" class="altcizgiduz"><div align="center"><strong>YEN&#304; YEMEK &Uuml;CRET&#304; G&#304;R&#304;&#350;&#304;</strong></div></td>
  </tr>
  <tr>
    <td width="31%"><div align="right">Tarih :</div></td>
    <td width="69%"><!--#include file="takvim.asp"--></td>
  </tr><%if 1>2 then%>
  <tr>
    <td><div align="right">Yemek &Uuml;creti :</div></td>
    <td><label>
      <input name="ucret" type="text" id="ucret" title="Örneðin : <%=yemekucreti%>" value="<%=yemekucreti%>" size="4" maxlength="6" onBlur="if(this.value=='')this.value='<%=yemekucreti%>';" />
      <strong>    TL</strong></label></td>
  </tr><%end if%>
  <tr>
    <td><div align="right">Ad&#305; Soyad&#305; :</div></td>
    <td>
       <select name="adisoyadi" id="adisoyadi" style="font-size:12px">
	   <option value="0" style="background-color:#FFFFCC"></option>
    <% sorgum="select * from personel_memur where durum=1 order by adi_soyadi asc"
	   rl.Open Sorgum, Baglantim, 1, 3 
		if rl.RecordCount > 0 Then
		Do While Not rl.eof
		if rl.eof then exit do%>
		<option value="<%=rl("sicil_no")%>/<%=rl("adi_soyadi")%>/4,00/<%=rl("unvank")%>" style="background-color:#FFFFCC"><%=rl("adi_soyadi")%></option>
		<%rl.MoveNext
		Loop
		End If
		rl.Close%>
       <% sorgum="select * from personel_isci where durum=1 order by adi_soyadi asc"
	   rl.Open Sorgum, Baglantim, 1, 3 
		if rl.RecordCount > 0 Then
		Do While Not rl.eof
		if rl.eof then exit do%>
		<option value="<%=rl("sicil_no")%>/<%=rl("adi_soyadi")%>/5,50/1" style="background-color:#99FFFF"><%=rl("adi_soyadi")%></option>
		<%rl.MoveNext
		Loop
		End If
		rl.Close%>
     
      </select>
      </td>
  </tr>
  <tr>
    <td><div align="right">Adet :</div></td>
    <td><input name="adet" type="text" id="adet" value="1" size="4" maxlength="10" onBlur="if(this.value=='')this.value='1';" />
	<input name="misafir" type="checkbox" id="misafir" value="checkbox"/>
	Misafir</td>
  </tr>
  <tr>
    <td><div align="right">&Ouml;deme T&uuml;r&uuml;</div></td>
    <td><select name="nakit" id="nakit">
      <option value="0">Veresiye</option>
      <option value="1">Nakit</option>
            </select></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><label>
      <input type="submit" name="gonder" id="gonder" value="Kaydet" class="butonyesil" onClick="return confirm('Dikkat! Yemek Kaydý Eklenecektir. Onaylýyor Musunuz?')" />
    </label></td>
  </tr>
  <tr><td colspan="2">
  <font style="color:#f8f8f8">NOT : Memur Yemek Yardýmý Günlük 1 Adet Yemekle Sýnýrlýdýr.<br>2 ve üzeri yemeklerde sistem yemek ücretini 7 TL olarak hesaplamaktadýr.</font>
  </td></tr>
</table></form><br>
<form id="form1" name="tstest2" method="post" action="?islem=kayitgetir">
<table width="99%" border="0" cellspacing="1" cellpadding="1" id="menubg" align="center">
<tr>
   <tr>
    <td height="30" align="right"><input type="Text" name="timestamp2" value="<%=session("kayitgetirtarih")%>" readonly="true" size="6" maxlength="5">
<a href="javascript:show_calendar('document.tstest2.timestamp2', document.tstest2.timestamp2.value);" alt="Tarihi Açmak Ýçin Týklayýn">
<img src="cal.gif" width="16" height="16" border="0" title="Tarihi Açmak Ýçin Týklayýn"></a>
</td><td>
		<input name="kapat" type="submit" id="kapat" value="Kayýtlarý Getir" class="buton">
	</td>
  </tr>
</tr></table>
</form><br>
<form id="form1" name="tstest3" method="post" action="?islem=kayitlarilistele">
<table width="99%" border="0" cellspacing="1" cellpadding="1" Class="Menu" align="center">
<tr>
   <tr>
    <td height="30" align="right">Baþ. : <input type="Text" name="timestamp3" value="<%=session("yemektarihibaslangic")%>" readonly="true" size="6" maxlength="5">
<a href="javascript:show_calendar('document.tstest3.timestamp3', document.tstest3.timestamp3.value);" alt="Tarihi Açmak Ýçin Týklayýn">
<img src="cal.gif" width="16" height="16" border="0" title="Tarihi Açmak Ýçin Týklayýn"></a></td>
	<td height="30" align="right">Bit. : <input type="Text" name="timestamp4" value="<%=session("yemektarihibitis")%>" readonly="true" size="6" maxlength="5">
<a href="javascript:show_calendar('document.tstest3.timestamp4', document.tstest3.timestamp4.value);" alt="Tarihi Açmak Ýçin Týklayýn">
<img src="cal.gif" width="16" height="16" border="0" title="Tarihi Açmak Ýçin Týklayýn"></a></td></tr>
	<tr>
	<td><select name="sicilno" id="sicilno" style="width:150px; font-size:12px" tabindex="1">
    <option value="tumu" style="background-color:#FFFFCC">Tüm Personel</option>
	<% sorgum="select * from personel_memur where durum=1 order by adi_soyadi asc"
	   rl.Open Sorgum, Baglantim, 1, 3 
		if rl.RecordCount > 0 Then
		Do While Not rl.eof
		if rl.eof then exit do%>
		<option value="<%=rl("sicil_no")%>" <%if session("aramasicilno")=rl("sicil_no") then%><%end if%> style="background-color:#FFFFCC"><%=rl("adi_soyadi")%></option>
		<%rl.MoveNext
		Loop
		End If
		rl.Close%>
       <% sorgum="select * from personel_isci where durum=1 order by adi_soyadi asc"
	   rl.Open Sorgum, Baglantim, 1, 3 
		if rl.RecordCount > 0 Then
		Do While Not rl.eof
		if rl.eof then exit do%>
		<option value="<%=rl("sicil_no")%>" <%if session("aramasicilno")=rl("sicil_no") then%><%end if%> style="background-color:#99FFFF"><%=rl("adi_soyadi")%></option>
		<%rl.MoveNext
		Loop
		End If
		rl.Close%>
     
      </select></td>
	<td align="center"><input name="kapat" type="submit" id="kapat" value="Seçimi Listele" class="buton"></td>
  </tr>
</tr></table>
</form>