<%@LANGUAGE="VBSCRIPT" CODEPAGE="1254"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>Çıkış Yap</title>
</head>

<body>
<%
Session.Abandon()
Response.Redirect("/default.asp")
 %>
</body>
</html>
