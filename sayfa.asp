<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="bag.asp"-->
<% 
'Set istekurl = Request.ServerVariables("QUERY_STRING") 
'istekbolum = Split(istekurl,"/")
'istekbolum2=istekbolum(3)
'parcala=split(istekbolum2,"-")
IDno=Request.querystring("id")
sayfaidd=postkontrol(IDno)
sorgum="Select * from sayfa where id="&sayfaidd
		Rs.Open sorgum, Baglantim, 1, 3 
		if rs.eof or rs.bof then
			Response.Redirect("/hatalisayfa.html")
else %>
<title><%=rs("adi")%> | <%=siteadi%></title>
<!-- #include file="headic.asp" -->
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" href="style.css" rel="stylesheet"/>
</head>
<body>
    <!--#include file="ust.asp"-->
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <%if rs("blok")<2 then%>  <td width="210" valign="top"><!--#include file="solmenu.asp"--></td><%end if%>
	<td valign="top" align="left"><!--#include file="sayfa1.asp"--></td>
	<%if rs("blok")=2 or rs("blok")=0 then%><td width="210" valign="top"><!--#include file="sagmenu.asp"--></td><%end if%>
  </tr>
</table>
	<!--#include file="alt.asp"-->
</body>
<%end if
Rs.close%>
</html>