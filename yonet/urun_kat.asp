<!--#include file="sifre.asp"-->
<%  
 if Request.Form("album_guncelle")<>"" then
 	 sorgum="select * from urun_kat where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("isim")=Request.Form("baslik"):	rs("sira")=Request.Form("sira")
		'rs("aciklama")=Request.Form("aciklama")
		if Request.Form("goster")<>"" then
			rs("goster")=1
		else
			rs("goster")=0
		end if
		rs.update
	Response.Write("<center>Kategoriyi Güncelliyorum.</center>")
	Response.Redirect("giris.asp")
 end if
 
 
 
 if id<>"" then
 	sorgum="select * from urun_kat where id="&id&" order by sira asc"
 Rs.Open Sorgum, Baglantim, 1, 3  
else
 	sorgum="select * from urun_kat order by sira asc"
 Rs.Open Sorgum, Baglantim, 1, 3 	
session("kli")=rs.recordcount
 end if

 if rs.eof or rs.bof then%>
<br />
    	<div align="center"><a href="?kanal=ekle">Kategori Bulunamadi. Eklemek Için Týklayýn. </a><br />
    	    <% if kanal="ekle" then
			rs.addnew
			rs("isim")="Yeni Kategori"
			rs("goster")=0
			rs.update
			Response.Redirect("giris.asp")
		end if %>
           <% else  %>
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then %>	
  
</div>
<table width="100%" border="0" cellpadding="3" cellspacing="3" >
  <tr>
    <td width="101"><div align="center"><strong>Resmi</strong></div></td>
    <td width="255"><div align="left"><strong>Adý</strong></div></td>
    <td><div align="left" style="font-weight: bold">Markalar</div></td>
    <td><div align="left" style="font-weight: bold">
      <div align="center">Onay</div>
    </div></td>
    <td colspan="2"><div align="center"><strong>Ýþlemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="6"><img src="../tema/images/bg_cizgi.gif" width="100%" height="11"></td>
  </tr>
  <%
  		if rs.eof or rs.bof then

		else
			 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize = 8 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	 				
		   for i=1 to 8
		  
			  if rs.eof then exit for 
				%>
    <tr onmouseover="this.style.backgroundColor='#FFFFD5';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td width="101" align="center"><%if rs("resim")<>"" then
	snc = InStr(1,rs("resim"), "http://")%>
	 <img  onerror="src = '/images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" width="75" height="75" border="0">
	<%else
	Response.Write("Kategori Resmi Yüklenmemiþ.")
	end if%></td>
    <td width="255" align="center" valign="top"><div align="left"><strong><%=rs("isim")%></strong></div></td>
    <td width="519" valign="top">
   <%= rs("detay") %></td>
  <td width="138" valign="middle"><div align="center">
  <img src="/images/<%if rs("goster")=1 then%>true<%else%>false<%end if%>.gif" border="0">
  </div></td>
  <td width="70"><div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div></td>
    <td width="74"><div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>"onclick="return confirm('Dikkat! Albüm Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
    <td colspan="6" height="1" align="center" background="../tema/images/kesik_cizgi.gif"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="4">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30%">Toplam<strong> <%=rs.recordcount %> </strong>Adet Kategori Bulunmaktadir. </td>
<td width="70%" align="center">
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
    <td colspan="2" align="center"><a href="?kanal=ekle">Yeni Kategori Ekle</a></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("isim")="Yeni Kategori"
	rs("goster")=0
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" then %>
<% rs.close
	sorgum="delete * from urun_kat where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%=kanal%>&id=<%= id %>">
  <table width="90%" border="0" align="center" cellpadding="5">
      <tr>
      <td width="189">
        <div align="right" style="font-weight: bold">Adý :</div>      </td>
      <td width="376">
      <label><input name="baslik" type="text" class="footersmin" id="baslik" value="<%= rs("isim") %>" size="60" /></label>      <label></label></td>
      <td width="377" rowspan="3" valign="top"><div align="center">
      <%if rs("resim")<>"" then
		  		snc = InStr(1,rs("resim"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" border="0" width="75" height="75">
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></div>
        <div align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_katresim.asp?id=<%= rs("id")%>&yer=resim','','resizable=yes,status=yes,width=800,height=550')" value="Resim Yükle" /></div></td>
    </tr> 
     <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Markalar :<br><br><br>
		<strong>Kategori Markalarýnýn Detayýný Girdikten Sonra Sol Üst Köþede <span style="font-style: italic; color: #FF0000">Disket (Kaydet)</span> &#304;konuna Bas&#305;n&#305;z...</strong>
            </div>
      </div></td>
      <td>
	  <iframe src="../Editor/code/editor.asp?tablo=urun_kat&amp;id=<%= rs("id") %>&amp;adi=<%= rs("id") %>" width="700" height="510" frameborder="0"></iframe>
</td>
    </tr>        
     <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Liste Sýrasý :<br>
            </div>
      </div></td>
      <td><select class="footersmin" name="sira" id="sira" class="footersmin" >
        <%kli=session("kli")
		for li=1 to kli%>
        <option value="<%=li%>" <%if rs("sira")=li then%> selected="selected"<%end if%>><%=li%>. Sýra</option>
		<%next%>
      </select></td>
    </tr> 
    <tr>
      <td height="34"><div align="right" style="font-weight: bold">
          <div align="right">Kategoriyi Göster : </div>
      </div></td>
      <td colspan="2"><label>
        <input name="goster" type="checkbox" id="goster" value="checkbox" <% if rs("goster")=1 then %> checked="checked" <% end if %> />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Dikkat! Kategori Tamamen Silinecektir.')"><img src="images/sil.jpg" border="0" /></a>&nbsp;&nbsp;
        <input name="album_guncelle" type="submit" id="album_guncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"/>&nbsp;&nbsp;
        <input type="button" value="  Geri Dön  " onclick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
      </label></td>
    </tr>
  </table>
</form>
<% end if %>
<% end if %>