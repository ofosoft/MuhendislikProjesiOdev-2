<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 then%>
<% sorgum="select * from kelimeler"
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then
 
 else
	if Request.Form("guncelle")<>"" then
       for i=1 to 100
   	    rs("k"&i&"")=Request.form("k"&i&"")
	   next
	   rs.update%>
<p class="mbon" style="background-color:#FFFF99"><center><strong><img src="../images/bilgi.png" width="128" height="128" /><br />
Kelimeler Baþarýyla Güncellendi.</strong>
</center></p><%
	end if	

%>
<form name="form1" method="post" action="">
<table width="100%" border="0" align="center" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px"> 
 <tr onmouseover="this.style.backgroundColor='#96DEDE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
      <td colspan="6" align="center"><input name="guncelle" type="submit" class="footersmin" id="guncelle" value="Kelimeleri Kaydet"></td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#96DEDE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
  <% for i=1 to 100
  a=a+1 %> 	
    <td width="16%"><div align="right"><strong><%=i%> - <%= rs("k"&i&"") %> : </strong></div></td>
    <td width="16%"><div align="left">
      <input name="k<%=i%>" type="text" class="footersmin" id="k<%=i%>" value="<%= rs("k"&i&"") %>" size="20">
    </div></td>
  
  <%if a=3 then%><tr onmouseover="this.style.backgroundColor='#96DEDE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" ></tr>
  <%a=0
  end if
  next%><td align="right"></tr>
 <tr onmouseover="this.style.backgroundColor='#96DEDE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
      <td colspan="6" align="center"><input name="guncelle" type="submit" class="footersmin" id="guncelle" value="Kelimeleri Kaydet"></td>
    </tr>
</table>
</form>

<% end if %>
<%else%>
<p align="center"><img src="../images/stop.gif" width="64" height="64"><br>
          <br />
          Ulasmaya Çalýþtýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br>
	<%=siteadi%><br>
      <br>
<%end if%>