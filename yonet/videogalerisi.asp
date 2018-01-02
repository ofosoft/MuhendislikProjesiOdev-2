<!--#include file="sifre.asp"-->
	<script type="text/javascript" src="/js_kara/mootools2.js"></script>
	<script type="text/javascript" src="/js_kara/slimbox2.js"></script>
	<link rel="stylesheet" href="/css/slimbox.css" type="text/css" media="screen">
<% if Request.form("sil")<>"" or kanal="sil" then
  			sorgum="delete * from video where id="&hkodu
	    	Rs.Open Sorgum, Baglantim, 1, 3  
			hata "Video Baþarýyla Silindi.",16
			Response.Redirect("giris.asp")
			
end if %>
<% if Request.QueryString("ekle")="ok" then
		    sorgum="select * from video"
	    	Ra.Open Sorgum, Baglantim, 1, 3
			ra.addnew  
			ra("isim")="Yeni Video"
			ra("aciklama")="Açýklama Giriniz."
			ra("kat_id")=0
			ra("tarih")=date()
			ra.update
			ra.close
end if %>

<% if Request.form("guncelle")<>"" then
		    sorgum="select * from video where id="&hkodu
	    	Ra.Open Sorgum, Baglantim, 1, 3  
			ra("isim")=Request.Form("baslik")
			ra("aciklama")=Request.Form("aciklama")
			ra("kat_id")=Request.Form("album")
			if Request.Form("resim")<>"" then
			 ra("resim")=Request.Form("resim")
			end if
			if Request.Form("resim2")<>"" then
			 ra("kod")=Request.Form("resim2")
			end if
				if Request.Form("goster")<>"" then
					ra("onay")=1
				else
					ra("onay")=0
				end if
			ra.update
			ra.close
			response.Redirect("giris.asp")
end if %>
<%if hkodu="" then
sirala= Request.QueryString("sirala")
yer= Request.QueryString("yer")
ssays=6

if sirala="evet" then
 if yer="numara" then
	skat=Request.QueryString("kategori")
	solcu=Request.QueryString("olcu")
	ssekil=Request.QueryString("sekil")
	sonay=Request.QueryString("onay")
	ssays=cint(Request.QueryString("sayi"))
  else
	skat=Request.Form("kategori")
	solcu=Request.Form("olcu")
	ssekil=Request.Form("sekil")
	sonay=Request.Form("onay")
	ssays=cint(Request.Form("sayi"))
   end if
    sorgum="Select * from video where "&sonay&" "&skat&" order by "&solcu&" "&ssekil&""	    
 else
   sorgum="Select * from video order by id desc"
