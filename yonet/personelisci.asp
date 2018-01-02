<!--#include file="sifre.asp"-->
<%if adminyetkisi=1 or adminyetkisi=3 then%>
<table width="100%" border="0" cellspacing="1" cellpadding="1">
  <tr>
    <td width="300px" valign="top"><!--#include file="personelisciust.asp"--></td></tr>
    <tr><td valign="top">
<%
   if islem="tekrarlistele" or listele="evet" then
 	 sorgum="select * from personel_isci where subekodu="&tskodu&" and durum="&tdurum&" order by adi_soyadi asc"
    else
     sorgum="select * from personel_isci order by adi_soyadi asc"
   end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then
%>
<div align="center"><img src="/images/hata.png"><br><br/>Aradýðýnýz Kriterlere Ait Personel Kaydý Bulunmamaktadýr...<br/><br/></div>
<%else%>
<!--#include file="personeliscialt.asp"-->
<%end if%>
</td>
  </tr>
</table>
<%else%>
<div align="center"><img src="../ofosoft_img/hata.png"><br><br />Ulaþmaya Çalýstýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br><%=siteadi%><br><br></div>
<%end if%>