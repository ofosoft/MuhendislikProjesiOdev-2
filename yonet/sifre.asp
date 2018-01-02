<% Session.Timeout = 900 %>
<!--#include file="bag.asp"-->

<%
if session("usersifre") <> sifremiz then
	if request.form("usersifre") <> sifremiz then
		call parolaform
	else
		session("usersifre") = sifremiz
		Response.Redirect("default.asp")
	end if
end if
%>

<%
sub parolaform
THISPAGE = "http://" & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("URL")
%>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: bold;
	color: #FFFFFF;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	font-weight: bold;
}
.stil3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 13px;
	font-weight: bold;
	color: #FF0000;
}
.stil4 {font-size: 12px}
-->
</style>

<title>..:: K&#305;s&#305;tl&#305; Alan ::..</title><p>&nbsp;</p>
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F8F8F8" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px">
  <tr>
    <td>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_2">
  <tr>
    <td height="35" background="../images/sag_blok2alt.gif"><div align="center" class="style1">Yönetici Bölümüne Giris</div>      <div align="right"></div></td>
    </tr>
  <tr>
    <td>
     
		<div align="center"><span class="stil3"><br />
		  UYARI <br />
		  <span class="stil4">K&#305;s&#305;tl&#305; Bir Alana Girmeye &Ccedil;al&#305;&#351;&#305;yorsunuz.<br />
		    L&uuml;tfen Giri&#351; i&ccedil;in Gerekli Bilgileri Giriniz.</span><br />
		  <br>
		  <img src="/images/giris.gif" width="80" height="70" /></span><br>
		  <span class="style2">G&uuml;venlik &#350;ifresi :</span> <BR>		
		  </div>		<form method=post action="<%= thispage%>">
		  <div align="center">
		    <input type="PASSWORD" name="usersifre" value="" size="18">
		    <br>
		    <br>
		    <input name="submit" type="submit"  value=" Giri&#351; Yap">
		    </div>
		</form></td>
</tr>
</table>
</td>
    </tr>
  <tr>
    <td background="../images/sag_blok2alt.gif"><div align="center">
	<a href="http://www.ofosoft.com" target="_blank"><img src="../images/design_silme.png" border="0"></a></div></td>
  </tr>
</table>
</td>
  </tr>
</table>
<center><br><a href="/giris.html">| Ana Sayfa |</a></center>
<%response.end
end sub
%>
