<!--#include file="sifre.asp"-->
<script type="text/javascript" src="/js_kara/mootools2.js"></script>
<script type="text/javascript" src="/js_kara/slimbox2.js"></script>
<link rel="stylesheet" href="/css/slimbox.css" type="text/css" media="screen">
<%
 if Request.Form("urun_guncelle")<>"" then
 	 sorgum="select * from URUN where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("tarih")=Request.Form("tarih")
		rs("adi")=Request.Form("baslik")		:	rs("fiyat2")=Request.Form("fiyat2")
		rs("fiyat")=Request.Form("fiyat")		:	rs("stok")=Request.Form("stok")
		rs("aciklama")=Request.Form("aciklama")	:	rs("kod")=Request.Form("kod")
		rs("anahtar")=Request.Form("anahtar")	:	rs("sira")=Request.Form("sira")
		if request.QueryString("katid")<>0 then
		 rs("kat_id")=Request.QueryString("katid")
		end if 	
		if request.QueryString("altkatid")<>0 then
 		 rs("altkat_id")=request.QueryString("altkatid")
		else
		 if request.Form("altkat")<>"" then
		  Set istek = Request.Form("altkat") 
		  istekbolum = Split(istek,"=")
		  rs("altkat_id")=cint(istekbolum(4))
		  'katt = InStr(1,request.Form("altkat"), "http://")
		  'rs("altkat2_id")=katt
		 end if
		end if	
		 rs("altkat2_id")=request.Form("altkat2")
		if Request.Form("goster")<>"" then
			rs("goster")=1
		else
			rs("goster")=0
		end if
		if Request.Form("goster2")<>"" then
			rs("anasayfa")=1
		else
			rs("anasayfa")=0
		end if
		if Request.Form("goster3")<>"" then
			rs("indirim")=1
		else
			rs("indirim")=0
		end if		
		rs("siparis")= Request.Form("siparis")
		rs.update
	Response.Write("<center>Ürünü Güncelliyorum</center>")
	Response.Redirect("giris.asp")
 end if
 
 
 
 if id<>"" then
 	sorgum="select * from urun where id="&id&" order by id desc"
    Rs.Open Sorgum, Baglantim, 1, 3
  else
 	sorgum="select * from urun order by id desc"
	Rs.Open Sorgum, Baglantim, 1, 3
	session("kli")=rs.recordcount
 end if
 if rs.eof or rs.bof then%>

    	<style type="text/css">
<!--
.stil2 {font-size: 11px}
-->
        </style>
    	<div align="center"><a href="?kanal=ekle">Ürün Bulunmamaktadýr. Eklemek Ýçin Týklayýn. </a>
    	    <% if kanal="ekle" then
			rs.addnew
			rs("adi")="Yeni Ürün"	: rs("anahtar")="murat,hali,halý,sivas"
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
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2"><div align="center"><strong><a href="?kanal=ekle"><img src="images/yenikayit.gif" width="153" height="34" border="0" /></a></strong></div></td>
  </tr>
  <tr>
    <td width="75"><div align="center"><strong>Resim</strong></div></td>
    <td><div align="left" style="font-weight: bold">Ürün K&#305;sa &Ouml;zeti</div></td>
    <td><div align="left" style="font-weight: bold">Ürün Kategorileri</div></td>
    <td><div align="center"><strong>&#304;zinler</strong></div></td>
    <td><div align="center"><strong>&#304;&#351;lemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="5"><img src="/tema/images/bg_cizgi.gif" width="100%" height="8"></td>
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
    <td width="75" align="center">
	<%if rs("resim")<>"" then
	snc = InStr(1,rs("resim"), "http://")%>
	 <a href="<%=rs("resim")%>"  rel='lightbox[gallery]' title="<%= rs("adi")%>"><img  onerror="src = '/images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" width="75" height="75" border="0"></a>
	<%else
	Response.Write("Resim Yüklenmemis.")
	end if%>	</td>
  <td width="596" valign="middle">
 
  <strong><%= rs("sira") %>. <%= rs("adi") %></strong>&nbsp;<font color="#FF0000">[Fiyatý : <%= rs("fiyat") %>]</font> - Stok Satýsý : <b><%=rs("stok")%></b> - Ürün Kodu : <b><%=rs("kod")%></b><br><%= rs("aciklama") %></td>
  <td width="289" valign="middle"><table width="98%" border="0" cellspacing="2" cellpadding="2">
    <tr>
      <td width="43%"><span style="font-weight: bold">Ana Kategori</span></td>
      <td width="57%"><span style="font-weight: bold">:</span>
        <%kategoribul(rs("kat_id"))%></td>
    </tr>
    <tr>
      <td><span style="font-weight: bold">Alt Kategori</span></td>
      <td><span style="font-weight: bold">:</span>
        <%altkategoribul(rs("altkat_id"))%></td>
    </tr>
    <tr>
      <td><span style="font-weight: bold">Alt Alt Kategori</span></td>
      <td><span style="font-weight: bold">: </span>
        <%altaltkategoribul(rs("altkat2_id"))%></td>
    </tr>
  </table>    </td>
