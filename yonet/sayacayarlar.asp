<LINK href="ie.css" type=text/css rel=stylesheet>
<!--#INCLUDE file="sifre.asp"-->
<!--#include file="../ayarlar.asp"-->
<% 
bgcolor1 = "#F7F7F7"      
bgcolor2 = "#FFFFFF"     

db_veriyolu ="../" & vtyolu & "/"& vtadi &""


set Sur = server.createobject("adodb.connection")
Sur.open "provider=microsoft.jet.oledb.4.0;data source=" & Server.mappath(db_veriyolu & ".mdb")
Set efkan = Server.CreateObject("ADODB.Recordset")
Set efkan1 = Server.CreateObject("ADODB.Recordset")
Set efkan2= Server.CreateObject("ADODB.Recordset")


%>

