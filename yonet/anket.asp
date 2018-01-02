<!--#include file="sifre.asp"-->
<!--#include file="db.asp"-->
<%
if (request.querystring("sik"))="sil" then
id=request.querystring("id")
	data.Execute("DELETE FROM anket where id="&id&"")
end if
if (request.querystring("anket"))="sil" then
id=request.querystring("id")
data.Execute("DELETE FROM ankets where id like '"&id&"'")
data.Execute("DELETE FROM anket where a_id like '"&id&"'")
Response.Redirect Request.ServerVariables("HTTP_REFERER")
End if

if (request.querystring("cevap"))="duzenle" then
id=request.querystring("id")
	cevap=Request.Form("cevap")

set blgekle = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from anket where id="&id&""
blgekle.Open SQL,data,1,3

blgekle("cevap")=cevap

blgekle.update
blgekle.Close : set blgekle=nothing
Response.Redirect Request.ServerVariables("HTTP_REFERER")
end if

if (request.querystring("sik"))="ekle" then
a_id=request.querystring("a_id")
	cevap=Request.Form("cevap")
set blgekle = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from anket"
blgekle.Open SQL,data,1,3
blgekle.addnew
blgekle("cevap")=cevap
blgekle("a_id")=a_id
blgekle("deger")=0
blgekle.update
blgekle.Close : set blgekle=nothing
Response.Redirect Request.ServerVariables("HTTP_REFERER")
end if


if (request.querystring("anket"))="duzenle" then
id=request.querystring("id")
	soru=Request.Form("soru")

set blgekle = Server.CreateObject("ADODB.RecordSet")
SQL = "select * from ankets where id="&id&""
blgekle.Open SQL,data,1,3

blgekle("soru")=soru

blgekle.update
blgekle.Close : set blgekle=nothing
Response.Redirect Request.ServerVariables("HTTP_REFERER")
end if

if (Request.QueryString("anket"))="ekle" Then
soru=request.form("soru")
If soru="" Then
Response.Write "baslik giriniz."
Response.End
Else
data.Execute ("INSERT INTO ankets (soru) VALUES  ('"&soru&"')")
Set soru = data.Execute("Select id from ankets Order by id desc") 
For i = 1 To request.form("cevap").Count
scenekveri=request.form("cevap")(i)
if not scenekveri="" then
scenekveri = Replace(scenekveri, Chr(39), "&#39;", 1, -1, 1)
data.Execute ("INSERT INTO anket (cevap,a_id,deger) VALUES  ('"&scenekveri&"' , '"&soru("id")&"' , '0')")
end if
Next
soru.Close
Set soru = Nothing
Response.Redirect Request.ServerVariables("HTTP_REFERER")
End if
end if
%>
<body background="images/arka.gif">
<br>
<table width="95%" border="0" align="center" cellpadding="0" id="table1" style="border-collapse: collapse">
	<tr>
		<td height="22" background="/tema/images/sag_blokalt.gif" class="Menu"><center>
		  <font class="Menu" style="color: #FFFFFF; font-weight: bold">Anket Ekle</font>
        </center></td>
  </tr>
</table>
<table border="0" width="95%" id="table1" cellpadding="0" style="border-collapse: collapse" class="tablo" align="center">
<form method="POST" action="">
	<tr>
		<td valign="top"><font class="metinkalin">Anket Ýçin Þeçenek 
		Sayisini Girin :</font>
		  <input type="text" name="sayi" size="33" class="alan"><input type="submit" value="Tamam" class="dugme">
		</td>
	</tr>
</form>
	<tr>
		<td valign="top">
		<table width="100%" border="0" cellpadding="2" cellspacing="2" id="table2" style="border-collapse: collapse">
<%
sayi=Request.Form("sayi")
If sayi="" or isnumeric(sayi)=false Then
sayi = 5
End if
%>
<form action="?anket=ekle" method="post">
			<tr>
				<td width="30%" class="metinkalin">
				  <div align="right"><font class="yazi">Anket Basligi 
			    :</font></div></td>
			  <td width="70%" class="tablo1">
				<input type="text" name="soru" size="33" class="alan"></td>
			</tr>
<%
a=0
For i=1 To sayi
a = a + 1
%>
			<tr>
				<td width="30%" class="metinkalin">
				  <div align="right"><font  class="yazi">Anket Seçeneði - 
			      <%=a%> :</font></div></td>
	      <td width="70%"><font  class="yazi">
				<input type="text" name="cevap" size="33" class="alan"></font></td>
			</tr>
<% next %>
			<tr>
				<td width="30%">&nbsp;</td>
				<td width="70%"><font class="yazi">
				<input type="submit" value="Tamam" class="dugme"></font></td>
			</tr>
</form>
		</table>
	  </td>
	</tr>
</table>
<table width="95%" border="0" align="center" cellpadding="0" id="table1" style="border-collapse: collapse">
<tr>
		<td height="22" background="/tema/images/sag_blokalt.gif" class="Menu"><center style="color: #FFFFFF; font-weight: bold">
		Anket Yönetimi
    </center></td>
  </tr>
</table>
<table width="95%" border="0" align="center" cellpadding="2" cellspacing="2" class="tablo" id="table3" style="border-collapse: collapse">
<%
set rs = data.execute("SELECT * FROM ankets order by id desc")
do while not rs.eof 
%>
		<form action='?anket=duzenle&id=<%=rs("id")%>' method='post'>
	<tr>
		<td width="90%" class="ust">
	  <input type="text" value='<%=rs("soru")%>' name='soru' class="alan" size="50"><input type="submit" value="Güncelle" class="dugme"></td>
		<td width="10%" class="ust">
		  <div align="center"><a href="?anket=sil&id=<%=rs("id")%>" onclick="return confirm('Silmek Istediginizden Eminmisiniz?');">Anketi Sil</a></div></td>
	</tr>
		</form>

<%
set rx = data.execute("SELECT * FROM anket where a_id="&rs("id")&"")
do while not rx.eof
%>
		<form action="?cevap=duzenle&id=<%=rx("id")%>" method="post">
	<tr>
		<td>
		<input type="text" value="<%=rx("cevap")%>" name="cevap" size="33" class="alan"><input type="submit" value="Güncelle" class="dugme"><font class="yazi">&nbsp;</font><span class="metinkalin">&nbsp;Aldigi Oy :</span> <span class="metinyazi"><%=rx("deger")%></span></td>
	    <td><div align="center"><a href="?sik=sil&id=<%=rx("id")%>" onClick="return confirm('Silmek Istediginizden Eminmisiniz?');">Seçeneði Sil</a></div></td>
	</tr>
		</form>
<%
rx.movenext : loop : rx.close : set rx=nothing
%>
	<form action='?sik=ekle&a_id=<%=rs("id")%>' method='post'>
	<tr>
		<td colspan='2'><input name='cevap' type='text' class="alan" size="33"><input type='submit' value='Yeni Seçenek Ekle' class="dugme"></td>
	</tr>
	</form>
	<tr>
		<td colspan="2" class="tablo1" height="10"></td>
	</tr>
<%
rs.movenext
loop
rs.close
set rs = nothing
%>
</table>