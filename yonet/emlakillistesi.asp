<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 or session("yetkisi")=6 or session("yetkisi")=7  then%>
	<!--#include file="emlakayar.asp"-->
	<%
	ilid=request("ilid")
	ilceid=request("ilceid")
	if islem="koyekle" then
		esorgum="Select * from koyler order by id desc"
		ers.Open esorgum, emlak, 1, 3
		ers.addnew
		ers("ilkodu")=cint(ilid)
		ers("ilcekodu")=cint(ilceid)
		ers("koykodu")=15000
		ers.update
		ers.close
	elseif islem="guncelle" then
		if Request.Form("guncelle")<>"" then
			ers.open "select * from koyler where id="&id,emlak,1,3
			ers("koyadi")=Request.Form("adi")
			ers("aciklama")=Request.Form("aciklama")
			ers("koykodu")=id
			ers.update
			ers.close
		end if
		if Request.Form("sil")<>"" then
			ers.open "delete * from koyler where id="&id,emlak,1,3
		end if
	end if%>
	<script type="text/javascript">
		function MM_jumpMenu(targ,selObj,restore){ //v3.0
			eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
			if (restore) selObj.selectedIndex=0;
		}	
	</script>
		<br>
		<b id="menubg">Lütfen Ýl Seçiminizi Yapýnýz »</b>&nbsp;&nbsp;&nbsp;
		<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:200px; font-size:13px; border-radius:5px; padding:4px;">
				<option value="?kanal=goster&ilid=0&ilceid=0">Önce Ýl Seçiniz.</option>
			<% ers.open "select * from iller where onay=1 order by iladi asc",emlak,1,3 %>
			<% do while not ers.eof
			if ers.eof then exit do%>
				<option value="?kanal=goster&ilid=<%= ers("ilkodu") %>&ilceid=0" <% if ers("ilkodu")=cint(ilid) then  %> selected="selected" <% end if %>><%= ers("iladi") %></option>
			<%ers.movenext
			  loop
			  ers.close %>
		</select>
		<%if ilid>0 then%>&nbsp;&nbsp;&nbsp;<b id="menubg">Ýlçe Seçiniz »</b>&nbsp;&nbsp;
		<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:200px; font-size:13px; border-radius:5px; padding:4px;">
				<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=0">Önce Ýl Seçiniz.</option>
			<% ers.open "select * from ilceler where ilkodu="&ilid&" order by ilceadi asc",emlak,1,3 %>
			<% do while not ers.eof
			if ers.eof then exit do%>
				<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%= ers("ilcekodu") %>" <% if ers("ilcekodu")=cint(ilceid) then  %> selected="selected" <% end if %>><%= ers("ilceadi") %></option>
			<%ers.movenext
			  loop
			  ers.close %>
		</select>
		<%end if%>
		
		<%if ilid>0 and ilceid>0 then%>
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="?islem=koyekle&ilid=<%= ilid %>&ilceid=<%=ilceid%>" class="buton" style="color:#f8f8f8">Yeni Köy Ekle</a><br><br>
			<% ers.open "select * from koyler where ilkodu="&ilid&" and ilcekodu="&ilceid&" order by koykodu desc",emlak,1,3 %>
			<table width="100%" border="0" cellpadding="2" cellspacing="2">
			<tr>
			  <td id="altzemin" width="2%" align="center"><span style="font-weight: bold">K.No</span></td>
			  <td id="altzemin" width="30%" align="left"><span style="font-weight: bold">Köyün Adý</span></td>
			  <td id="altzemin" width="50%" align="left"><span style="font-weight: bold">Açýklamasý</span></td>
			  <td id="altzemin" width="15%" colspan="2"><div align="center" style="font-weight: bold">Ýþlem</div></td>
			</tr>
			<% do while not ers.eof
			if ers.eof then exit do%>
			<form name="form1" method="post" action="?islem=guncelle&id=<%= ers("id") %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&shf=<%=shf%>">
				<tr class="tablokenar">
					<td><input name="id" type="text" id="id" value="<%= ers("koykodu") %>" size="1" disabled="disabled" style="padding-left:11px"></td>
					<td><input name="adi" type="text" id="adi" value="<%= ers("koyadi") %>" size="45"></td>
					<td><input name="aciklama" type="text" id="aciklama" value="<%= ers("aciklama") %>" size="65"></td>
					<td align="center">
						  <input name="guncelle" type="submit" id="guncelle" value="Güncelle" <%if ers("koyadi")<>"" and session("yetkisi")<>1 then%> disabled="disabled"<%end if%>>
					</td>
					<td align="center"> 
						<input name="sil" type="submit" id="sil" value="Sil" onclick="return confirm('Kaydý Tamamen Silmek Ýstediginizden Emin Misiniz?');" <% if session("yetkisi")=7 then %> disabled="disabled"<% end if %>>      
					</td>
				</tr>
			 </form>
			<%ers.movenext
			  loop
			  ers.close %>
			</table>
		<%end if%>
<%else%>
	<p align="center">
		<img src="../images/stop.gif" width="64" height="64"><br/><br/>
        Ulaþmaya Çalýþtýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br/><br/>
		<%=siteadi%><br/><br/>
	</p>
<%end if%><br>	<br>