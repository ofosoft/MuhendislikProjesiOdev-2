<!--#include file="sifre.asp"-->
<%  
 if Request.Form("album_guncelle")<>"" then
 	 sorgum="select * from haber_kat where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("isim")=Request.Form("baslik")
		rs("aciklama")=Request.Form("aciklama")
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
 	sorgum="select * from haber_kat where id="&id&" order by id desc"
 else
 	sorgum="select * from haber_kat order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>

    	<div align="center"><a href="?kanal=ekle">Kategori Bulunamadý. Eklemek Için Týklayýn. </a>
    	    <% if kanal="ekle" then
			rs.addnew
			rs("isim")="Yeni Kategori."
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
    <td width="327"><div align="center"><strong>Adý</strong></div></td>
    <td><div align="left" style="font-weight: bold">Açýklamasý</div></td>
    <td><div align="left" style="font-weight: bold">
      <div align="center">Onay</div>
    </div></td>
    <td colspan="2"><div align="center"><strong>Ýþlemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="5" height="1" align="center" background="images/kesik_cizgi.gif"></td>
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
    <tr><td width="327" valign="top" align="center"><div align="left"><strong><%=rs("isim")%></strong></div></td>
  <td width="558" valign="top" onmouseover="this.style.backgroundColor='#EEEEEE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
   <%= rs("aciklama") %></td>
  <td width="139" valign="middle" onmouseover="this.style.backgroundColor='#EEEEEE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" ><div align="center">
  <img src="/images/<%if rs("goster")=1 then%>true<%else%>false<%end if%>.gif" border="0">
  </div></td>
  <td width="70"><div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div></td>
    <td width="70"><div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>"onclick="return confirm('Dikkat! Kategori Tamamen Silinecektir.')"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
    <td colspan="5" height="1" align="center" background="images/kesik_cizgi.gif"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="3">
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
	sorgum="delete * from haber_kat where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%=kanal%>&id=<%= id %>">
  <table width="80%" border="0" align="center" cellpadding="5">
      <tr>
      <td width="189">
        <div align="right" style="font-weight: bold">Adý :</div>      </td>
      <td width="755">
      <label><input name="baslik" type="text" class="footersmin" id="baslik" value="<%= rs("isim") %>" size="60" /></label>      <label></label></td>
    </tr> 
     <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Açýklamasý :<br>
            </div>
      </div></td>
      <td><textarea name="aciklama" cols="85" rows="5" class="footersmin" id="aciklama"><%= rs("aciklama") %></textarea>	  </td>
    </tr>        
    <tr>
      <td height="34"><div align="right" style="font-weight: bold">
          <div align="right">Kategoriyi Göster : </div>
      </div></td>
      <td><label>
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