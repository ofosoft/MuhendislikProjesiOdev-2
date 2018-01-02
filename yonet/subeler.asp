<!--#include file="sifre.asp"-->
<%if Request.Form("guncelle")<>"" then
		rs.open "select * from subeler",baglantim,1,3
		do while not rs.eof
		 rs("sube_adi")=Request.Form("subeadi_"&rs("id")&"")
		 rs("isyeri_adi")=Request.Form("isyeriadi_"&rs("id")&"")
		 rs("sube_kodu")=Request.Form("subekodu_"&rs("id")&"")
		 rs("sirano")=Request.Form("sirano_"&rs("id")&"")
		 rs.update
		 rs.movenext
		loop 
	rs.close
	Response.Redirect("giris.asp")
	end if
%>
<form name="form1" method="post" action="?islem=guncelle" style="margin:0px; padding:0px;">
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
    <tr>
     <td>&nbsp;</td>
     <td colspan="3"><div align="left">
         <input name="Guncelle" type="submit" id="Guncelle" value="Þube Bilgilerini G&uuml;ncelle" class="buton">
          </div></td>
     </tr>
	<tr>
      <td width="10%"><span style="font-weight: bold">Þube Kodu</span></td>
      <td width="10%"><span style="font-weight: bold">Liste Sýrasý</span></td>
      <td width="15%"><span style="font-weight: bold">Þube Adý</span></td>
      <td width="15%"><span style="font-weight: bold">Ýþyeri Adý</span></td>
	  </tr>    <tr><td colspan="4"><hr /></td></tr>
<% rs.open "select * from subeler order by sirano asc",baglantim,1,3 %>
<% do while not rs.eof  %>
    <tr>
      <td><input name="subekodu_<%= rs("id") %>" type="text" id="subekodu_<%= rs("id") %>" value="<%= rs("sube_kodu") %>" size="3"></td>
  	  <td><input name="sirano_<%= rs("id") %>" type="text" id="sirano_<%= rs("id") %>" value="<%= rs("sirano") %>" size="3"></td>
      <td><input name="subeadi_<%= rs("id") %>" type="text" id="subeadi_<%= rs("id") %>" value="<%= rs("sube_adi") %>" size="60"></td>
      <td><input name="isyeriadi_<%= rs("id") %>" type="text" id="isyeriadi_<%= rs("id") %>" value="<%= rs("isyeri_adi") %>" size="50"></td>
    </tr>
    <tr><td colspan="4"><hr /></td></tr>
<%rs.movenext
loop %>
    <tr>
     <td>&nbsp;</td>
     <td colspan="3"><div align="left">
         <input name="Guncelle" type="submit" id="Guncelle" value="Þube Bilgilerini G&uuml;ncelle" class="buton">
          </div></td>
     </tr>
</table>
</form>