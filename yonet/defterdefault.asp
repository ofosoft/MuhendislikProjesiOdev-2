<head>
<meta http-equiv="Content-Language" content="tr">


<link href="css/stil.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.stil1 {color: #333333}
.stil2 {
	color: #FFFFFF;
	font-weight: bold;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10pt;
}
.stil3 {color: #000033}
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #333333;
}
body {
	background-color: #FFFFFF;
}
a:link {
	color: #0000FF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #0000CC;
}
a:hover {
	text-decoration: none;
	color: #FF0000;
}
a:active {
	text-decoration: none;
	color: #0066FF;
}
.stil5 {color: #000033; font-weight: bold; }
.stil6 {color: #0000FF}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1254">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-6">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9"></head>

<!--#include file="defterayar.asp"-->
<!--#include file="defterfoksiyon.asp"-->

<%
 IF Request.QueryString("@")="girdi" or Request.QueryString("@")<>"girdi" Then
	Session("giris") ="tamam"
 	k_adi=veri(Request.Form("k_adi"))
	sifre=veri(Request.Form("sifre"))
 	Set uye_giris = Server.CreateObject("adodb.recordset")
    SQL="Select * from admin where k_adi='"&k_adi&"' and sifre='"&sifre&"'"
    uye_giris.open SQL,baglanti,1,3
   IF Not uye_giris.EOF Then
    Session("giris") ="tamam"
    Session("k_adi")=uye_giris("k_adi")
    Session("oid")=uye_giris("id")
    uye_giris.Update
    response.redirect Request.ServerVariables("HTTP_REFERER")
  End IF
End IF
%>

<div align="center">
<font face="Verdana" style="font-size: 8pt">
<% IF Not session("giris")="tamam" Then %>
	</font>
			<div align="center">
				<table border="0" width="201" id="table12" style="border-collapse: collapse" height="140">
					<tr>
						<td height="140" valign="top">
						<div align="right">
						<table border="0" width="300" id="table13" height="138" background="images/vidiss.png" cellspacing="0" cellpadding="0">
						<form action="defterdefault.asp?@=girdi" method="post">
							<tr>
								<td width="96%" colspan="2" height="40"> 
								<p align="center">
								<img border="0" src="../images/giris.gif"></td>
							</tr>
							<tr>
								<td width="46%" height="25"> 
								<font face="Verdana" style="font-size: 8pt; font-weight:700">
								Kullan&#305;c&#305; Ad&#305; : </font> </td>
							  <td width="55%" height="25">
                  <font color="#C0C0C0">
                    <input name="k_adi" size="20" style="font-family: Verdana; color: #000000; font-size: 8pt; border: 1px solid #587EA5; font-weight:bold"></font></td>
							</tr>
							<tr>
								<td width="46%"> 
								<font face="Verdana" style="font-size: 8pt; font-weight:700">
								Parola : </font> </td>
								<td width="55%"><font color="#C0C0C0">
                    <input type="password" name="sifre" size="20" style="font-family: Verdana; font-size: 8pt; border: 1px solid #587EA5; font-weight:bold"></font></td>
							</tr>
							<tr>
								<td width="46%">
								<p align="center">&nbsp;</td>
								<td width="55%">
									<input type="submit" value="Admin Giri?i" width="75" height="35" border="0" name="I1"></td>
							</tr>
							</form>
						</table>
						</div>
						</td>
					</tr>
				</table>
			</div>
			<font face="Verdana" style="font-size: 8pt">
<%End If%>
<!-- üye giri?i yaptyktan sonra görülecek bölüm-->
<% IF session("giris")="tamam" Then %>
</font>
			<div align="center">
				<table border="0" width="100%" id="table14" style="border-collapse: collapse" height="201">
	  <tr>
						<td height="201">
						<div align="center">
						<table border="0" width="100%" id="table15" height="217" background="images/vidiss.png" cellspacing="0" cellpadding="0">
			  <tr>
								<!--#include file="defterayar.asp"=--><%
Set rs = Server.CreateObject("adodb.recordset")
sql = "Select * from admin order by id desc"
rs.open sql,baglanti,1,3
%><td height="39"><font color="#008000">&nbsp;
					</font><div align="center">
<table border="1" width="90%" height="200" cellspacing="0" cellpadding="0" bordercolor="#000000" bgcolor="#FFFFFF" style="font-family: Tahoma; font-size: 9pt; border-collapse:collapse">
	<tr>
		<td width="98%" height="25" align="center" bgcolor="#000033" background="../images/topnav_lft.gif" style="font-family: Tahoma; font-size: 9pt">
					<p align="center" class="stil2">Z&#304;YARET&Ccedil;&#304; DEFTER&#304; Y&Ouml;NET&#304;M PANEL&#304;</td>
	</tr>
	<tr>
		<td valign="top" bgcolor="#EEEEEE" style="font-family: Tahoma; font-size: 9pt">
		<!--#include file="defterayar.asp"=--><%
Set rs = Server.CreateObject("adodb.recordset")
sql = "Select * from mesaj order by id desc"
rs.open sql,baglanti,1,3
%><div align="center">
			<table border="0" width="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" style="font-family: Tahoma; font-size: 9pt">
				<tr>
					<td bgcolor="#EEEEEE" style="font-family: Tahoma; font-size: 9pt">&nbsp;</td>
				</tr>
			</table>
			<%
shf = Request.QueryString("shf")
IF Not IsNumeric(REQUEST.QUERYSTRING("shf")) THEN
Response.Redirect "defterdefault.asp"
Response.End
END IF

If rs.eof then
Response.Write "<center><b>Kayitli Mesaj Yok</b></center>"
Response.End
End If

If shf="" Then shf="1"
rs.pagesize = 15 ' 
rs.absolutepage = shf
sayfa_sayisi = rs.pagecount
For i=1 To rs.pagesize
If rs.Eof Then exit for
%>
<table border="0" width="100%" cellspacing="0" cellpadding="0" height="134" bordercolor="#333333" bgcolor="#FFFFFF" style="font-family: Tahoma; font-size: 9pt">
				<tr>
					<td width="285" height="25" bgcolor="#FFFFCC" style="font-family: Tahoma; font-size: 9pt">
					<p align="center"><b>Ekleyen</b></td>
					<td height="25" bgcolor="#FFFFCC" width="379" style="font-family: Tahoma; font-size: 9pt">
					<b>&nbsp;&nbsp;</b></td>
					<td height="25" bgcolor="#FFFFCC" width="119" style="font-family: Tahoma; font-size: 9pt">
					<p align="center"><b>Ekleme Tarihi</b></td>
					<td height="25" bgcolor="#FFFFCC" width="298" style="font-family: Tahoma; font-size: 9pt">
					<b><%=rs("tarih")%></b></td>
				</tr>
				<tr>
					<td width="285" align="left" height="19" style="font-family: Tahoma; font-size: 9pt">
					<p align="center">
												<img src="../<%=rs("secenek")%>" border="0" width="94" height="88"></td>
					<td colspan="3" rowspan="6" valign="top" style="font-family: Tahoma; font-size: 9pt">
					&nbsp;<br><%=SQL_Koru(rs("mesaj"))%></td>
				</tr>
				<tr>
					<td width="285" align="left" height="19" style="font-family: Tahoma; font-size: 9pt">
					&nbsp;<%=rs("cinsiyet")%></td>
				</tr>
				<tr>
					<td width="285" align="left" height="19" style="font-family: Tahoma; font-size: 9pt">
					&nbsp;<%=rs("adi")%></td>
				</tr>
				<tr>
					<td width="285" align="left" style="font-family: Tahoma; font-size: 9pt">
					&nbsp;<%=rs("web")%></td>
				</tr>
				<tr>
					<td width="285" align="left" style="font-family: Tahoma; font-size: 9pt">
					&nbsp;<%=rs("mail")%></td>
				</tr>
				<tr>
					<td width="285" align="left" style="font-family: Tahoma; font-size: 9pt">
					  <p align="center" class="stil3"></td>
				</tr>
				<tr>
					<td height="22" style="font-family: Tahoma; font-size: 9pt" colspan="4">
							  <table border="0" width="636%" id="table16" cellpadding="0" style="border-collapse: collapse; font-family:Tahoma; font-size:9pt">
							  <tr>
											<td style="font-family: Tahoma; font-size: 9pt">
						<font face="Verdana" style="font-size: 8pt">
						<%if rs("cevap")<>"" then%>
						</font>
						<table style="font-family: Tahoma; font-size: 9pt" id="table17" width="635%">
							<tr>
								<td style="font-family: Tahoma; font-size: 9pt">
								<div align="center">
								<table width="70%" border="1" align="right" cellpadding="0" cellspacing="0" bordercolor="#999999" id="table18" style="border-collapse: collapse; font-family:Tahoma; font-size:9pt">
									<tr>
										<td bgcolor="#FFFFCC" style="font-family: Tahoma; font-size: 9pt">
													<span class="stil1"><font face="Verdana" style="font-size: 8pt">
													<img border="0" src="../images/ekle.gif" width="16" height="16"><b>&nbsp; 
													Admin Cevab&#305;</b></font></span></td>
									</tr>
									<tr>
										<td style="font-family: Tahoma; font-size: 9pt">
										<font face="Verdana" style="font-size: 8pt"><b>
										&nbsp;</b><%=rs("cevap")%></font></td>
									</tr>
								</table></div>								</td>
							</tr>
						</table>
						<font face="Verdana" style="font-size: 8pt">
						<%end if%></font></td>
										</tr>
									</table>								</td>
				</tr>
				<tr>
					<td width="285" height="22" background="../images/topnav_lft.gif" style="font-family: Tahoma; font-size: 9pt">
					<p align="center" class="stil1">&#350;ehir :</td>
					<td height="22" background="../images/topnav_lft.gif" style="font-family: Tahoma; font-size: 9pt">
					<p align="left" class="stil1">&nbsp;<%=rs("sehir")%><span class="stil3">&nbsp;</span></td>
					<td height="22" colspan="2" background="../images/topnav_lft.gif" style="font-family: Tahoma; font-size: 9pt">
					  <div align="center"><span class="stil1"><font face="Arial"><b><span class="stil6"><span class="stil5"><a href="deftercevap_ekle.asp?id=<%=rs("id")%>">Cevap 
					    Yaz</a></span>&nbsp;&nbsp;&nbsp;<b><a href="deftersil.asp?id=<%=rs("id")%>"> Mesajı Sil</a></b></span>&nbsp;&nbsp;&nbsp;
					          <% if rs("onay")=True Then %>
					    <a href="?islem=onayla&id=<%=rs("id")%>" style="text-decoration: none">Devre 
					      D&#305;&#351;&#305; B&#305;rak</a>
					    <% else %>
					    <a href="?islem=devredisi&id=<%=rs("id")%>" style="text-decoration: none">  
					      Onayla</a></b></font>
					    <% end if %>
					    </span></div></td>
					</tr>
			</table>
		<hr color="#000000" width="100%">
		<%
rs.Movenext
Next
%>
<%
          Response.Write "<center>"
          Response.Write "<font face=verdana size=1 color=#000000>&nbsp;<b>Sayfalar :&nbsp;</b></font>"
          For g = 1 To sayfa_sayisi
          If g = CInt(shf) Then
          Response.Write "<font face=verdana size=1 color=#000000>[" & g & "],</font>"
          Else
          Response.Write "<a href=defterdefault.asp?shf=" & g & "><font face=verdana size=1 color=#000000>" & g & "</a>,</font>"
          End If
          Next
          Response.Write "</center>"
%>
</div>
		</td>
	</tr>
</table>
</div>
<%
if Request("islem") = "onayla" then
id = Request.QueryString("id")
Set esinti = Server.CreateObject("adodb.recordset")
Sql="Select * From mesaj where id="&id&""
esinti.open sql,baglanti,1,3
esinti("onay") = false
esinti.update
response.redirect "defterdefault.asp"
end if
%>
<%
if Request("islem") = "devredisi" then
id = Request.QueryString("id")
Set esinti = Server.CreateObject("adodb.recordset")
Sql="Select * From mesaj where id="&id&""
esinti.open sql,baglanti,1,3
esinti("onay") = true
esinti.update
esinti.close
response.redirect "defterdefault.asp"
end if
%></td>
							</tr>

						</table>
						</div>
						</td>
					</tr>
				</table>
  </div>
			<font face="Verdana" style="font-size: 8pt">
<%End If%>
</font>	
</div>
