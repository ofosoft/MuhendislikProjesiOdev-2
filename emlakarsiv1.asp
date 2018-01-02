	<script type="text/javascript">
		function MM_jumpMenu(targ,selObj,restore){ //ofosoft
			eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
			if (restore) selObj.selectedIndex=0;
		}	
	</script>
<%
	ilid=request("ilid")
	ilceid=request("ilceid")	
	if request("koyid")<>"" then
		koyid=request("koyid")
	else
		koyid=0
	end if
	if request("projeid")<>"" then
		projeid=request("projeid")
	else
		projeid=0
	end if	
	shf = Request.QueryString("shf")
	aranan=request("aranan")
	arananada=request("arananada")
	arananparsel=request("arananparsel")
	aramasira=request("sirala")
	if shf="" then shf=1 end if
%>	
	<div class="blokkenar">
		<div class="menubaslik">Emlak Arþiv Kayýtlarý</div>
		<center class="menubaslik2">
			<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:140px; font-size:13px; border-radius:5px; padding:4px;">
				<option value="?kanal=goster&ilid=0&ilceid=0&koyid=0&projeid=0">Önce Ýl Seçiniz.</option>
				<% ers.open "select * from iller where onay=1 order by iladi asc",emlak,1,3 %>
				<% do while not ers.eof
				if ers.eof then exit do%>
					<option value="?kanal=goster&ilid=<%= ers("ilkodu") %>&ilceid=0&koyid=0" <% if ers("ilkodu")=cint(ilid) then  %> selected="selected" <% end if %>><%= ers("iladi") %></option>
				<%ers.movenext
				  loop
				  ers.close %>
			</select>
			<%if ilid>0 then%>&nbsp;
			<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:140px; font-size:13px; border-radius:5px; padding:4px;">
					<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=0&koyid=0&projeid=0">Önce Ýlçe Seçiniz.</option>
				<% ers.open "select * from ilceler where ilkodu="&ilid&" order by ilceadi asc",emlak,1,3 %>
				<% do while not ers.eof
				if ers.eof then exit do%>
					<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%= ers("ilcekodu") %>&koyid=0" <% if ers("ilcekodu")=cint(ilceid) then  %> selected="selected" <% end if %>><%= ers("ilceadi") %></option>
				<%ers.movenext
				  loop
				  ers.close%>
			</select>
			<%end if%>
			<%if ilceid>0 then%>&nbsp;
			<% ers.open "select * from koyler where ilkodu="&ilid&" and ilcekodu="&ilceid&" order by koyadi asc",emlak,1,3 
				if ers.recordcount>0 then%>
					<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:220px; font-size:13px; border-radius:5px; padding:4px;">
						<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%= ilceid %>&koyid=0&projeid=<%=projeid %>">Köy Seçiniz.</option>
							<% do while not ers.eof
							if ers.eof then exit do%>
								<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%=ilceid %>&projeid=<%=projeid %>&koyid=<%= ers("koykodu") %>" <% if ers("koykodu")=cint(koyid) then  %> selected="selected" <% end if %>><%= ers("koyadi") %></option>
							<%ers.movenext
							  loop%>
						</select>	 
					<%else%>				
				 <%end if
				 ers.close %>&nbsp;
			<% ers.open "select * from projeler order by projead asc",emlak,1,3 
				if ers.recordcount>0 then%>
					<select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:200px; font-size:13px; border-radius:5px; padding:4px;">
						<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%= ilceid %>&koyid=<%=koyid%>&projeid=0">Proje Seçiniz.</option>
							<% do while not ers.eof
							if ers.eof then exit do%>
								<option value="?kanal=goster&ilid=<%= ilid %>&ilceid=<%=ilceid %>&koyid=<%= koyid %>&projeid=<%=ers("recid")%>" <% if ers("recid")=cint(projeid) then  %> selected="selected" <% end if %>><%= ers("projead") %></option>
							<%ers.movenext
							  loop%>
						</select>	 
					<%else%>				
				 <%end if
				 ers.close %>	 
			<%end if%>
		</center>
		<%if ilid>0 and ilceid>0 then%>
			
			<% 
			if islem="ozellistele" and ( aranan<>"" or arananada<>"" or arananparsel<>"" or aramasira<>"") then
				bkelime=bcevir(aranan)
				kkelime=kcevir(aranan)
				if arananada<>"" then
					ada="and ada="&arananada&""
				else
					ada=""
				end if	
				if arananparsel<>"" then
					parsel="and parsel="&arananparsel&""
				else
					parsel=""
				end if
				if koyid>0 and projeid>0 then
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and proje="&projeid&" and koykod="&koyid&" "&ada&" "&parsel&" and (adsoy like '%"&aranan&"%'"&" or adsoy like '%"&bkelime&"%'"&" or adsoy like '%"&kkelime&"%'"&") order by "&aramasira&"",emlak,1,3
				elseif koyid>0 then	
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and koykod="&koyid&" "&ada&" "&parsel&" and (adsoy like '%"&aranan&"%'"&" or adsoy like '%"&bkelime&"%'"&" or adsoy like '%"&kkelime&"%'"&") order by "&aramasira&"",emlak,1,3
				elseif projeid>0 then
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and proje="&projeid&" "&ada&" "&parsel&" and (adsoy like '%"&aranan&"%'"&" or adsoy like '%"&bkelime&"%'"&" or adsoy like '%"&kkelime&"%'"&") order by "&aramasira&"",emlak,1,3
				else
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" "&ada&" "&parsel&" and (adsoy like '%"&aranan&"%'"&" or adsoy like '%"&bkelime&"%'"&" or adsoy like '%"&kkelime&"%'"&") order by "&aramasira&"",emlak,1,3
				end if
			else
				if koyid>0 and projeid>0 then
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and koykod="&koyid&" and proje="&projeid&" order by kayitno desc",emlak,1,3
				elseif koyid>0 then
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and koykod="&koyid&" order by kayitno desc",emlak,1,3
				elseif projeid>0 then
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" and proje="&projeid&" order by kayitno desc",emlak,1,3
				else
					ers.open "select * from arsiv where ilkod="&ilid&" and ilcekod="&ilceid&" order by kayitno desc",emlak,1,3
				end if
			end if	
			ks=ers.recordcount%>
			<table width="100%" border="0" cellpadding="2" cellspacing="2">
			<tr>
			  <td id="altzemin" colspan="8" align="center" style="padding-bottom:12px; padding-top:10px">
					<form name="form1" method="post" action="?islem=ozellistele&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&projeid=<%=projeid%>">
						<input name="aranan" type="text" id="aranan" placeholder="* Aranacak Kiþi Adý veya Soyadý" value="<%=aranan%>" size="35" style="width:200px; font-size:13px; border-radius:5px; padding:4px;">&nbsp;
						<input name="arananada" type="text" id="arananada" placeholder="Aranan Ada No" value="<%=arananada%>" size="35" style="width:100px; font-size:13px; border-radius:5px; padding:4px;">&nbsp;
						<input name="arananparsel" type="text" id="arananparsel" placeholder="Aranan Parsel No" value="<%=arananparsel%>" size="35" style="width:110px; font-size:13px; border-radius:5px; padding:4px;">&nbsp;
						<select name="sirala" id="sirala" style="width:200px; font-size:13px; border-radius:5px; padding:4px;">
							<option value="kayitno desc" <%if aramasira="kayitno desc" then%> selected="selected" <% end if %>>Kayýt No Sondan Baþa</option>
							<option value="kayitno asc" <%if aramasira="kayitno asc" then%> selected="selected" <% end if %>>Kayýt No Baþtan Sona</option>
							<option value="ada desc" <%if aramasira="ada desc" then%> selected="selected" <% end if %>>Ada No Sondan Baþa</option>
							<option value="ada asc" <%if aramasira="ada asc" then%> selected="selected" <% end if %>>Ada No Baþtan Sona</option>
							<option value="parsel desc" <%if aramasira="parsel desc" then%> selected="selected" <% end if %>>Parsel No Sondan Baþa</option>
							<option value="parsel asc" <%if aramasira="parsel asc" then%> selected="selected" <% end if %>>Parsel No Baþtan Sona</option>
							<option value="adsoy desc" <%if aramasira="adsoy desc" then%> selected="selected" <% end if %>>Ýsim Sondan Baþa</option>
							<option value="adsoy asc" <%if aramasira="adsoy asc" then%> selected="selected" <% end if %>>Ýsim Baþtan Sona</option>
						</select>
						<input name="aramam" type="submit" id="arama" value="Listele">
					</form>
				</td>
			</tr>
			<%if ers.recordcount>0 then%>
			<tr class="yesilbaslik">
				<td width="10%" align="center"><span style="font-weight: bold">Bilgi</span></td>
				<td width="10%" align="center" height="30"><span style="font-weight: bold">K.No</span></td>
				<td width="30%" align="left"><span style="font-weight: bold">Kiþi Adý Soyadý</span></td>
				<td width="5%" align="center"><span style="font-weight: bold">Ada</span></td>
				<td width="10%" align="center"><span style="font-weight: bold">Parsel</span></td>
				<td width="35%" align="left"><span style="font-weight: bold">Proje Adý</span></td>
			</tr>
			<% 
			ers.pagesize = 25
			ers.absolutepage = shf
			cellcolor="#FFFFFF"
			sayfa = ers.pagecount
			for i=1 to 25
			if ers.eof then exit for
			if ers("kayitno")<>0 then%>
				<tr <%if zemin=1 then 
						zemin=0%>class="tablozemin1"<%else 
							zemin=1%>class="tablozemin"<%end if%>>
					<td align="center"><a class="tooltips" href="#"><img src="ofosoft_img/info.png" height="20">
						<span style="text-align:left; padding:5px">
							<b style="font-size:20px">Kayýt No : <%= ers("kayitno")%></b><hr>
							Kiþi Adý Soyadý : <b><%= ers("adsoy")%></b><hr>
							Ada No : <b><%= ers("ada")%></b><hr>
							Parsel No : <b><%= ers("parsel")%></b><hr>
							Proje Adý : <b><%= emlakprojebul(ers("proje"))%></b><hr>
							Açýklama : <b><%= ers("aciklama")%></b>
						
						</span></a>
					</td>
					<td align="center"><%= ers("kayitno")%></td>
					<td><%= ers("adsoy")%></td>
					<td align="center"><%= ers("ada")%></td>
					<td align="center"><%= ers("parsel")%></td>
					<td><a title="<%= emlakprojebul(ers("proje"))%>"><%= left(emlakprojebul(ers("proje")),35)%>...</a></td>

				</tr>
			<%end if
			ers.movenext
			  next%>
				
			<tr>
				<td colspan="8" align="center"><hr>
					<%if ks>25 then%>  
						<% onceki=shf-1%>
							<%if shf=1 then%><a class="menubaslik2" style="color:#f8f8f8;" href="javascript:onClick=alert('Ýlk Sayfadasýnýz!')">««</a><%else%>
							 <a class="menubaslik2" style="color:#f8f8f8;" href="?shf=1&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&projeid=<%=projeid%>&islem=<%=islem%>&aranan=<%=aranan%>&sirala=<%=aramasira%>&arananada=<%=arananada%>&arananparsel=<%=arananparsel%>" title="Ýlk Sayfa">««</a>
							 <%end if%>
							 <%if onceki<1 then%>
								<a class="menubaslik2" style="color:#f8f8f8;" href="javascript:onClick=alert('Ýlk Sayfadasýnýz!')">«</a>
							 <%else%>
								<a class="menubaslik2" style="color:#f8f8f8;" href="?shf=<%=onceki %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&projeid=<%=projeid%>&islem=<%=islem%>&aranan=<%=aranan%>&sirala=<%=aramasira%>&arananada=<%=arananada%>&arananparsel=<%=arananparsel%>" title="Önceki Sayfa">«</a>
							 <%end if%>...
							 <% y=3
							 do while y>0
							  sayfas=shf-y
								if sayfas>0 then%>
									 <a class="menubaslik2" style="color:#f8f8f8;" href="?shf=<%= sayfas %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&projeid=<%=projeid%>&islem=<%=islem%>&aranan=<%=aranan%>&sirala=<%=aramasira%>&arananada=<%=arananada%>&arananparsel=<%=arananparsel%>" title="<%=sayfas%>. Sayfa"><%=sayfas%></a>
								<%end if
								y=y-1
							loop%>
							<span class="menubaslik"><%=shf%></span>
							<%sayfas=0
							for y=1 to 3
							  sayfas=shf+y
								if sayfas<sayfa then%>
									 <a class="menubaslik2" style="color:#f8f8f8;" href="?shf=<%= sayfas %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&projeid=<%=projeid%>&islem=<%=islem%>&aranan=<%=aranan%>&sirala=<%=aramasira%>&arananada=<%=arananada%>&arananparsel=<%=arananparsel%>" title="<%=sayfas%>. Sayfa"><%=sayfas%></a>
								<%end if
							next%>...    
							<%sonraki=shf+1
							if sonraki>sayfa then
							%>
							<a class="menubaslik2" style="color:#f8f8f8;" href="javascript:onClick=alert('Son Sayfadasýnýz!')">»</a>
							<%else%>
							   <a class="menubaslik2" style="color:#f8f8f8;" href="?shf=<%= sonraki %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&projeid=<%=projeid%>&islem=<%=islem%>&aranan=<%=aranan%>&sirala=<%=aramasira%>&arananada=<%=arananada%>&arananparsel=<%=arananparsel%>" title="Sonraki Sayfa">»</a>
							   <%end if%>
							   <%if cint(shf)=cint(sayfa) then%>
								<a class="menubaslik2" style="color:#f8f8f8;" href="javascript:onClick=alert('Son Sayfadasýnýz!')">»»</a>
								<%else%>
							   <a class="menubaslik2" style="color:#f8f8f8;" href="?shf=<%= sayfa %>&ilid=<%= ilid %>&ilceid=<%=ilceid%>&koyid=<%=koyid%>&projeid=<%=projeid%>&islem=<%=islem%>&aranan=<%=aranan%>&sirala=<%=aramasira%>&arananada=<%=arananada%>&arananparsel=<%=arananparsel%>" title="Son Sayfa">»»</a>
							   <%end if%>
							<hr>
						<%end if%>
						<b>Listelenen Kayýt Sayýsý :<em> <%=ks%></em></b>		
					</td>
				</tr> 
			<%else%>
			<tr>
				<td height="40" colspan="8" align="center">
				<img src="yonet/images/kayityok.jpg">
			</td></tr>
			
			<%end if%>
			<%  ers.close %>
			</table>
		<%end if%>
		<br>
	</div>