end if
	Rs.Open Sorgum, Baglantim, 1, 3  
		if rs.eof or rs.bof then
			%>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><table width="98%" border="0" cellspacing="0" cellpadding="0" height="30" align="center" class="tablokenar2">
      <tr>
        <td align="center"><form id="form2" name="form2" method="post" action="?sirala=evet">
            <select name="olcu" id="olcu" style="width:150px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
              <option value="id"<%if solcu="id" then%> selected="selected"<%end if%>>Video Koduna Göre</option>
              <option value="isim"<%if solcu="isim" then%> selected="selected"<%end if%>>Video Adýna Göre</option>
          </select>
          &nbsp;
          <select name="sekil" id="sekil" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="DESC"<%if ssekil="DESC" then%> selected="selected"<%end if%>>Sondan Baþa</option>
            <option value="ASC"<%if ssekil="ASC" then%> selected="selected"<%end if%>>Baþtan Sonra</option>
          </select>
          &nbsp;
          <select name="onay" id="onay" style="width:180px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="onay>-1"<%if sonay="onay>-1" then%> selected="selected"<%end if%>>Tüm Videolar</option>
            <option value="onay=1"<%if sonay="onay=1" then%> selected="selected"<%end if%>>Onaylý Videolar</option>
            <option value="onay=0"<%if sonay="onay=0" then%> selected="selected"<%end if%>>Onaysýz Videolar</option>
           </select>
          &nbsp;
          <select name="kategori" style="width:200px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="and kat_id>-1"<%if skat="and kat_id>-1" then%> selected="selected"<%end if%>>Tüm Kategoriler</option>
        <% ru.open "select * from video_kat where goster=1 order by isim asc",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="and kat_id=<%= ru("id") %>" <% if skat="and kat_id="&ru("id")&"" then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
		<% ru.movenext
		loop
		ru.close %>
          </select>
          &nbsp;
          <select name="sayi" style="width:50px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="10"<%if ssays="10" then%> selected="selected"<%end if%>>10</option>
            <option value="25"<%if ssays="25" then%> selected="selected"<%end if%>>25</option>
            <option value="50"<%if ssays="50" then%> selected="selected"<%end if%>>50</option>
            <option value="100"<%if ssays="100" then%> selected="selected"<%end if%>>100</option>
            <option value="150"<%if ssays="150" then%> selected="selected"<%end if%>>150</option>
            <option value="200"<%if ssays="200" then%> selected="selected"<%end if%>>200</option>
          </select>
          &nbsp;
     <input type="submit" name="listele" id="listele" value="Tekrar Listele" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
        </form></td>
      </tr>
    </table></td>
                <td width="170"><a href="?ekle=ok"><img src="images/yenikayit.gif" width="153" height="34" border="0"></a></td>
              </tr>
              <tr>
                <td colspan="2"><div align="center" class="mbon">Aradýgýnýz Kriterlere Uygun Kayýt Bulunamadý.</div></td>
              </tr>
            </table>
      <%else%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td colspan="5">
    <table width="98%" border="0" cellspacing="0" cellpadding="0" height="30" align="center" class="tablokenar2">
      <tr>
        <td align="center"><form id="form2" name="form2" method="post" action="?sirala=evet">
            <select name="olcu" id="olcu" style="width:150px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
              <option value="id"<%if solcu="id" then%> selected="selected"<%end if%>>Video Koduna Göre</option>
              <option value="isim"<%if solcu="isim" then%> selected="selected"<%end if%>>Video Adýna Göre</option>
          </select>
          &nbsp;
          <select name="sekil" id="sekil" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="DESC"<%if ssekil="DESC" then%> selected="selected"<%end if%>>Sondan Baþa</option>
            <option value="ASC"<%if ssekil="ASC" then%> selected="selected"<%end if%>>Baþtan Sonra</option>
          </select>
          &nbsp;
          <select name="onay" id="onay" style="width:180px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="onay>-1"<%if sonay="onay>-1" then%> selected="selected"<%end if%>>Tüm Videolar</option>
            <option value="onay=1"<%if sonay="onay=1" then%> selected="selected"<%end if%>>Onaylý Videolar</option>
            <option value="onay=0"<%if sonay="onay=0" then%> selected="selected"<%end if%>>Onaysýz Videolar</option>
          </select>
          &nbsp;
          <select name="kategori" style="width:200px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="and kat_id>-1"<%if skat="and kat_id>-1" then%> selected="selected"<%end if%>>Tüm Kategoriler</option>
        <% ru.open "select * from video_kat where goster=1 order by isim asc",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="and kat_id=<%= ru("id") %>" <% if skat="and kat_id="&ru("id")&"" then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
		<% ru.movenext
		loop
		ru.close %>
          </select>
          &nbsp;
          <select name="sayi" style="width:50px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
            <option value="10"<%if ssays="10" then%> selected="selected"<%end if%>>10</option>
            <option value="25"<%if ssays="25" then%> selected="selected"<%end if%>>25</option>
            <option value="50"<%if ssays="50" then%> selected="selected"<%end if%>>50</option>
            <option value="100"<%if ssays="100" then%> selected="selected"<%end if%>>100</option>
            <option value="150"<%if ssays="150" then%> selected="selected"<%end if%>>150</option>
            <option value="200"<%if ssays="200" then%> selected="selected"<%end if%>>200</option>
          </select>
          &nbsp;
     <input type="submit" name="listele" id="listele" value="Tekrar Listele" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" >
        </form></td>
      </tr>
    </table></td>
    <td colspan="2" height="38"><div align="center"><a href="?ekle=ok"><img src="images/yenikayit.gif" width="153" height="34" border="0"></a></div></td>
  </tr>
  <tr>
    <td width="86" background="images/baslikalt.png" height="30"><div align="center" class="blokbaslik">Resim</div></td>
    <td width="181" background="images/baslikalt.png"><div align="left" class="blokbaslik">Ba&#351;l&#305;k</div></td>
    <td width="471" background="images/baslikalt.png"><div align="left" class="blokbaslik">Açýklamasý</div></td>
    <td width="218" background="images/baslikalt.png"><div align="left" class="blokbaslik">Kategorisi</div></td>
    <td width="105" background="images/baslikalt.png"><div align="center" class="blokbaslik">Onay</div></td>
    <td width="153" background="images/baslikalt.png" class="blokbaslik"><div align="center">Ýþlemler</div></td>
  </tr>
  <%
  		if rs.eof or rs.bof then

		else
			 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize = ssays
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	 				
		   for i=1 to ssays
		  
			  if rs.eof then exit for 
				%>
  <tr onmouseover="this.style.backgroundColor='#fefee6';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td width="86" align="center"><div align="center">
    <%if rs("resim")<>"" then
	snc = InStr(1,rs("resim"), "http://")%>
	 <a href="<%=rs("resim")%>" rel="lightbox[gallery]" title="<%= rs("isim")%>"><img  onerror="src = '/images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" width="75" height="75" border="0"></a>
	<%else
	Response.Write("Resim Yüklenmemis.")
	end if%>
    </div></td>
    <td width="181" align="center"><div align="left"><strong><%=rs("isim")%></strong><br>
    </div></td>
    <td><%= rs("aciklama") %></td>
    <td valign="middle"><%videokatbul(rs("kat_id"))%></td>
    <td valign="middle"><div align="center">
  <img src="images/<%if rs("onay")=1 then%>true<%else%>false<%end if%>.gif" border="0">
  </div></td>
    <td height="60"><div align="center"><a href="?hkodu=<%= rs("id") %>"><img src="images/detay.jpg"border="0"></a></div> 
    <br />
  <div align="center"><a href="?kanal=sil&amp;hkodu=<%= rs("id") %>"onclick="return confirm('Dikkat! Video Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0"></a></div></td>
  </tr>  <tr>
    <td colspan="7" height="1" align="right" background="images/kesik_cizgi.gif"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="7">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="22%">&nbsp;&nbsp;Toplam Kayit : <strong>  <%=rs.recordcount %></strong></td>
