<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 then%>
<% if islem="guncelle" and id<>"" then

	if Request.Form("guncelle")<>"" then
		rs.open "select * from admin where id="&id,baglantim,1,3
		rs("adi")=Request.Form("adi")
		rs("kadi")=Request.Form("kadi")
		rs("sifre")=Request.Form("sifre")
		rs("mail")=Request.Form("mail")
		rs("yetki")=Request.Form("yetki")
		rs.update
		rs.close
	end if

	if Request.Form("sil")<>"" then
		rs.open "delete * from admin where id="&id,baglantim,1,3
		hata "Silme  Islemi Tamamlandi",48
	end if

	if Request.QueryString("id")=99999 then
		rs.open "select * from admin",baglantim,1,3
		rs.addnew
		rs("kadi")="kadi"
		rs("sifre")="pass"
		rs("yetki")=0
		rs.update
		rs.close
	end if

end if %>



  <table width="100%" border="0" cellpadding="2" cellspacing="2">
    <tr>
      <td width="20%"><span style="font-weight: bold">Adý Soyadý </span></td>
      <td width="11%"><span style="font-weight: bold">Kullanýcý Adý </span></td>
      <td width="9%"><span style="font-weight: bold">Þifre</span></td>
      <td width="20%"><span style="font-weight: bold">Mail</span></td>
      <td width="12%"><span style="font-weight: bold">Yetkisi</span></td>
      <td width="28%"><div align="center" style="font-weight: bold">Ýþlem</div></td>
    </tr>
 <% rs.open "select * from admin",baglantim,1,3 %>
	<% do while not rs.eof  %>
<form name="form1" method="post" action="?islem=guncelle&id=<%= rs("id") %>">
  
    <tr class="tablokenar">
      <td>
        <input name="adi" type="text" id="adi" value="<%= rs("adi") %>" size="25">      </td>
      <td><input name="kadi" type="text" id="kadi" value="<%= rs("kadi") %>" size="10"></td>
      <td><input name="sifre" type="password" id="sifre" value="<%= rs("sifre") %>" size="10"></td>
      <td><input name="mail" type="text" id="mail" value="<%= rs("mail") %>" size="25"></td>
      <td><label>
        <select name="yetki" id="yetki">
          <option value="1" <%if rs("yetki")=1 then%> selected="selected"<%end if%>>Site Y&ouml;neticisi</option>
          <option value="0"<%if rs("yetki")=0 then%> selected="selected"<%end if%>>Site Edit&ouml;r&uuml;</option>
          <option value="2"<%if rs("yetki")=2 then%> selected="selected"<%end if%>>Yemekhane Görevlisi</option>
		  <option value="5"<%if rs("yetki")=5 then%> selected="selected"<%end if%>>Misafirhane Görevlisi</option>
          <option value="3"<%if rs("yetki")=3 then%> selected="selected"<%end if%>>Personel Görevlisi</option>
          <option value="4"<%if rs("yetki")=4 then%> selected="selected"<%end if%>>Galeriler Görevlisi</option>		  
		  <option value="6"<%if rs("yetki")=6 then%> selected="selected"<%end if%>>Emlak Arþiv Yöneticisi</option>	
		  <option value="7"<%if rs("yetki")=7 then%> selected="selected"<%end if%>>Emlak Arþiv Editörü</option>	
          <option value="10"<%if rs("yetki")=10 then%> selected="selected"<%end if%>>Diðer Ýçerikler</option>		  
		  </select>
      </label></td>
      <td>
        <div align="center">
          <input name="guncelle" type="submit" id="guncelle" value="Güncelle">
          
          <input name="sil" type="submit" id="sil" value="Sil" <% if rs.recordcount=1 then %>  onclick="return confirm('Silmek Ýstediginizden Emin Misiniz?');" disabled="disabled" <% end if %>>      
        </div></td>
    </tr>
 </form>	  
	
<% 	rs.movenext
	loop %>
	 <tr>
      <td height="40" colspan="6"><div align="center"><a href="?islem=guncelle&id=99999">Yeni Yönetici Ekle 
  	  </a></div></td>
    </tr>
  </table>
<%else%>
<p align="center"><img src="../images/stop.gif" width="64" height="64"><br>
          <br />
        Ulaþmaya Çalýþtýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br>
	<%=siteadi%><br>
      <br>
<%end if%>
