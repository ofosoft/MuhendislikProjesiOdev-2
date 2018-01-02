<%@codepage=1254%>
<!-- #include file="conn.asp"-->
<% id=Request.QueryString("id") %>
<%
exec=Request.QueryString("exec")
if exec="delete" then
call delete
end if
%>
<html>
<head>
<title>Duyuru Oku</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
<style type="text/css">
<!--
body,td,th {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
-->
</style></head>

<body>
<%
Set muslim1 = Server.CreateObject("ADODB.Recordset")
sor1 = "Select * from duyurular where id="&id
muslim1.Open sor1,Sur,1,3
%>
<br>
<table width="95%"  border="0" cellspacing="0" cellpadding="1">
  <tr>
    <td><b><%=muslim1("baslik")%></b></td>
  </tr>
  <tr>
    <td><%=muslim1("detay")%></td>
  </tr>
  <tr>
    <td><%=muslim1("tarih")%></td>
  </tr>
  <tr>
    <td><div align="center"><br>
      <br>
      <a href="duyuruoku.asp?id=<%=muslim1("id")%>&exec=delete">Sil
      </a> </div></td>
  </tr>
</table>
</body>
</html>
<% sub delete
Response.Expires = -1000
Set id = Request.QueryString("id")
SQL = "delete from duyurular where id="
SQL = SQL & id
set rs=sur.Execute(SQL)
Response.End
End Sub


%>