<!DOCTYPE html>
<html lang="tr">
<head>
	<!--#include file="bag.asp"-->
	<!--#include file="head.asp"-->
<%
'Set istekurl = Request.ServerVariables("QUERY_STRING") 
'istekbolum = Split(istekurl,"/")
'istekbolum2=istekbolum(3)
'parcala=split(istekbolum2,"-")
shf=request("shf")
yer="haber"
%>
<title><%=klm(5)%> | <%=siteadi%></title>
</head>
<body>
    <!--#include file="top.asp"--> 
	<!--#include file="haberyeni1.asp"--> 
	<!--#include file="bottom.asp"-->
</body>
</html>