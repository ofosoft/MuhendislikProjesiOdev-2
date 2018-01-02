<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="bag.asp"-->
<%
IDno=request("id")
if IDno="" then
	Response.Redirect("/hatalisayfa.asp")
end if 
	sorgum="select * from video where onay=1 and id="&IDno
	Rs.Open Sorgum, Baglantim, 1, 3 
if Rs.eof or Rs.bof then
	Response.Redirect("/hatalisayfa.html")
end if%>	
<title><%=rs("isim")%> | <%=siteadi%></title>
<!-- #include file="headic.asp" -->
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" href="style.css" rel="stylesheet"/>
</head>
<body>
    <!--#include file="ust.asp"-->
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="210" valign="top"><!--#include file="solmenu.asp"--></td><td width="5"></td>
	<td valign="top"><!--#include file="videogoster1.asp"--></td><td width="5"></td>
  </tr>
</table>
	<!--#include file="alt.asp"-->
</body>
</html>
<%rs.close%>