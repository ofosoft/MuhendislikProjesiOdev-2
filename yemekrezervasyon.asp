<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="bag.asp"-->
<title>Online Yemek Rezervasyonu | <%=siteadi%></title>
<!-- #include file="headic.asp" -->
<link rel="shortcut icon" href="favicon.ico" />
<link type="text/css" href="style.css" rel="stylesheet"/>
</head>
<body>
<div class="blokkenar" style="min-height:340px; margin-left:5px;margin-top:5px;"><div class="menubaslik">Online Yemek Rezervasyonu | <%=date()%></div>
<%if ikip="10.119" then
if rezervasyon="acik" then%>
<!-- #include file="yemekrezervasyonic.asp" -->
<%else%>
<center><br><br>Rezervasyon S�resi Sona Ermi�tir.
<br><img src="images/hata.png"><br>
Yemekhane Y�netimi Ad�na<br><br>�smail TEKE</center>
<%end if%>
<%else%>
<center><br><br>B�lgemiz Personeli Olmad���n�z ��in Bu Sayfay� G�r�nt�leme Yetkiniz Bulunmamaktad�r.
<br><img src="images/hata.png"><br>
Site Y�netimi</center>
<%end if%>

</div>
<center><input type="image" src="images/pencereyikapat.gif" value="Pencereyi Kapat" onClick="javascript:self.close();"></center>
</body>
</html>