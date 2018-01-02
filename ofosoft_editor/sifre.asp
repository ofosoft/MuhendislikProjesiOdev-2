<% Session.Timeout = 120 %>

<!--#include file="bag.asp"-->
<%
BuSayfa = Request.ServerVariables("SCRIPT_NAME")
BuQuery = Request.ServerVariables("QUERY_STRING")
IF BuQuery <> "" then BuSayfa = BuSayfa &"?"&BuQuery
sayfa="http://"&siteurl&busayfa
%>

<%
if session("usersifre") <> sifremiz then
	if request.form("usersifre") <> sifremiz then
		call parolaform
	else
		session("usersifre") = sifremiz
		Response.Redirect(sayfa)
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
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_2">
  <tr>
    <td colspan="2" background="../../tema/<%=sitetema%>/base_02.jpg"><img src="../../tema/<%=sitetema%>/tablosol.jpg" width="56" height="30" alt="" /></td>
    <td width="1090" background="../../tema/<%=sitetema%>/base_02.jpg" class="Menu"><div align="center" class="style1">Yönetici Bölümüne Giris</div></td>
    <td colspan="2" background="../../tema/<%=sitetema%>/base_02.jpg"><div align="right"><img src="../../tema/<%=sitetema%>/base_03.jpg" width="56" height="30" alt="" /></div></td>
  </tr>
  <tr>
    <td width="17" background="../../tema/<%=sitetema%>/base_04.jpg"><img src="../../tema/<%=sitetema%>/base_04.jpg" width="17" height="20" alt="" /></td>
    <td colspan="3" bgcolor="#FFFFFF" valign="top" align="center">
     
		<span class="stil3"><br />
		UYARI <br />
		<span class="stil4">K&#305;s&#305;tl&#305; Bir Alana Girmeye &Ccedil;al&#305;&#351;&#305;yorsunuz.<br /> 
		L&uuml;tfen Giri&#351; i&ccedil;in Gerekli Bilgileri Giriniz.</span><br />
		<br>
		<img src="../../tema/<%=sitetema%>/giris.gif" width="80" height="70" /></span><br>
		<span class="style2">G&uuml;venlik &#350;ifresi :</span> <BR> <form method=post action="<%= thispage%>">
		<input type="PASSWORD" name="usersifre" value="" size="18">
		<br>
		<br>
		<input name="submit" type="submit"  value=" Giri&#351; Yap">
	  </form>
	</td>
    <td width="19" background="../../tema/<%=sitetema%>/base_08.jpg"><img src="../../tema/<%=sitetema%>/base_08.jpg" width="19" height="20" alt="" /></td>
  </tr>
  <tr>
    <td><img src="../../tema/<%=sitetema%>/base_09.jpg" width="17" height="21" alt="" /></td>
    <td width="51" background="../../tema/<%=sitetema%>/base_10.jpg">&nbsp;</td>
    <td background="../../tema/<%=sitetema%>/base_11.jpg">&nbsp;</td>
    <td width="54" background="../../tema/<%=sitetema%>/base_11.jpg"><img src="../../tema/<%=sitetema%>/base_12.jpg" width="37" height="21" alt="" /></td>
    <td background="../../tema/<%=sitetema%>/base_11.jpg"><img src="../../tema/<%=sitetema%>/base_13.jpg" width="19" height="21" alt="" /></td>
  </tr>
</table>
<%response.end
end sub
%>