<td width="78%" align="left" height="45">
<table cellpadding="2" cellspacing="2" border="0" width="50">
<tr>
                         <%ssay=0
						 for y=1 to sayfa
						 ssay=ssay+1 %>
                         <td width="27">
							<table width="25" height="20" class="tablokenar" cellpadding="0" cellspacing="0" border="0" align="center">
                            <tr align="center" onmouseover="this.style.backgroundColor='#72fdff';" onMouseOut="this.style.backgroundColor='#FFFFFF';"><td<%if cint(shf)=cint(y) then %> bgcolor="#000066"<%end if%>>
							<%if cint(shf)=cint(y) then %>
						 	<font color="#FFFFFF"><strong><%= y %></strong></font>
							<% else 
							if sirala="evet" then%>
                            <a href="?sirala=evet&yer=numara&sayi=<%=ssays%>&kategori=<%=skat%>&onay=<%=sonay%>&olcu=<%=solcu%>&sekil=<%=sssekil%>&shf=<%= y %>"><%= y %></a>	
							<%else%>
				 			 <a href="?shf=<%= y %>"><%= y %></a>	
							<%end if
							end if%></td></tr></table></td>
					<%if ssay=25 then
					 response.Write("</tr><tr>")
					 ssay=0
					end if
					next 
					end if%>
             </tr></table>         </td>
      </tr>
    </table></td>
  </tr>
</table>






<%
end if
rs.close
end if
if hkodu<>"" then  
			sorgum="Select * from video where id="&hkodu
	    	Rs.Open Sorgum, Baglantim, 1, 3  
			if rs.eof or rs.bof then
				Response.Write("Kayit Bulunamadi")
			else
	%>

