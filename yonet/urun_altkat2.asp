<!--#include file="sifre.asp"-->
<%  
 if Request.Form("album_guncelle")<>"" then
 	 sorgum="select * from urun_altkat2 where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("isim")=Request.Form("baslik"):	rs("sira")=Request.Form("sira")
		rs("kat_id")=Request.Form("album")
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
 	sorgum="select * from urun_altkat2 where id="&id&" order by sira asc"
 Rs.Open Sorgum, Baglantim, 1, 3 	
 else
 	sorgum="select * from urun_altkat2 order by sira asc"
 Rs.Open Sorgum, Baglantim, 1, 3 	
session("kli")=rs.recordcount 
 end if
' Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>
<br />
    	<div align="center"><a href="?kanal=ekle">Alt Alt Kategori Bulunamadý. Eklemek Ýçin Týklayýn. </a><br />
    	    <% if kanal="ekle" then
			rs.addnew
			rs("isim")="...Yeni Alt Kategori"
			rs("goster")=0
			rs("kat_id")=0
			rs.update
			Response.Redirect("giris.asp")
		end if %>
           <% else  %>
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then %>	
  
</div>
<table width="100%" border="0" cellpadding="3" cellspacing="3" >
  <tr>
    <td width="470"><div align="left"><strong>Alt Alt Kategori Adý</strong></div></td>
    <td><div align="left" style="font-weight: bold">Alt Kategori Adý</div></td>
    <td><div align="left" style="font-weight: bold">
      <div align="center">Onay</div>
    </div></td>
    <td colspan="2"><div align="center"><strong>Ýþlemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="5"><img src="../tema/images/bg_cizgi.gif" width="100%" height="8"></td>
  </tr>
  <%
  		if rs.eof or rs.bof then

		else
			 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize = 10 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	 				
		   for i=1 to 10
		  
			  if rs.eof then exit for 
				%>
    <tr onmouseover="this.style.backgroundColor='#FFFFD5';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td width="470" valign="top" align="center"><div align="left"><strong><%=rs("isim")%></strong></div></td>
  <td width="415" valign="top">
   <% altkategoribul(rs("kat_id")) %></td>
  <td width="120" valign="middle"><div align="center">
  <img src="/images/<%if rs("goster")=1 then%>true<%else%>false<%end if%>.gif" border="0">
  </div></td>
  <td width="90"><div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div></td>
    <td width="71"><div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>"onclick="return confirm('Dikkat! Alt Kategori Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
    <td colspan="5" height="1" align="center" background="../tema/images/kesik_cizgi.gif"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="3">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="30%">Toplam<strong> <%=rs.recordcount %> </strong>Adet Kay&#305;t Bulunmu&#351;tur.</td>
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
    <td colspan="2" align="center"><a href="?kanal=ekle">Yeni Alt Alt Kategori Ekle</a></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("isim")="...Yeni Alt Kategori"
	rs("goster")=0
	rs("kat_id")=0
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" then %>
<% rs.close
	sorgum="delete * from urun_altkat2 where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%=kanal%>&id=<%= id %>">
  <table width="80%" border="0" align="center" cellpadding="5">
      <tr>
      <td width="189">
        <div align="right" style="font-weight: bold">Adi :</div>      </td>
      <td width="755">
      <label><input name="baslik" type="text" class="footersmin" id="baslik" value="<%= rs("isim") %>" size="60" /></label>      <label></label></td>
    </tr> 
     <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Ana Kategori :<br>
            </div>
      </div></td>
      <td>
      <%ukodu=rs("kat_id")%>
	  <select class="footersmin" name="album" id="album">
		<% ru.open "select * from urun_altkat",baglantim,1,3 %>
		<% do while not ru.eof
		if ru.eof then exit do%>
		<option value="<%= ru("id") %>" <% if ukodu=ru("id") then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
		<% ru.movenext
		loop
		ru.close %>
      </select>	
      </td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Liste Sýrasý :<br>
            </div>
      </div></td>
      <td><select class="footersmin" name="sira" id="sira" style="width:100px; font-size:13px;font-weight:normal;color:#333333;text-decoration:none">
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
      <td><label>
        <input name="goster" type="checkbox" id="goster" value="checkbox" <% if rs("goster")=1 then %> checked="checked" <% end if %> />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Dikkat! Alt Kategori Tamamen Silinecektir.')"><img src="images/sil.jpg" border="0" /></a>&nbsp;&nbsp;
        <input name="album_guncelle" type="submit" id="album_guncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"/>&nbsp;&nbsp;
        <input type="button" value="  Geri Dön  " onclick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
      </label></td>
    </tr>
  </table>
</form>
<% end if %>
<% end if %>