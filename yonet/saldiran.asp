<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 then%>
<% 	sorgum="Select * from saldiran order by id desc"
	Rs.Open Sorgum, Baglantim, 1, 3  
	i=0
	%>
<%    
if islem="sil" then
	    sorgum="delete * from saldiran where id="&id 
		Rx.Open Sorgum, Baglantim, 1, 3

		Response.Redirect("sayfa_sec.asp?sayfa=saldiran")
elseif islem="engelle" then
 		sorgum="Select * from saldiran where id="&id
		Ru.Open Sorgum, Baglantim, 1, 3  
		do while not ru.eof
		 ru("engel")=true
		 ru.movenext
		loop
		ru.close
		Response.Redirect("sayfa_sec.asp?sayfa=saldiran")
elseif islem="engelkaldir" then
 		sorgum="Select * from saldiran where id="&id
		Ru.Open Sorgum, Baglantim, 1, 3  
		do while not ru.eof
		 ru("engel")=false
		 ru.movenext
		loop
		ru.close
		Response.Redirect("sayfa_sec.asp?sayfa=saldiran")
end if				 
%>
	<table width="76%" border="0" cellpadding="3" cellspacing="2" align="center" >
  <tr>
    <td width="32%" align="center"><strong>Tarih</strong></td>
    <td width="29%" align="center"><strong>IP Adresi</strong></td>
    <td width="18%" align="center"><span style="font-weight: bold">Engel Durumu</span></td>
    <td width="21%" align="center"><span style="font-weight: bold">&#304;&#351;lemler</span></td>
  </tr>
   <% do while not rs.eof %>
   <tr onmouseover="this.style.backgroundColor='#EEEEEE';" onMouseOut="this.style.backgroundColor='#FFFFFF';">
    <td width="32%" align="center">
     <%= rs("tarih") %> </td>
    <td width="29%" align="center"><%= rs("ip") %></td>
<td width="18%" align="center">
<% if rs("engel")=true then %>
	  						  <img src="images/true.gif" border="0"/>
					      <% else %>
							  <img src="images/false.gif" border="0"/>
					      <% end if %>    </td>
    <td width="21%" align="center">
    <% if rs("engel")=false then %>
     <a href="?islem=engelle&amp;id=<%= rs("id") %>"><img src="images/engelle.jpg" border="0" /></a> &nbsp;
    <%else%>
    <a href="?islem=engelkaldir&amp;id=<%= rs("id") %>"><img src="images/kaldir.jpg" border="0" /></a>&nbsp;<%end if%>
    <a href="?islem=sil&amp;id=<%= rs("id") %>"><img src="images/sil.jpg" border="0" /></a></td>
   </tr>
  <% rs.movenext
     i=i+1
  loop 
  rs.close%>
</table>
 <% if i=0 then
      response.Write ("<center>Kayitli Saldiri Bulunamadi.</center>")
	else
	  response.write "<center>Toplam Saldiri Sayisi :<b> ["&i&"]</b></center>"
	end if  
    %>
<%else%>
<p align="center"><img src="../images/stop.gif" width="64" height="64"><br>
          <br />
        Ulaþmaya Çalýþtýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br>
	<%=siteadi%><br>
      <br>
<%end if%>
