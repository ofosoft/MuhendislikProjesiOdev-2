<!--#include file="sifre.asp"-->
<%if Request.Form("guncelle")<>"" then
		rs.open "select * from yemek",baglantim,1,3
		do while not rs.eof
		 rs("yemek1")=Request.Form("yemek1_"&rs("id")&"")
		 rs("yemek2")=Request.Form("yemek2_"&rs("id")&"")
		 rs("yemek3")=Request.Form("yemek3_"&rs("id")&"")
		 rs("yemek4")=Request.Form("yemek4_"&rs("id")&"")
		 rs("aciklama")=Request.Form("aciklama_"&rs("id")&"")
		 rs.update
		 rs.movenext
		loop 
	rs.close
	Response.Redirect("giris.asp")
	end if
%>
<form name="form1" method="post" action="?islem=guncelle">
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
    <tr>
     <td>&nbsp;</td>
     <td colspan="5"><div align="left">
         <input name="Guncelle" type="submit" id="Guncelle" value="Yemek Bilgilerini G&uuml;ncelle" class="buton">
          </div></td>
     </tr>
	<tr>
      <td width="3%"><span style="font-weight: bold">Gün</span></td>
      <td width="15%"><span style="font-weight: bold">1. Yemek Adý</span></td>
      <td width="15%"><span style="font-weight: bold">2. Yemek Adý</span></td>
      <td width="15%"><span style="font-weight: bold">3. Yemek Adý</span></td>
      <td width="15%"><span style="font-weight: bold">4. Yemek Adý</span></td>
      <td width="32%"><span style="font-weight: bold">Açýklama</span></td>
    </tr>    <tr><td colspan="6"><hr /></td></tr>
<% rs.open "select * from yemek",baglantim,1,3 %>
<% do while not rs.eof  %>
    <tr>
      <td><input name="id" type="text" id="id" value="<%= rs("id") %>" size="5">      </td>
      <td><input name="yemek1_<%= rs("id") %>" type="text" id="yemek1_<%= rs("id") %>" value="<%= rs("yemek1") %>" size="18"></td>
      <td><input name="yemek2_<%= rs("id") %>" type="text" id="yemek2_<%= rs("id") %>" value="<%= rs("yemek2") %>" size="18"></td>
      <td><input name="yemek3_<%= rs("id") %>" type="text" id="yemek3_<%= rs("id") %>" value="<%= rs("yemek3") %>" size="18"></td>
      <td><input name="yemek4_<%= rs("id") %>" type="text" id="yemek4_<%= rs("id") %>" value="<%= rs("yemek4") %>" size="18" /></td>
      <td><input name="aciklama_<%= rs("id") %>" type="text" id="aciklama_<%= rs("id") %>" value="<%= rs("aciklama") %>" size="40" /></td>
    </tr>
    <tr><td colspan="6"><hr /></td></tr>
<%rs.movenext
loop %>
    <tr>
     <td>&nbsp;</td>
     <td colspan="5"><div align="left">
         <input name="Guncelle" type="submit" id="Guncelle" value="Yemek Bilgilerini G&uuml;ncelle" class="buton">
          </div></td>
     </tr>
</table>
</form>