<!--#include file="sifre.asp"-->
<% 
 if Request.Form("referansguncelle")<>"" then
 	 sorgum="select * from referans where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("tarih")=Request.Form("tarih")
		rs("adi")=Request.Form("baslik")
		rs("aciklama")=Request.Form("aciklama")
		rs("detay")=Request.Form("detay")
		rs("kat_id")=Request.Form("album")
		if Request.Form("goster")<>"" then
			rs("goster")=1
		else
			rs("goster")=0
		end if
		rs.update
	Response.Write("<center>Referansi Güncelliyorum</center>")
	Response.Redirect("giris.asp")
 end if
 
 
 
 if id<>"" then
 	sorgum="select * from referans where id="&id&" order by id desc"
 else
 	sorgum="select * from referans order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>

    	<div align="center"><a href="?kanal=ekle">Henüz Referans Kaydý Yapýlmamýþ. Eklemek Ýçin Týklayýn. </a>
    	    <% if kanal="ekle" then
			rs.addnew
			rs("adi")="Yeni Referans"
			rs("goster")=0
			rs("tarih")=date()
			rs.update
			Response.Redirect("giris.asp")
		end if %>
           <% else  %>
    	  
    	  
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then %>	
</div>
<table width="100%" border="0" cellpadding="5" cellspacing="0" >
  <tr>
    <td width="53"><div align="center"><strong>Resim</strong></div></td>
    <td><div align="left" style="font-weight: bold">Referans K&#305;sa &Ouml;zeti</div></td>
    <td><div align="center"><strong>Onay</strong></div></td>
    <td><div align="center"><strong>&#304;&#351;lemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="4"><img src="/tema/images/bg_cizgi.gif" width="100%" height="8"></td>
  </tr>
  <%
  		if rs.eof or rs.bof then

		else
			 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize = 6 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	 				
		   for i=1 to 6
		  
			  if rs.eof then exit for 
				%><tr  
   	onmouseover="this.style.backgroundColor='#FAF3C9';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';">
    <td width="53" align="center">
	<%if rs("resim")<>"" then
	snc = InStr(1,rs("resim"), "http://")%>
	 <a href="<%=rs("resim")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>"><img  onerror="src = '/images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" width="75" height="75" border="0"></a>
	<%else
	Response.Write("Resim Yüklenmemis.")
	end if%>	</td>
  <td width="949" valign="middle">
 
  <strong><%= rs("adi") %></strong><br><%= rs("aciklama") %></td>
  <td width="70">
                 <div align="center">
                   <%if rs("goster")=1 then%> 
                       <img src="images/true.gif"> 
                       <%else%>
                       <img src="images/false.gif">
                       <%end if%>
                     </div></td>
  <td width="100">

<div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div><br />

