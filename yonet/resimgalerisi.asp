<!--#include file="sifre.asp"-->
<!--#include file="slaytust.asp"-->
	<% 
 if Request.Form("resim_guncelle")<>"" then
 	 sorgum="select * from galeri where id="&request.QueryString("id")
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("tarih")=Request.Form("tarih")
		rs("isim")=Request.Form("baslik")
		rs("aciklama")=Request.Form("aciklama")
		rs("kat_id")=Request.Form("album")
		if Request.Form("onay")<>"" then
			rs("onay")=1
		else
			rs("onay")=0
		end if
		if Request.Form("anasayfa")<>"" then
			snc1 = InStr(1,rs("url"), "http://")
		  	if snc1=0 then
			 rs("goster")=1
			else
			 rs("goster")=0
			end if
		else
			rs("goster")=0
		end if
		rs.update
	Response.Write("<center>Resmi Güncelliyorum.</center>")
	Response.Redirect("giris.asp")
 end if
 
 
 
 if id<>"" then
 	sorgum="select * from galeri where id="&id&" order by id desc"
 else
 	sorgum="select * from galeri order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>
	<div align="center"><br />
    	<a href="?kanal=ekle">Henüz Resim Eklenmemiþtir. Eklemek için Týklayýnýz. </a><br />
    	<br />
    	    <% if kanal="ekle" then
			rs.addnew
			rs("isim")="Yeni Resim"
			rs("onay")=0
			rs("tarih")=now()
			rs.update
			Response.Redirect("giris.asp")
		end if %>
           <% else  %>
    	  
    	  
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then %>	
</div>
<table width="100%" border="0" cellpadding="5" cellspacing="0" >
  <tr>
    <td width="119"><div align="center"><strong>K&uuml;&ccedil;&uuml;k Resim </strong></div></td>
    <td><div align="left" style="font-weight: bold">Resim Ad&#305; </div></td>
    <td><div align="center"><strong>Onay</strong></div></td>
    <td><div align="center"><strong>Ana Sayfa</strong></div></td>
    <td><div align="center"><strong>&#304;&#351;lemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="5" background="images/kesik_cizgi.gif" align="center" height="1"></td>
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
    <td width="119" align="center">
	<%if rs("url")<>"" then
		  		snc = InStr(1,rs("url"), "http://")
		  	%>
  <a href="<%if snc=0 then%>../<%end if%><%=rs("url")%>" rel='slayt[1]' title="<%= rs("isim")%>">
<img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("url")%>" border="0" width="75" height="75"></a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
          <%end if%><br>
<input name="Button" type="button" class="yuklebuton" onClick="yenipencere('/ofosoft_editor/resimyukle.asp?id=<%= rs("id")%>&yer=url&klasor=galeri','','resizable=yes,status=yes,width=800,height=600')" value="Resim Y&uuml;kle">		  </td>
  <td width="700" valign="top">
 
  <strong><%= rs("isim") %></strong> [ <%= rs("tarih") %> ] <br>
  <%= rs("aciklama") %></td>
<td width="77">
                 <div align="center">
                   <%if rs("onay")=1 then%> 
                       <img src="images/true.gif"> 
                       <%else%>
                       <img src="images/false.gif">
                       <%end if%>
      </div></td>
  <td width="99"><div align="center">
    <%if rs("goster")=1 then%>
    <img src="images/true.gif">
    <%else%>
    <img src="images/false.gif">
    <%end if%>
  </div></td>
  <td width="169">

<div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0"></a></div><br />