<td width="134"><table width="98%" border="0" cellspacing="2" cellpadding="2">
  <tr>
    <td width="77%"><span style="font-weight: bold">Onay</span></td>
    <td width="23%"><span style="font-weight: bold">
      <%if rs("goster")=1 then%>
      <img src="/images/true.gif">
      <%else%>
      <img src="/images/false.gif">
      <%end if%>
    </span></td>
  </tr>
  <tr>
    <td><span style="font-weight: bold">Ana Sayfa</span></td>
    <td><span style="font-weight: bold">
      <%if rs("anasayfa")=1 then%>
        <img src="/images/true.gif">
        <%else%>
        <img src="/images/false.gif">
        <%end if%>
    </span></td>
  </tr>
  <tr>
    <td><span style="font-weight: bold">&#304;ndirim</span></td>
    <td><span style="font-weight: bold">
      <%if rs("indirim")=1 then%>
        <img src="/images/true.gif">
        <%else%>
        <img src="/images/false.gif">
        <%end if%>
    </span></td>
  </tr>
  <tr>
    <td><span style="font-weight: bold">Sipari&#351;</span></td>
    <td><span style="font-weight: bold">
      <%if rs("siparis")=1 then%>
      <img src="/images/true.gif">
    <%else%>
    <img src="/images/false.gif">
    <%end if%>
    </span></td>
  </tr>
</table></td>
  <td width="70">

<div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>&amp;katid=0&amp;altkatid=0"><img src="images/detay.jpg"border="0" /></a></div>
<br />

<div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Dikkat! Ürün Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
      <td colspan="5" background="/tema/images/kesik_cizgi.gif" align="center" height="1"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="3">
    <table width="100%" border="0" cellspacing="3" cellpadding="3">
      <tr>
        <td width="28%">Toplam<strong> <%=rs.recordcount %> </strong>Adet Ürün Kaydedilmistir.</td>
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
    <td colspan="2" align="center"><a href="?kanal=ekle">Yeni Ürün Ekle</a></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("adi")="Yeni Ürün"	: rs("anahtar")="murat,hali,halý,sivas"
	rs("goster")=0
	rs("tarih")=date()
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" then %>
	<% rs.close
	sorgum="delete * from urun where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
<%katid=cint(request.QueryString("katid"))
  if rs("kat_id")=0 or rs("kat_id")="" then
   ukodu=0
  else
   ukodu=cint(rs("kat_id"))
  end if
  altkatid=cint(request.QueryString("altkatid"))
  if rs("altkat_id")=0 or rs("altkat_id")="" then
   uukodu=0
  else 
   uukodu=cint(rs("altkat_id"))
  end if%>
  <form id="form1" name="form1" method="post" action="?kanal=<%= kanal %>&id=<%= id %>&katid=<%=katid%>&altkatid=<%=altkatid%>">
  <table width="100%" border="0" cellpadding="3" cellspacing="2">
           <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Ürün Kategorisi :<br>
          </div>
      </div></td>
      <td>
	  <select name="album" id="album" onchange="MM_jumpMenu('parent',this,0)" style="width:156px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none">
	  	<option value="?kanal=guncelle&id=<%=id%>&katid=0&altkatid=0">Kategori Seçiniz.</option>
		<% ru.open "select * from urun_kat",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do
'		if katid<>0 then
		%>
        
		<%'else%>
		<option value="?kanal=guncelle&id=<%=id%>&katid=<%= ru("id") %>&altkatid=0" <% if ru("id")=cint(katid) then  %> selected="selected" <% end if %>><%= ru("isim") %></option>
		<%'end if
		  ru.movenext
		  loop
		  ru.close %>
      </select></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
           </tr>
    <tr>
	 <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Ürün Alt Kategorisi :<br>
          </div>
      </div></td>
      <td><%if rs("altkat_id")<>"" then
		uakodu=cint(rs("altkat_id"))
		else
		uakodu=0
		end if%>
        <select name="altkat" id="altkat" onchange="MM_jumpMenu('parent',this,0)" style="width:156px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none">
          <%if katid<>0 then
			    sorgum="select * from urun_altkat where goster=1 and kat_id="&katid
			else
			   sorgum="select * from urun_altkat where goster=1 and kat_id="&ukodu			
			end if
		   Ru.Open Sorgum, Baglantim, 1,3
		  %>
	  	<%' ru.open "select * from urun_kat",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do
		if katid<>0 then
		%>
        <option value="?kanal=guncelle&id=<%=id%>&katid=<%=katid%>&altkatid=<%= ru("id") %>" <% if altkatid=ru("id") then  %> selected="selected" <% end if %>><%= ru("isim") %></option>
		<%else%>
		<option value="?kanal=guncelle&id=<%=id%>&katid=<%=katid%>&altkatid=<%= ru("id") %>" <% if ru("id")=cint(uukodu) then  %> selected="selected" <% end if %>><%= ru("isim") %></option>
          <%end if
		   ru.movenext
		loop
		ru.close %>
        </select></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Ürün Kodu : </div>
      </div></td>
      <td><input name="kod" type="text" style="width:100px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="kod" value="<%= rs("kod") %>" size="15" />
