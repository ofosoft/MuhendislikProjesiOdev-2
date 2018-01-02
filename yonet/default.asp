<%@LANGUAGE="VBSCRIPT" CODEPAGE="1254"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
<title>..:: SİTE YÖNETİMİ GİRİŞ PANELİ ::..</title>
<link href="ofosoftfirma.css" rel="stylesheet" type="text/css">
<!--#include file="func.asp"-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(img/yoneticibg.jpg);
	background-repeat:repeat-x;
	background-attachment: fixed;
	background-position: top-center;
-->
</style>
</head>
<body>
<!--#include file="bag.asp"-->
  <% 	
if islem="login" and Request.Form("user")<>"" and Request.Form("pass")<>"" and Request.Form("fkodu")=""  then
user=postkontrol(Request.Form("user"))
pass=postkontrol(Request.Form("pass"))
sorgum="select * from admin where kadi='"&user&"' and sifre='"&pass&"'"

rs.open sorgum,baglantim,1,3
if not rs.eof then
		session("usersifre") = sifremiz
		session("yetkisi")=rs("yetki")	:	session("adminyetkisi")=rs("yetki")
		Session("adminmi")="evet"
		Session("girdimi")="evet"
		Session("yol")="/Editor_Multimedia/"
		Response.Redirect("giris.asp")

	else
		hata "Üzgünüm Hata  Yaptınız",64
end if
end if
%>

</p>
<p>&nbsp; </p>
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" id="tablokenar">
  <tr>
    <td>
<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table_2">
  <tr>
    <td height="35"><div align="center" class="Menu">YÖNETİM PANELİ GİRİŞİ</div></td>
    </tr>
  <tr>
    <td><form id="form1" name="form1" method="post" action="default.asp?islem=login">
  <table width="100%" border="0" align="center" cellpadding="3" cellspacing="3">
    <tr>
      <td colspan="2"><div align="center"><strong><span class="stil2"><img src="/images/giris.gif" width="80" height="70"></span></strong></div></td>
      </tr>
    <tr>
      <td width="159"><div align="right">Kullanıcı Adı : </div></td>
        <td width="225"><div align="left">
          <input name="user" type="text" class="footersmin" id="user" size="20" />
          </div></td>
      </tr>
    <tr>
      <td><div align="right">Şifre : </div></td>
        <td><div align="left">
          <input name="pass" type="password" class="footersmin" id="pass" size="20" />
          </div></td>
      </tr>
    <tr>
      <td colspan="2"><div align="center">
        <label>
          <input name="Submit" type="submit" value="Giriş Yap" />
          </label>
        <br />
      </div></td>
        </tr>
    </table>
      </form></td>
    </tr>
  <tr>
    <td id="altzemin"><div align="center"><a href="http://www.ofosoft.com" target="_blank"><img src="/images/design_silme.png" border="0"></a></div></td>
  </tr>
</table>
</td>
  </tr>
</table>
</body>
</html>
