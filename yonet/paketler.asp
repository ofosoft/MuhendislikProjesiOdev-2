<!--#include file="sifre.asp"-->
<!--#include file="slaytust.asp"-->
<% 
 if Request.Form("paket_guncelle")<>"" then
 	 sorgum="select * from paket where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("tarih")=Request.Form("tarih")
		rs("adi")=Request.Form("baslik")
		rs("aciklama")=Request.Form("aciklama")
		rs("konum")=Request.Form("konum")
		rs("kat_id")=Request.Form("album")		
		rs("baslama")=Request.Form("baslama")
		rs("bitis")=Request.Form("bitis")
		rs("detay")=Request.Form("editor1")
		rs("teknikbilgi")=Request.Form("editor2")
		if Request.Form("goster")<>"" then
			rs("goster")=1
		else
			rs("goster")=0
		end if
		if Request.Form("satis")<>"" then
			rs("satis")=1
		else
			rs("satis")=0
		end if
		rs.update
	Response.Write("<center>Paketi G�ncelliyorum</center>")
	Response.Redirect("giris.asp")
 end if
 
 
 
 if id<>"" then
 	sorgum="select * from paket where id="&id&" order by id desc"
 else
 	sorgum="select * from paket order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>

    	<div align="center"><a href="?kanal=ekle">Proje Bulunmamaktad�r. Eklemek I�in Tiklayin. </a>
    	    <% if kanal="ekle" then
			rs.addnew
			rs("adi")="Yeni Proje"
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
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    <td colspan="2"><div align="center"><strong><a href="?kanal=ekle"><img src="images/yenikayit.gif" width="153" height="34" border="0" /></a></strong></div></td>
  </tr>
  <tr>
    <td><div align="center"><strong>Resim</strong></div></td>
    <td width="737"><div align="left" style="font-weight: bold">Proje K&#305;sa &Ouml;zeti</div></td>
    <td width="83"><div align="center"><strong>Sat��</strong></div></td>
    <td><div align="center"><strong>Onay</strong></div></td>
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
    <td width="116" align="center">
	<%if rs("resim")<>"" then
	snc = InStr(1,rs("resim"), "http://")%>
	 <a href="<%=rs("resim")%>" target="_blank" rel='slayt[1]' title="<%= rs("adi")%>"><img  onerror="src = '/images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" width="75" height="75" border="0"></a>
	<%else
	Response.Write("Resim Y�klenmemi�.")
	end if%>	</td>
  <td valign="middle">
 
  <strong><%= rs("adi") %></strong><br>
  <%= rs("aciklama") %></td>
  <td valign="middle"><div align="center">
    <%if rs("satis")=1 then%>
    <img src="images/true.gif" />
    <%else%>
    <img src="images/false.gif" />
    <%end if%>
  </div></td>
  <td width="69">
                 <div align="center">
                   <%if rs("goster")=1 then%> 
                       <img src="images/true.gif"> 
                       <%else%>
                       <img src="images/false.gif">
 <%end if%>
                     </div></td>
  <td width="159">

<div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0"></a></div><br />