Ürünün Kodunu Yazýnýz.</td>
	 </tr>          
       <tr>
	   <td valign="top"><div align="right" style="font-weight: bold">
           <div align="right">&Uuml;r&uuml;n Alt Alt Kategorisi :<br />
           </div>
	     </div></td>
	   <td><%if rs("altkat2_id")<>"" then
		aakodu=cint(rs("altkat2_id"))
		else
		aakodu=0
		end if%>
        <select style="width:156px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" name="altkat2" id="altkat2">
        <%if altkatid<>0 then
		  sorgum="select * from urun_altkat2 where goster=1 and kat_id="&altkatid
		else
		  sorgum="select * from urun_altkat2 where goster=1 and kat_id="&uukodu			
			end if
		   Ru.Open Sorgum, Baglantim, 1,3
		  %>
             <% do while not ru.eof
		if ru.eof then exit do%>
             <option value="<%= ru("id") %>" <% if aakodu=ru("id") then %>selected="selected" <% end if %>><%= ru("isim") %></option>
             <% ru.movenext
		loop
		ru.close %>
         </select></td>
	   <td><div align="right" style="font-weight: bold">
         <div align="right">Stok Sayýsý : </div>
	     </div></td>
	   <td><input name="stok" type="text" style="width:100px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="stok" value="<%= rs("stok") %>" size="15" />
Ürünün Stok Miktarýný Yazýnýz.</td>
          </tr> 
