<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 or session("yetkisi")=6 or session("yetkisi")=7  then%>
	<!--#include file="emlakayar.asp"-->
	<%
	ilid=request("ilid")
	ilceid=request("ilceid")
	koyid=request("koyid")
	shf = Request.QueryString("shf")
	aranan=request("aranan")
	if shf="" then shf=1 end if
	if islem="arsivekle" then
		ekayitno=kayitnobul(ilid, ilceid)
		response.write(ekayitno)
		esorgum="Select * from arsiv order by id desc"
		ers.Open esorgum, emlak, 1, 3
		ers.addnew
		ers("ilkod")=cint(ilid)
		ers("ilcekod")=cint(ilceid)
		ers("koykod")=cint(koyid)
		ers("kayitno")=ekayitno+1
		'ers("kayitno")=ekayitno
		ers.update
		ers.close
		islem=""
	elseif islem="guncelle" then
		if Request.Form("guncelle")<>"" then
			ers.open "select * from arsiv where id="&id,emlak,1,3
			ers("adsoy")=Request.Form("adi")
			if Request.Form("ada")<>"" then
				ers("ada")=Request.Form("ada")
			end if
			if Request.Form("parsel")<>"" then
				ers("parsel")=Request.Form("parsel")
			end if
			ers("aciklama")=Request.Form("aciklama")
			if Request.Form("proje")<>"" then
				ers("proje")=Request.Form("proje")
			end if
			ers.update
			ers.close
			islem=""
		end if
		if Request.Form("sil")<>"" then
			ers.open "delete * from arsiv where id="&id,emlak,1,3
		end if
	end if%>
	<script type="text/javascript">
		function MM_jumpMenu(targ,selObj,restore){ //ofosoft
			eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
			if (restore) selObj.selectedIndex=0;
		}	
	</script>
		<br>
		<b id="menubg">Ýl Seçiniz »</b>&nbsp;
		<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:150px; font-size:13px; border-radius:5px; padding:4px;">
				<option value="?kanal=goster&ilid=0&ilceid=0&koyid=0">Önce Ýl Seçiniz.</option>
			<% ers.open "select * from iller where onay=1 order by iladi asc",emlak,1,3 %>
			<% do while not ers.eof
			if ers.eof then exit do%>
				<option value="?kanal=goster&ilid=<%= ers("ilkodu") %>&ilceid=0&koyid=0" <% if ers("ilkodu")=cint(ilid) then  %> selected="selected" <% end if %>><%= ers("iladi") %></option>
			<%ers.movenext
			  loop
			  ers.close %>
		</select>
		<%if ilid>0 then%>&nbsp;&nbsp;<b id="menubg">Ýlçe Seçiniz »</b>&nbsp;
		<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:150px; font-size:13px; border-radius:5px; padding:4px;">
				<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=0&koyid=0">Önce Ýl Seçiniz.</option>
			<% ers.open "select * from ilceler where ilkodu="&ilid&" order by ilceadi asc",emlak,1,3 %>
			<% do while not ers.eof
			if ers.eof then exit do%>
				<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%= ers("ilcekodu") %>&koyid=0" <% if ers("ilcekodu")=cint(ilceid) then  %> selected="selected" <% end if %>><%= ers("ilceadi") %></option>
			<%ers.movenext
			  loop
			  ers.close %>
		</select>
		<%end if%>
		<%if ilceid>0 then%>&nbsp;&nbsp;<b id="menubg">Köy Seçiniz »</b>&nbsp;
		<% ers.open "select * from koyler where ilkodu="&ilid&" and ilcekodu="&ilceid&" order by koyadi asc",emlak,1,3 
			if ers.recordcount>0 then%>
				<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:245px; font-size:13px; border-radius:5px; padding:4px;">
					<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%= ilceid %>&koyid=0">Önce Ýlçe Seçiniz.</option>
						<% do while not ers.eof
						if ers.eof then exit do%>
							<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%=ilceid %>&koyid=<%= ers("koykodu") %>" <% if ers("koykodu")=cint(koyid) then  %> selected="selected" <% end if %>><%= ers("koyadi") %></option>
						<%ers.movenext
						  loop%>
					</select>	 
				<%else%>				
				<a href="sayfa_sec.asp?sayfa=emlak il listesi" class="buton" style="color:#f8f8f8">Kayýtlý Köy Bulunamadý. Yeni Köy Ekle</a><br><br>
			 <%end if
			 ers.close %>
		
		<%end if%>	
		<%if ilid>0 and ilceid>0 and koyid>0 then%>
			&nbsp;<a href="?islem=arsivekle&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>" class="buton" style="color:#f8f8f8">Yeni Arþiv Ekle</a>
			<% 
			if islem="ozellistele" then
				bkelime=bcevir(aranan)
				kkelime=kcevir(aranan)
				ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and koykod="&koyid&" and (adsoy like '%"&aranan&"%'"&" or adsoy like '%"&bkelime&"%'"&" or adsoy like '%"&kkelime&"%'"&") order by kayitno desc",emlak,1,3
			else
				ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and koykod="&koyid&" order by kayitno desc",emlak,1,3
			end if	%>
			
			<table width="100%" border="0" cellpadding="2" cellspacing="2">
			
			<tr>
			  <td id="altzemin" colspan="8" align="center">
				<form name="form1" method="post" action="?islem=ozellistele&id=<%= ers("id") %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>">
					&nbsp;&nbsp;<b id="menubg">Ýsme Göre Aramam Yap »</b>&nbsp;
					<input name="aranan" type="text" id="aranan" placeholder="* Aranacak Kelime" value="<%=aranan%>" size="35" required="required" style="width:250px; font-size:13px; border-radius:5px; padding:4px;">&nbsp;
					<input name="aramam" type="submit" id="arama" value="Arama Yap">
				</form></td>
			</tr>
			<%if ers.recordcount>0 then%>
			<tr>
			  <td class="Menu" width="2%" align="center"><span style="font-weight: bold">K.No</span></td>
			  <td class="Menu" width="3%" align="left"><span style="font-weight: bold">Kiþi Adý Soyadý</span></td>
			  <td class="Menu" width="2%" align="left"><span style="font-weight: bold">Ada</span></td>
			  <td class="Menu" width="2%" align="left"><span style="font-weight: bold">Parsel</span></td>
			  <td class="Menu" width="5%" align="left"><span style="font-weight: bold">Proje Adý</span></td>
			  <td class="Menu" width="5%" align="left"><span style="font-weight: bold">Açýklama</span></td>
			  <td class="Menu" width="15%" colspan="2"><div align="center" style="font-weight: bold">Ýþlem</div></td>
			</tr>
			<% 
			ers.pagesize = 25
			ers.absolutepage = shf
			cellcolor="#FFFFFF"
			sayfa = ers.pagecount
			for i=1 to 25
			if ers.eof then exit for%>
			<form name="form1" method="post" action="?islem=guncelle&id=<%= ers("id") %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&shf=<%=shf%>">
				<tr class="tablokenar">
					<td><input name="id" type="text" id="id" value="<%= ers("kayitno") %>" size="3" disabled="disabled" style="padding-left:6px"></td>
					<td><input name="adi" type="text" id="adi" value="<%= ers("adsoy") %>" size="35" required="required"></td>
					<td><input name="ada" type="text" id="ada" value="<%= ers("ada") %>" size="3"></td>
					<td><input name="parsel" type="text" id="parsel" value="<%= ers("parsel") %>" size="3"></td>
					<td>
					<%if ers("adsoy")<>"" then%>
						<input name="projebos" type="text" id="projebos" value="<%= emlakprojebul(ers("proje")) %>" size="40" disabled="disabled">
					<%else%>						
						<select name="proje" id="proje" style="width:260px; font-size:13px; border-radius:5px; padding:4px;">
							<%
							esorgum="Select * from projeler order by projead asc"
							erz.Open esorgum, emlak, 1, 3%>
							<% do while not erz.eof
							if erz.eof then exit do%>
								<option value="<%= erz("recid") %>"><%= erz("projead") %></option>
							<%erz.movenext
							loop
							erz.close %>		
						</select>
					<%end if%>
					</td>
					<td><input name="aciklama" type="text" id="aciklama" value="<%= ers("aciklama") %>" size="25"></td>
					<td align="center">
						  <input name="guncelle" type="submit" id="guncelle" value="Güncelle" <% if session("yetkisi")=7 then %> disabled="disabled"<% end if %>>
					</td>
					<td align="center"> 
						<input name="sil" type="submit" id="sil" value="Sil" onclick="return confirm('Kaydý Tamamen Silmek Ýstediginizden Emin Misiniz?');" <% if session("yetkisi")=6 or session("yetkisi")=7 then %> disabled="disabled"<% end if %>>      
					</td>
				</tr>
			 </form>
			<%ers.movenext
			  next%>
			<tr>
				<td height="40" colspan="8">
				 <%for y=1 to sayfa 
					if cint(shf)=cint(y) then %>
					<strong id="menubg" style="color:#f8f8f8; width:40px"><%= y %></strong>
					<% else %>
					 <a href="?sayfa=emlak arsiv&shf=<%= y %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&islem=<%=islem%>&aranan=<%=aranan%>" class="buton" style="color:#f8f8f8; width:40px"><%= y %></a>	
					<% end if
				next %>
					Kayýt Sayýsý : <b><em><%=ers.recordcount%></em></b>
				</td>
			</tr>  
			<%else%>
				aranan kayýt yok
			
			<%end if%>
			<%  ers.close %>
			</table>
		<%end if%>
<%else%>
	<p align="center">
		<img src="../images/stop.gif" width="64" height="64"><br/><br/>
        Ulaþmaya Çalýþtýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br/><br/>
		<%=siteadi%><br/><br/>
	</p>
<%end if%><br>	<br>