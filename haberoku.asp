<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="bag.asp"-->
<%
'Set istekurl = Request.ServerVariables("QUERY_STRING") 
'istekbolum = Split(istekurl,"/")
'istekbolum2=istekbolum(3)
'parcala=split(istekbolum2,"-")
IDno=postkontrol(request("id"))
if IDno="" then
	Response.Redirect("/hatalisayfa.html")
end if 
	sorgum="select * from haber where goster=1 and hkodu="&IDno
	Rs.Open Sorgum, Baglantim, 1, 3 
if Rs.eof or Rs.bof then
	Response.Redirect("/hatalisayfa.html")
end if%>	
<title><%=rs("baslik")%> | <%=siteadi%></title>
<!-- #include file="headic.asp" -->
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" href="style.css" rel="stylesheet"/>
</head>
<body>
    <!--#include file="ust.asp"-->
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<%if IDno<>506 then%><td width="210" valign="top"><!--#include file="solmenu.asp"--></td><td width="5"></td><%end if%>
	<td valign="top"><!--#include file="haberoku1.asp"--></td><td width="5"></td>
	<%if IDno<>506 then%><td width="210" valign="top"><!--#include file="sagmenu.asp"--></td><%end if%>
  </tr>
</table>
	<!--#include file="alt.asp"-->
</body>
</html>