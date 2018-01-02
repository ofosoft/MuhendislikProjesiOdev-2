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
IDno=Request.querystring("id")
sayfaidd=postkontrol(IDno)
sorgum="Select * from sayfa where id="&sayfaidd
		Rs.Open sorgum, Baglantim, 1, 3 
		if rs.eof or rs.bof then
			Response.Redirect("/hatalisayfa.html")
else %>
<title><%=rs("adi")%> | <%=siteadi%></title>
</head>
<body>
    <!--#include file="top.asp"--> 
	<!--#include file="sayfayeni1.asp"--> 
	<!--#include file="bottom.asp"-->
</body>
</html>
<%end if
Rs.close%>
</html>