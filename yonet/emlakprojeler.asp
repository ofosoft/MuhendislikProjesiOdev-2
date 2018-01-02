<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 or session("yetkisi")=6 or session("yetkisi")=7  then%>
<!--#include file="emlakayar.asp"-->
<% if islem="guncelle" and id<>"" then

	if Request.Form("guncelle")<>"" then
		ers.open "select * from projeler where id="&id,emlak,1,3
		ers("projead")=Request.Form("adi")
		ers("aciklama")=Request.Form("aciklama")
		'ers("recid")=Request.Form("id")
		ers.update
		ers.close
	end if

	if Request.Form("sil")<>"" then
		ers.open "delete * from projeler where id="&id,emlak,1,3
	end if

	if Request.QueryString("id")=999999 then	
		esorgum="Select * from projeler order by id desc"
		ers.Open esorgum, emlak, 1, 3
		ers.addnew
		ers("recid")=Request.QueryString("kayitid")
		'ers("projead")="kadi"
		'ers("aciklama")="pass"
		ers.update
		ers.close
	end if

end if %>
	<%
	esorgum="Select * from projeler order by id desc"
	ers.Open esorgum, emlak, 1, 3%>
  <table width="100%" border="0" cellpadding="2" cellspacing="2">
	<tr>
      <td height="40" colspan="5"><div align="center"><a href="?islem=guncelle&id=999999&kayitid=<%=int(ers.recordcount)+1%>" class="buton" style="color:#f8f8f8">Yeni Proje Ekle</a></div></td>
    </tr>
    <tr>
      <td id="menubg" width="2%" align="center"><span style="font-weight: bold">K.No</span></td>
      <td id="menubg" width="35%"><span style="font-weight: bold">Proje Adý</span></td>
      <td id="menubg" width="50%"><span style="font-weight: bold">Açýklamasý</span></td>
      <td id="menubg" width="15%" colspan="2"><div align="center" style="font-weight: bold">Ýþlem</div></td>
    </tr>
	<% 	 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if
		ers.pagesize = 25
		ers.absolutepage = shf
		cellcolor="#FFFFFF"
		sayfa = ers.pagecount
	  	for i=1 to 25
		if ers.eof then exit for%>
		<form name="form1" method="post" action="?islem=guncelle&id=<%= ers("id") %>&shf=<%=shf%>">
			<tr class="tablokenar">
				<td><input name="id" type="text" id="id" value="<%= ers("recid") %>" size="1" disabled="disabled" style="padding-left:11px"></td>
				<td><input name="adi" type="text" id="adi" value="<%= ers("projead") %>" size="55"></td>
				<td><input name="aciklama" type="text" id="aciklama" value="<%= ers("aciklama") %>" size="55"></td>
				<td align="center">
					  <input name="guncelle" type="submit" id="guncelle" value="Güncelle" <% if session("yetkisi")=7 then %> disabled="disabled"<% end if %>>
				</td>
				<td align="center"> 
					<input name="sil" type="submit" id="sil" value="Sil" onclick="return confirm('Kaydý Tamamen Silmek Ýstediginizden Emin Misiniz?');" <%if session("yetkisi")=7 then %> disabled="disabled"<% end if %>>      
				</td>
			</tr>
		 </form>
	<%ers.movenext
	next%>
	 <tr>
		<td height="40" colspan="3">
		 <%for y=1 to sayfa 
			if cint(shf)=cint(y) then %>
			<strong id="menubg" style="color:#f8f8f8; width:40px"><%= y %></strong>
			<% else %>
			 <a href="?sayfa=emlak projeler&shf=<%= y %>" class="buton" style="color:#f8f8f8; width:40px"><%= y %></a>	
			<% end if
		next %>		
		</td>
		<td height="40" colspan="2" align="center">
			<a href="?islem=guncelle&id=999999&kayitid=<%=int(ers.recordcount)+1%>" class="buton" style="color:#f8f8f8">Yeni Proje</a>
		</td>
    </tr>
  </table>	
	<%ers.close%>
<%else%>
<p align="center"><img src="../images/stop.gif" width="64" height="64"><br>
          <br/>
        Ulaþmaya Çalýþtýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br/><br>
	<%=siteadi%><br>
      <br>
<%end if%>