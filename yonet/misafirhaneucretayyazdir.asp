<!--#include file="bag.asp"-->
<!--#include file="sifre.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Language" content="tr">
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
	<link href="ofosoftfirma.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	<!--
	body,td,th {
		font-family: Verdana;
		font-size: 16px;
		color: #000000;
	}
	-->
	</style>
	<style media="print">
	.noprint { display: none; }
	</style>
</head>
<body onLoad="window.print()">
<%
adminyetkisi=cint(session("adminyetkisi"))	:	akod=cint(session("adminyetkisi"))
if adminyetkisi=1 or adminyetkisi=5 then%>
<%ay=session("ayyemekay")		:	yil=session("ayyemekyil")		:	sinif=session("ayyemeksinif")	:	sicilno=session("ayaramasicilno")
   if ay="" then
	ay=month(date) : yil=year(date)	: sinif=0	: sicilno="tumu"
   end if
    if sicilno="tumu" then
	  sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" and sinif="&sinif&" order by adisoyadi asc"
	 else
	  sorgum="select * from misafirhane_ucretay where ay="&ay&" and yil="&yil&" and sinif="&sinif&" and sicilno='"&sicilno&"' order by adisoyadi asc"
	 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then
%>
<div align="center"><img src="/images/hata.png"><br><br/>Aradığınız Kriterlere Ait Kayıt Bulunmamaktadır...<br/><br/></div>
<%else%>
<table width="950" align="center" border="1" cellpadding="3" cellspacing="0">
<tr><td colspan="4" align="center" height="30" bgcolor="#000000"><b><font color="#ffffff">. . . : : : <%=ucase(ayadibul(ay))%>&nbsp;<%=yil%> MİSAFİRHANE YEMEK ÜCRETİ KESİNTİ LİSTESİ : : : . . .</font></b></td></tr>
  <tr bgcolor="#d8d8d8">
    <td width="70" class="altcizgiduz1" height="30"><div align="center"><strong>Sıra No</strong></div></td>
    <td class="altcizgiduz1"><div align="center" style="font-weight: bold">Sicil No</div></td>
    <td class="altcizgiduz1"><div align="left" style="font-weight: bold">Adı Soyadı</div></td>
    <td class="altcizgiduz1"><div align="right" style="font-weight: bold">Toplam Ücret</div></td>
  </tr>
  <%sno=1	: tucret=0	: tadet=0
		do while not rs.eof
		  if rs.eof then exit do 
		%>
    <tr class="altkesikcizgi1" <%if renk=1 then%>bgcolor="#f3f3f3"<%renk=0%><%else%><%renk=1%><%end if%>>
     <td width="70" height="28" align="center" class="altcizgikesik1"><strong><%=sno%></strong></td>
     <td width="100" align="center" class="altcizgikesik1"><%= rs("sicilno") %></td>
     <td width="500" class="altcizgikesik1"><%= rs("adisoyadi") %></td>
     <td width="120" align="right" class="altcizgikesik1"><%tucret=tucret+rs("ucret")%>
	 <%yazi= rs("ucret")
	sonuc = InStr(1,yazi, ",")
	if sonuc<>0 then
	 response.write (""&rs("ucret")&"0")
	else
	 response.write (""&rs("ucret")&",00")
	end if%> TL</td>
   </tr>
	 <% sno=sno+1
      rs.movenext
	loop
	
	
	
	%>
<tr bgcolor="#333333">
<td colspan="2" align="center"><td>
<td colspan="2" align="right" height="30"><b><font color="#f8f8f8"> Toplam Ücret :&nbsp;<em><%=tucret%> <%=tson%> TL</em>&nbsp;&nbsp;</font></b></td>
</tr>
</table>
<%end if
rs.close%>
<%else%>
<div align="center"><img src="../ofosoft_img/hata.png"><br><br />Ulaşmaya Çalıstığınız Sayfaya Erişim Yetkiniz Bulunmamaktadır.<br /><br><%=siteadi%><br><br></div>
<%end if%>
</body>
</html>