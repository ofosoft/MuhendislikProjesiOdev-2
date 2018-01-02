<!--#include file="../ayarlar.asp"-->
<!--#include file="bag2.asp"-->
 <% 
db_veriyolu ="../" & vtyolu & "/"& vtadi &""
Set data=Server.CreateObject("ADODB.Connection") 
data.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.mappath(db_veriyolu & ".mdb")
%> 