<table width="100%" border="0">
  <tr valign="top">
    <td> 
   	  <form name="form1" method="post" action="">
		<table width="100%" border="0" cellpadding="3" cellspacing="3">
			<tr>
			  <td width="350"><div align="right" style="font-weight: bold">Video Adý : </div></td>
			  <td colspan="2"><div align="left">
				<input name="baslik" type="text" class="footersmin2" id="baslik" value="<%=rs("isim")%>" size="92">
			  </div></td>
			  <td width="402"> <div align="left">
				  </div></td>
			</tr>
			<tr>
			    <td><div align="right" style="font-weight: bold">Video Göster :</div></td>
		      <td colspan="3"><div align="left">
		        <input name="goster" type="checkbox" id="goster" value="cdsfdfd" <% if rs("onay")=1 then %>  checked <% end if %>>
		      </div></td>
		  </tr>
      <tr>
			  <td valign="top"><div align="right" style="font-weight: bold">K&#305;sa A&ccedil;&#305;klama  : </div></td>
	        <td colspan="3"><textarea name="aciklama" cols="90" rows="9" class="footersmin2" id="aciklama"><%=rs("aciklama")%></textarea></td>
		  </tr>
			<tr>
			  <td><div align="right" style="font-weight: bold">Eklenme Tarihi : </div></td>
			  <td colspan="3"><%= rs("tarih") %></td>
			</tr>
			<tr>
			  <td><div align="right" style="font-weight: bold">Video Resim Yolu : </div></td>
	      <td><div align="left"><input name="resim" type="text" class="footersmin2" id="resim" value="<%=rs("resim")%>" size="70">
	      </div></td>
		    <td><input name="Button" type="button" class="yuklebuton" onClick="yenipencere('/ofosoft_editor/resimyukle.asp?id=<%= rs("id")%>&yer=resim&klasor=video','','resizable=yes,status=yes,width=800,height=600')" value="Bilgisayardan Y&uuml;kle" /></td>
		    <td>&nbsp;</td>
			</tr>
			<tr>
			  <td valign="top"><div align="right" style="font-weight: bold">Video Kodu veya Adresi : </div>
		      <div align="right">Bilgisayardan y&uuml;kleyebilir veya video payla&#351;&#305;m sitelerinin verdi&#287;i kodu ekleyebilirsiniz.</div></td>
	      <td><div align="left">
	        <textarea name="resim2" cols="70" rows="6" class="footersmin2" id="resim"><%=rs("kod")%></textarea>
	      </div></td>
		    <td><input name="Button2" type="button" class="yuklebuton" onClick="yenipencere('/ofosoft_Editor/videoyukle.asp?id=<%= rs("id")%>&yer=kod&klasor=video','','resizable=yes,status=yes,width=800,height=600')" value="Bilgisayardan Y&uuml;kle" /></td>
		    <td>&nbsp;</td>
			</tr>                        
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">Video Kategorisi : </div></td>
      <td colspan="4"><%akodu=rs("kat_id")%>
	  <select class="footersmin" name="album" id="album">
		<% ru.open "select * from video_kat",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="<%= ru("id") %>" <% if akodu=ru("id") then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
		<% ru.movenext
		loop
		ru.close %>
      </select>	  </td>
    </tr>
			<tr valign="top">
			  <td><div align="right" style="font-weight: bold"> Video Resim : </div>
			    <div align="right">Resmi orjinal halini görmek için üzerine týklayýnýz.</div></td>
			  <td width="385">
			  <%if rs("resim")<>"" then
	snc = InStr(1,rs("resim"), "http://")%>
	 <a href="<%=rs("resim")%>" rel="lightbox[gallery]" title="<%= rs("isim")%>"><img  onerror="src = '/images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" width="200" height="150" border="0"></a>
	<%else
	Response.Write("Resim Yüklenmemis.")
	end if%>			  </td>
		      <td width="129"><input name="guncelle" type="submit" id="guncelle" value="Güncelle" size="40" class="butonguncelle">
                <br />
                <br />
                <input name="Sil" onClick="return confirm('Dikkat! Video Tamamen Silinecektir.')" type="submit"  id="Sil" value="Sil" size="40" class="butonsil">
                <br />
                <br />
                <input type="button" value="« Geri Dön  " class="butongeri" onClick="history.go(-1)"></td>
		      <td>&nbsp;</td>
		  </tr>
	  </table>
      </form>
	  <p class="mbon">VÝDEO GÖRÜNTÜSÜ </p>
        <center>
		<%if rs("kod")="" then
		   response.write ("<center>Video Kodu Eklenmemiþ.</center>")
		 else
	  	   snc = InStr(1,rs("kod"), "http://") 
	      if snc=0 then
		  snc2 = InStr(1,rs("kod"), ".flv")
	       if snc2=0 then %>
		 	 <embed style="WIDTH:550px; HEIGHT:500px" height="500px" type="application/x-mplayer2" pluginspage="http://www.microsoft.com/Windows/Downloads/Contents/MediaPlayer/" width="550" src="<%=rs("kod")%>" autorewind="true" showdisplay="false" showstatusbar="false" showcontrols="true" autostart="true" filename="<%=rs("kod")%>" />
			<%else
			session("video")=rs("kod")%>
				<iframe src="/videoizle.asp?yer=video" width="620" height="430" scrolling="no" frameborder="0" style="padding-bottom:0px;"></iframe> 
			<%end if

  		  else
			response.Write(rs("kod"))
		  end if
		end if	%>
        </center>
	  <% end if %></td>
  </tr>
  <tr valign="top">
    <td>&nbsp;</td>
  </tr>
</table>
<% rs.close
  end if %>