<div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Dikkat! Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
      <td colspan="4" background="/tema/images/kesik_cizgi.gif" align="center" height="1"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="2">
    <table width="100%" border="0" cellspacing="3" cellpadding="3">
      <tr>
        <td width="35%">Toplam Kayýt :<strong> <%=rs.recordcount %></strong></td>
        <td width="68%" align="center">
						<p class="mc">
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<strong>[<%= y %>]</strong>
							<% else %>
				 			 <a href="?shf=<%= y %>"><%= y %></a>	
							<% end if
					next 
					end if%> </p>			  </td>
      </tr>
    </table>    </td>
    <td colspan="2" align="center"><a href="?kanal=ekle">Yeni Referans Ekle</a></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("adi")="Yeni Referans"

	rs("goster")=0
	rs("tarih")=date()
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" then %>
	<% rs.close
	sorgum="delete * from referans where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%= kanal %>&id=<%= id %>">
  <table width="100%" border="0" cellpadding="3" cellspacing="2">
    <tr>
      <td width="232"><div align="right" style="font-weight: bold">
        <div align="right">Kayýt Tarihi : </div>
      </div></td>
      <td width="138"><label>
		<input  name="tarih" type="text" class="footersmin" id="tarih" value="<%=rs("tarih")%>" size="23" maxlength="25"/>
      </label></td>
      <td width="282">&nbsp;</td>
      <td width="526" colspan="3">&nbsp;</td>
    </tr>
        <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Referans Kategorisi :<br>
          </div>
      </div></td>
      <td><%ukodu=rs("kat_id")%>
	  <select class="footersmin" name="album" id="album">
		<% ru.open "select * from referans_kat order by isim asc",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="<%= ru("id") %>" <% if ukodu=ru("id") then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
		<% ru.movenext
		loop
		ru.close %>
      </select>	  </td>
      <td>&nbsp;</td>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td>
        <div align="right" style="font-weight: bold">Baþlýk :</div>      </td>
      <td colspan="3">
      <label><input name="baslik" type="text" class="footersmin" id="baslik" value="<%= rs("adi") %>" size="80" /></label>      </td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Kýsa Açýklama :<br>
          </div>
      </div></td>
      <td colspan="3"><textarea name="aciklama" cols="95" rows="5" class="footersmin" id="aciklama"><%= rs("aciklama") %></textarea>	  </td>
    </tr>
          <tr><td colspan="4" height="25" background="images/butonsil.png"><div align="center"><strong><font color="#FFFFFF">Habere Ait Resimler</font></strong></div></td></tr>
                     <tr> <td colspan="4"><table width="99%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <td align="center"><%if rs("resim")<>"" then
		  		snc = InStr(1,rs("resim"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" border="0" width="75" height="75"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td>
                   <td align="center"><%if rs("resim2")<>"" then
		  		snc = InStr(1,rs("resim2"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim2")%>" border="0" width="75" height="75"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim2")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td>
          <td align="center"><%if rs("resim3")<>"" then
		  		snc = InStr(1,rs("resim3"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim3")%>" border="0" width="75" height="75"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim3")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td>
              <td align="center"><%if rs("resim4")<>"" then
		  		snc = InStr(1,rs("resim4"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim4")%>" border="0" width="75" height="75"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim4")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td> 
          <td align="center"><%if rs("resim5")<>"" then
		  		snc = InStr(1,rs("resim5"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim5")%>" border="0" width="75" height="75"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim5")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td>
          <td align="center"><%if rs("resim6")<>"" then
		  		snc = InStr(1,rs("resim6"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim6")%>" border="0" width="75" height="75"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim6")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td>
          <td align="center"><%if rs("resim7")<>"" then
		  		snc = InStr(1,rs("resim7"), "http://")
		  	%>
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim7")%>" border="0" width="75" height="75" /><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim7")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75" />
              <%end if%></td>
          <td align="center"><%if rs("resim8")<>"" then
		  		snc = InStr(1,rs("resim8"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim8")%>" border="0" width="75" height="75"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim8")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td>                                                                                
        </tr>
        <tr>
          <td align="center"><input name="Button" type="button" onClick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&yer=resim','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" onClick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&yer=resim2','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" onClick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&yer=resim3','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" onClick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&yer=resim4','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" onClick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&yer=resim5','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" onClick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&yer=resim6','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" onclick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&amp;yer=resim7','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" onClick="yenipencere('/Editor/assetmanager/referans_resim.asp?id=<%= rs("id")%>&yer=resim8','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>                    
        </tr>
      </table></td>
    </tr>  
                    <tr><td colspan="4" height="25" background="images/butonsil.png"><div align="center"><strong><font color="#FFFFFF">Referans Detayý</font></strong></div></td></tr>
		  <tr valign="top">
            <td colspan="4">
            <textarea id="office2003" name="editor1" rows="50" cols="80"><%= rs("detay") %></textarea>
			<script type="text/javascript">
			if ( typeof CKEDITOR == 'undefined' )
			{
				document.write('Ýçerik Boþ...' ) ;
			}
			else
			{
				var editor = CKEDITOR.replace( 'editor1' );
				CKFinder.setupCKEditor( editor, 'ckfinder/' ) ;
			}
			</script> 
                      </td>
	      </tr>	
    <tr>
      <td height="34"><div align="right" style="font-weight: bold">
          <div align="right">Referansý Göster : </div>
      </div></td>
      <td><label>
        <input name="goster" type="checkbox" id="goster" value="checkbox" <% if rs("goster")=1 then %> checked="checked" <% end if %> />
      </label></td>
      <td colspan="2" align="left" valign="top"><a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');"><img src="images/sil.jpg" border="0"></a>
              <input name="referansguncelle" type="submit" id="referansguncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"/>
      <INPUT TYPE="button" VALUE="  Geri Dön  " onClick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"></td>
    </tr>
  </table>
</form>
<% end if %>
<% end if %>