<tr>
          <td><div align="right" style="font-weight: bold">
              <div align="right">Sipariþ Durumu :<br />
              </div>
          </div></td>
          <td><select class="footersmin" name="siparis" id="select" style="width:150px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none">
              <option value="1" <%if rs("siparis")=1 then%> selected="selected"<%end if%>>Sipariþe Açýk</option>
              <option value="0"<%if rs("siparis")=0 then%> selected="selected"<%end if%>>Sipariþe Kapalý</option>
          </select></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Liste Sýrasý : </div>
      </div></td>
      <td><select class="footersmin" name="sira" id="sira" style="width:100px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none">
        <%kli=session("kli")
		for li=1 to kli%>
        <option value="<%=li%>" <%if rs("sira")=li then%> selected="selected"<%end if%>><%=li%>. Sýra</option>
        <%next%>
      </select> 
        Bizim Seçtiklerimiz alaný için.</td>
    </tr>           
          <tr>
      <td width="236"><div align="right" style="font-weight: bold">
        <div align="right">Kayýt Tarihi : </div>
      </div></td>
      <td width="199"><label>
		<input  name="tarih" type="text" style="width:150px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="tarih" value="<%=rs("tarih")%>" size="23" maxlength="25"/>
      </label></td>
      <td width="179"><div align="right" style="font-weight: bold">
        <div align="right">Ýndirimli Ürün Mü? : </div>
      </div></td>
      <td width="564" colspan="3"><input name="goster3" type="checkbox" id="goster3" value="checkbox" <% if rs("indirim")=1 then %> checked="checked" <% end if %> /></td>
    </tr>
  
	 <tr>
      <td>
        <div align="right" style="font-weight: bold">Fiyatý :</div>      </td>
      <td>
      <label><input name="fiyat" type="text" style="width:100px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="fiyat" value="<%= rs("fiyat") %>" size="15" /></label> 
      Örn : 75 TL  </td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">
          <p>&#304;ndirimli Fiyatý : </p>
          </div>
      </div></td>
      <td><input name="fiyat2" type="text" style="width:100px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="fiyat2" value="<%= rs("fiyat2") %>" size="23" />
       Örn : 55 TL</td>
    </tr>
    <tr>
      <td>
        <div align="right" style="font-weight: bold">Adý :</div>      </td>
      <td colspan="3">
      <label><input name="baslik" type="text" style="width:500px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="baslik" value="<%= rs("adi") %>" size="80" /></label>      </td>
    </tr>


        <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">&Uuml;r&uuml;n&uuml; G&ouml;ster : </div>
      </div></td>
      <td><input name="goster" type="checkbox" id="goster" value="checkbox" <% if rs("goster")=1 then %> checked="checked" <% end if %> /></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Ana Sayfada  G&ouml;ster : </div>
      </div></td>
      <td><input name="goster2" type="checkbox" id="goster2" value="checkbox" <% if rs("anasayfa")=1 then %> checked="checked" <% end if %> /></td>
    </tr>    
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Kýsa Açýklama :<br />
            <br />
              <span class="stil2">Ürünün ayak numaralarýný yazarsanýz site içi numara aramalarýnda çýkacaktýr.<br>
              </span></div>
      </div></td>
      <td colspan="3"><textarea name="aciklama" cols="100" rows="6" style="width:500px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="aciklama"><%= rs("aciklama") %></textarea>	  </td>
    </tr>
 <tr>
      <td height="34" colspan="4"><table width="99%" border="0" align="center" cellpadding="2" cellspacing="2">
        <tr>
          <td align="center"><%if rs("resim")<>"" then
		  		snc = InStr(1,rs("resim"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td>
                   <td align="center"><%if rs("resim2")<>"" then
		  		snc = InStr(1,rs("resim2"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim2")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim2")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td>
          <td align="center"><%if rs("resim3")<>"" then
		  		snc = InStr(1,rs("resim3"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim3")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim3")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td>
              <td align="center"><%if rs("resim4")<>"" then
		  		snc = InStr(1,rs("resim4"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim4")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim4")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td> 
          <td align="center"><%if rs("resim5")<>"" then
		  		snc = InStr(1,rs("resim5"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim5")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim5")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td>
          <td align="center"><%if rs("resim6")<>"" then
		  		snc = InStr(1,rs("resim6"), "http://")

		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim6")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim6")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td>
          <td align="center"><%if rs("resim7")<>"" then
		  		snc = InStr(1,rs("resim7"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim7")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim7")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td>  
          <td align="center"><%if rs("resim8")<>"" then
		  		snc = InStr(1,rs("resim8"), "http://")
		  	%>
          		
              <img  onerror="src = '../images/resimyuklenemedib.gif'" src="<%if snc=0 then%>../<%end if%><%=rs("resim8")%>" border="0" width="75" height="75" rel='lightbox[gallery]' title="<%= rs("adi")%>"><br />
              <a href="<%if snc=0 then%>../<%end if%><%=rs("resim8")%>" target="_blank" rel='lightbox[gallery]' title="<%= rs("adi")%>">[ Resmi B&uuml;y&uuml;t ]</a>
              <%else%>
              <img src="../images/resimyok.gif" border="0" width="75" height="75">
            <%end if%></td>                                                                                            
        </tr>
        <tr>
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim2','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim3','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim4','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim5','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim6','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim7','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>  
          <td align="center"><input name="Button" type="button" class="mbon" onClick="yenipencere('/Editor/assetmanager/urun_resim.asp?id=<%= rs("id")%>&yer=resim8','','resizable=yes,status=yes,width=800,height=550')" value="Resim Y&uuml;kle" /></td>                              
        </tr>
      </table></td>
    </tr> 
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">Anahtar Kelimeler :</div>
                  <div align="right">Kelimeler arasini (,) ile ayiriniz.Max 100 kelime. (,) den sonra bir boþluk býrakýnýz.</div>
      </div></td>
      <td colspan="3"><textarea name="anahtar" cols="95" rows="3" style="width:500px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none" id="anahtar"><%= rs("anahtar") %></textarea>	  </td>
    </tr>       
    <tr>
      <td height="34">&nbsp;</td>
      <td colspan="3"><label></label>
        <a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Silmek Ýstediðinizden Emin Misiniz?');"><img src="images/sil.jpg" border="0"></a>
              <input name="urun_guncelle" type="submit" id="urun_guncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"/>
        <INPUT TYPE="button" VALUE="  Geri Dön  " onClick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"></td>
    </tr>
  </table>
</form>
        
		<p align="center"><span style="font-weight: bold; font-style: italic">Detay Bilgisi :</span><br />


<strong>&Uuml;r&uuml;n  Detay&#305;n&#305; Girdikten Sonra Sol Üst Kö&#351;ede <span style="font-style: italic; color: #FF0000">Disket (Kaydet)</span> &#304;konuna Bas&#305;n&#305;z...</strong></p>
<center><iframe src="../Editor/code/editor.asp?Tablo=urun&id=<%= id %>" width="750" height="550" frameborder="0"></iframe></center>
<% end if %>
<% end if %>