<div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Dikkat! Resim Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0"></a></div></td>
  </tr>
  <tr>
      <td colspan="5" background="images/kesik_cizgi.gif" align="center" height="1"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="2">
    <table width="100%" border="0" cellspacing="3" cellpadding="3">
      <tr>
        <td width="28%">Toplam Resim : <strong><%=rs.recordcount %></strong></td>
        <td width="72%" align="center">
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
    <td colspan="3" align="center"><a href="?kanal=ekle">Yeni Resim Ekle</a></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("isim")="Yeni Resim"
	rs("onay")=0
	rs("tarih")=now()
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" or Request.Form("sil")<>"" then%>
	<% rs.close
	sorgum="delete * from galeri where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%= kanal %>&id=<%= id %>">
  <table width="100%" border="0" cellpadding="3" cellspacing="2">
    <tr>
      <td width="297"><div align="right" style="font-weight: bold">
        <div align="right">Kayit Tarihi : </div>
      </div></td>
      <td width="212"><label>
		<input  name="tarih" type="text" class="footersmin" id="tarih" value="<%=rs("tarih")%>" size="23" maxlength="25"/>
      </label></td>
      <td width="81">&nbsp;</td>
      <td width="590" colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td>
        <div align="right" style="font-weight: bold">Resim Adý  :</div>      </td>
      <td colspan="3">
      <label><input name="baslik" type="text" class="footersmin" id="baslik" value="<%= rs("isim") %>" size="90" /></label>      </td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Kýsa Açýklama :<br>
          </div>
      </div></td>
      <td colspan="3"><textarea name="aciklama" cols="89" rows="5" class="footersmin" id="aciklama"><%= rs("aciklama") %></textarea>	  </td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Eklenecek Albüm :<br>
          </div>
      </div></td>
      <td><%akodu=rs("kat_id")%>
	  <select class="footersmin" name="album" id="album">
		<% ru.open "select * from galeri_kat",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="<%= ru("id") %>" <% if akodu=ru("id") then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
		<% ru.movenext
		loop
		ru.close %>
      </select>	  </td>
      <td colspan="2"><span style="font-weight: bold">Resmi Göster :</span> 
        <input name="onay" type="checkbox" id="goster" value="checkbox" <% if rs("onay")=1 then %> checked="checked" <% end if %> />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-weight: bold">Ana Sayfada Göster  : </span>
        <input name="anasayfa" type="checkbox" id="onay" value="checkbox" <% if rs("goster")=1 then %> checked="checked" <% end if %> /></td>
    </tr>	
 <tr>
      <td height="34"><div align="right" style="font-weight: bold">
        <div align="right">Resimler :<br />
        </div>
      </div></td>
      <td height="34"><table width="86%" border="0" align="left" cellpadding="2" cellspacing="2">
          <tr>
            <td width="50%" align="center"><%if rs("url")<>"" then
		  		snc = InStr(1,rs("url"), "http://")
		  	%><a href="<%if snc=0 then%>../<%end if%><%=rs("url")%>" rel='slayt[1]' title="<%= rs("isim")%>">
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("url")%>" border="0" width="75" height="75" /><br />
              [ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
              <%end if%></td>
          </tr>
		  
          <tr>
            <td align="center">
             <input name="Button" type="button" class="yuklebuton" onClick="yenipencere('/ofosoft_editor/resimyukle.asp?id=<%= rs("id")%>&yer=url&klasor=galeri','','resizable=yes,status=yes,width=800,height=600')" value="Bilgisayardan Y&uuml;kle">            </td>
          </tr>
      </table></td>
      <td height="34"><input name="Sil" onclick="return confirm('Dikkat! Resim Tamamen Silinecektir.')" type="submit"  id="Sil" value="Sil" size="40" class="butonsil" />
        <p>
          <input name="resim_guncelle" type="submit" id="resim_guncelle" value="G&uuml;ncelle" class="butonguncelle" />
        </p>
        <p>
          <input name="button" type="button" class="butongeri" onclick="history.go(-1)" value="  Geri D&ouml;n  " />
        </p></td>
      <td height="34"><p align="left"><strong>ÖNEMLÝ NOT :</strong><br />
      Bir resmi<strong> &quot;Ana Sayfada Göster&quot;</strong> olarak seçmek istiyorsanýz resmin <br />
          <strong>Geniþliði = 530px<br />
          Yüksekliði = 330px </strong>olmasýna dikkat ediniz.<br />
      Ayrýca bilgisayarýnýza yüklemeden link verecek yayýnladýðýnýz resimleri <strong>Ana Sayfada Göster </strong>olarak seçmeyiniz. Sistem hata verir.</p></td>
 </tr>
 <tr><td colspan="6" height="25" background="images/butonsil.png"><div align="center"><strong><font color="#FFFFFF">Baþlýða Ait Diðer Resimler</font></strong></div></td></tr>
                     <tr> <td colspan="6">
					 <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
              <tr>
			  <%j=0
			  for i=1 to 30
			  'if i=1 then 
			  '   ss=""
			   ' else
			     ss=i
			 ' end if
			 %>
                <td align="center" width="10%">
				<%if rs("resim"&ss&"")<>"" then
				  snc = InStr(1,rs("resim"&ss&""), "http://")%>
                 <img  onerror="src = '/ofosoft_img/resimyok.jpg'" src="<%if snc=0 then%>../<%end if%><%=rs("resim"&ss&"")%>" border="0" width="75" height="75" /><br />
                 <a href="<%if snc=0 then%>../<%end if%><%=rs("resim"&ss&"")%>" target="_blank">[ Resmi Büyüt ]</a>
                 <%else%>
                  <img src="../images/resimyok.gif" border="0" width="75" height="75" />
                <%end if%><br>
				<input name="Button3" type="button" onClick="yenipencere('/ofosoft_editor/resimyukle.asp?id=<%= rs("id")%>&yer=resim<%=ss%>&klasor=galeri','','resizable=yes,status=yes,width=800,height=600')" value="Resim Yükle" />
				</td>
				<%j=j+1
					if j=10 then 
					response.write("</tr><tr>")
					j=0
				  end if	
				  
				 next
				%>	
              </tr>
            </table></td>
          </tr>
  </table>
</form>
        
<% end if %>
<% end if %>