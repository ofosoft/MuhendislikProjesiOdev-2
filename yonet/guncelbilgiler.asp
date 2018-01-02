<!--#include file="sifre.asp"-->
<%if Request.Form("guncelle")<>"" then
		rs.open "select * from olay order by s_no asc",baglantim,1,3
		do while not rs.eof
		if rs.eof then exit do
		 rs("soz")=Request.Form("soz_"&rs("s_no")&"")
		 rs("olay1")=Request.Form("olay1_"&rs("s_no")&"")
		 rs("olay2")=Request.Form("olay2_"&rs("s_no")&"")
		 rs("olay3")=Request.Form("olay3_"&rs("s_no")&"")
		 rs.update
		 rs.movenext
		loop 
	rs.close
	Response.Redirect("giris.asp")
	end if
%>
<form name="form1" method="post" action="?islem=guncelle">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
     <td>&nbsp;</td>
     <td colspan="4"><div align="left">
         <input name="Guncelle" type="submit" id="Guncelle" value="Aktüel Bilgileri G&uuml;ncelle" class="buton">
          </div></td>
     </tr>
	<tr>
      <td width="3%"><span style="font-weight: bold">Tarih</span></td>
      <td width="15%"><span style="font-weight: bold">Günün Sözü</span></td>
      <td width="15%"><span style="font-weight: bold">Olay 1</span></td>
      <td width="15%"><span style="font-weight: bold">Olay 2</span></td>
      <td width="15%"><span style="font-weight: bold">Olay 3</span></td>
    </tr>
	<tr><td colspan="5"><hr /></td></tr>
<% rs.open "select * from olay order by s_no asc",baglantim,1,3 %>
<% do while not rs.eof  %>
    <tr class="altkesikcizgi">
      <td class="altcizgikesik" height="30"><input name="id" type="text" id="id" value="<%= rs("gun") %>.<%= rs("ay") %>" size="2" rows="3">      </td>
      <td class="altcizgikesik"><input name="soz_<%= rs("s_no") %>" type="text" id="soz_<%= rs("s_no") %>" value="<%= rs("soz") %>" size="40"></td>
      <td class="altcizgikesik"><input name="olay1_<%= rs("s_no") %>" type="text" id="olay1_<%= rs("s_no") %>" value="<%= rs("olay1") %>" size="27"></td>
      <td class="altcizgikesik"><input name="olay2_<%= rs("s_no") %>" type="text" id="olay2_<%= rs("s_no") %>" value="<%= rs("olay2") %>" size="27"></td>
      <td class="altcizgikesik"><input name="olay3_<%= rs("s_no") %>" type="text" id="olay3_<%= rs("s_no") %>" value="<%= rs("olay3") %>" size="27" /></td>
    </tr>
<%rs.movenext
loop %>
    <tr>
     <td>&nbsp;</td>
     <td colspan="4"><div align="left">
         <input name="Guncelle" type="submit" id="Guncelle" value="Aktüel Bilgileri G&uuml;ncelle" class="buton">
          </div></td>
     </tr>
</table>
</form>