<div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Dikkat! Paket Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0"></a></div></td>
  </tr>  <tr>
      <td colspan="5" background="images/kesik_cizgi.gif" align="center" height="1"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="3">
    <table width="100%" border="0" cellspacing="3" cellpadding="3">
      <tr>
        <td width="28%">Toplam<strong> <%=rs.recordcount %> </strong>Adet Kay�t Bulundu.</td>
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
    <td colspan="2" align="center"><a href="?kanal=ekle">Yeni Proje Ekle</a></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("adi")="Yeni Proje"
	rs("goster")=0
	rs("tarih")=date()
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" then %>
	<% rs.close
	sorgum="delete * from paket where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%= kanal %>&id=<%= id %>">
  <table width="100%" border="0" cellpadding="3" cellspacing="2">
    <tr>
      <td width="256"><div align="right" style="font-weight: bold">
        <div align="right">Sitede G�ster : </div>
      </div></td>
      <td width="238"><label><input name="goster" type="checkbox" id="goster" value="checkbox" <% if rs("goster")=1 then %> checked="checked" <% end if %> /></label></td>
      <td width="202">&nbsp;</td>
      <td colspan="4"><a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');"><img src="images/sil.jpg" border="0" /></a></td>
    </tr>
    <tr>
      <td>
        <div align="right" style="font-weight: bold">Proje  Ad� :</div>      </td>
      <td colspan="2">
      <label><input name="baslik" type="text" class="footersmin" id="baslik" value="<%= rs("adi") %>" size="60" /></label>      </td>
      <td colspan="4"><input name="paket_guncelle" type="submit" id="paket_guncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"/></td>
    </tr>
        <tr>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Proje Kategorisi :<br>
          </div>
      </div></td>
      <td><%ukodu=rs("kat_id")%>
	  <select class="footersmin" name="album" id="album">
		<% ru.open "select * from paket_kat",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="<%= ru("id") %>" <% if ukodu=ru("id") then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
		<% ru.movenext
		loop
		ru.close %>
      </select>	  </td>
      <td>&nbsp;</td>
      <td colspan="2"><input type="button" value="  Geri D�n  " onclick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" /></td>
    </tr>
        <tr>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Ba�lama Tarihi : </div>
      </div></td>
      <td><input  name="baslama" type="text" class="footersmin" id="baslama" value="<%=rs("baslama")%>" size="18" maxlength="25"/></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Biti� Tarihi : </div>
      </div></td>
      <td width="463"><input  name="bitis" type="text" class="footersmin" id="bitis" value="<%=rs("bitis")%>" size="18" maxlength="25"/></td>
      <td width="13"></td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Projenin Amac&#305; :<br>
          </div>
      </div></td>
      <td colspan="4"><textarea name="aciklama" cols="120" rows="6" class="footersmin" id="aciklama"><%= rs("aciklama") %></textarea>	  </td>
    </tr>
    <tr>
     <td height="25" colspan="5" background="images/butonguncelle.png" style="border-radius:10px"><div align="center"><strong><font color="#FFFFFF">Projenin Kroki Kodu (http://maps.google.com dan Al�nabilir)</font></div></td>
     </tr>
     <tr>
      <td align="center" colspan="5"><textarea name="konum" cols="150" rows="5" class="footersmin" id="konum"><%= rs("konum") %></textarea>	  </td>
    </tr> 
       <tr>
     <td height="25" colspan="5" background="images/butonguncelle.png" style="border-radius:10px"><div align="center"><strong><font color="#FFFFFF">Projeye Ait Resimler</font></div></td>
     </tr>
	    <tr>
          <td colspan="5" valign="top">
		  <table width="99%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
         <%for i=1 to 20
		 if i=1 then
		 rss=""
		 else
		 rss=i
		 end if%>
          <td align="center"><%if rs("resim"&rss&"")<>"" then
		snc = InStr(1,rs("resim"&rss&""), "http://")%>
        <a href="<%if snc=0 then%>../<%end if%><%=rs("resim"&rss&"")%>" rel='slayt[1]' title="<%= rs("adi")%>">
        <img  onerror="src = '/ofosoft_img/resimyok.jpg'" src="<%if snc=0 then%>../<%end if%><%=rs("resim"&rss&"")%>" border="0" width="100" height="80"></a>
              <%else%>
              <img src="/ofosoft_img/resimyok.jpg" border="0" width="100" height="80">
            <%end if%><br />
            <input name="Button" type="button" class="mbon" onClick="yenipencere('/ofosoft_editor/resimyukle.asp?id=<%= rs("id")%>&yer=resim<%=rss%>&klasor=paket','','resizable=yes,status=yes,width=800,height=600')" value="Resim Y�kle" /></td>
         <%if i=10 then%></tr><tr>
         <%end if
		 next%>   
        <tr>
      </table>		  </td>
    </tr>
 <tr>
     <td height="25" colspan="5" background="images/butonguncelle.png" style="border-radius:10px"><div align="center"><strong><font color="#FFFFFF">Proje Detay Bilgisi</font></div></td>
     </tr>
      <tr>
     <td height="25" colspan="5" align="center">
	 <textarea cols="80" id="editor1" name="editor1" rows="10"><%= rs("detay") %></textarea>
			<script type="text/javascript">
				CKEDITOR.replace( 'editor1' );
			</script>
			 </td>
     </tr>
 <tr>
     <td height="25" colspan="5" background="images/butonguncelle.png" style="border-radius:10px"><div align="center"><strong><font color="#FFFFFF">Proje Teknik Bilgisi</font></div></td>
     </tr>
      <tr>
     <td height="25" colspan="5" align="center">
  <textarea cols="80" id="editor2" name="editor2" rows="10"><%= rs("teknikbilgi") %></textarea>

			<script type="text/javascript">
				CKEDITOR.replace( 'editor2' );
			</script>
	 </td>
     </tr>
      
  </table>

  

</form>
<% end if %>
<% end if %>