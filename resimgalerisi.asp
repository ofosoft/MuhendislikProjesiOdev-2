<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="bag.asp"-->
<%
'Set istekurl = Request.ServerVariables("QUERY_STRING") 
'istekbolum = Split(istekurl,"/")
'istekbolum2=istekbolum(3)
'parcala=split(istekbolum2,"-")
%>
<title><%=klm(22)%> | <%=siteadi%></title>
<!-- #include file="headic.asp" -->
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" href="style.css" rel="stylesheet"/>
</head>
<body>
    <!--#include file="ust.asp"-->
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="210" valign="top"><!--#include file="solmenu.asp"--></td><td width="5"></td>
	<td valign="top"><!--#include file="resimgalerisi1.asp"--></td><td width="5"></td>
	<td width="210" valign="top"><!--#include file="sagmenu.asp"--></td>
  </tr>
</table>
	<!--#include file="alt.asp"-->
</body>
</html>