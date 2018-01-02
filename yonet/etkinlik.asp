<!--#include file="sifre.asp"-->
<%  
 if Request.Form("duyuru_guncelle")<>"" then
 	 sorgum="select * from etkinlik where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("eklenme")=Request.Form("eklenme")
		rs("adi")=Request.Form("adi")
		rs("detay")=Request.Form("detay")
		rs("aciklama")=Request.Form("aciklama")
		rs("baslama")=Request.Form("aciklama")
		rs("bitis")=Request.Form("aciklama")
		rs("yer")=Request.Form("yer")
		if Request.Form("goster")<>"" then
			rs("goster")=1
		else
			rs("goster")=0
		end if
		rs.update
	Response.Write("<center>Güncelliyorum.</center>")
	Response.Redirect("giris.asp")
 end if
 
 
 
 if id<>"" then
 	sorgum="select * from etkinlik where id="&id&" order by id desc"
 else
 	sorgum="select * from etkinlik order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>

    	<div align="center"><a href="?kanal=ekle">Etkinlik Bulunamadý. Eklemek Ýçin Týklayýn. </a>
    	    <% if kanal="ekle" then
			rs.addnew
			rs("adi")="Yeni Etkinlik."
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
    <td width="94"><div align="center"><strong>Eklenme Tarihi</strong></div></td>
    <td><div align="left" style="font-weight: bold">Baþlýk </div></td>
    <td><div align="center"><span style="font-weight: bold">Baþlama-Bitiþ Tarihi</span></div></td>
	<td colspan="2"><div align="center"><strong>Durumu</strong></div></td>
    <td colspan="2"><div align="center"><strong>Ýþlemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="5"><img src="/ofosoft_img/bg_cizgi.gif" width="100%" height="11"></td>
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
      <tr><td width="94" align="center"><%=rs("eklenme")%></td>
      <td width="818" valign="middle" onmouseover="this.style.backgroundColor='#EEEEEE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" >
   <strong><%= rs("adi") %></strong><br>
   <%= left(rs("aciklama"),150)%>...</td>
      <td width="147" valign="middle" onmouseover="this.style.backgroundColor='#EEEEEE';" onMouseOut="this.style.backgroundColor='#FFFFFF';" ><div align="center">
      <% if rs("goster")=1 then%> <img src="images/true.gif"><%else%><img src="images/false.gif"><%end if%>
      
      </div></td>
      <td width="50"><div align="center"><a href="?kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div></td>
    <td width="55"><div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
    <td colspan="5" height="8" align="center" background="../tema/<%=sitetema%>/kesik_cizgi.gif"></td>
  </tr>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="3">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="40%">Toplam<strong> <%=rs.recordcount %> </strong>Adet Etkinlik Bulunmaktadýr. </td>
<td width="60%" align="center">
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
    <td colspan="2" align="center"><a href="?kanal=ekle">Yeni  Ekle</a></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("baslik")="Yeni Etkinlik"
	rs("goster")=0
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" then %>
<% rs.close
	sorgum="delete * from duyurular where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%=kanal%>&id=<%= id %>">
  <table width="80%" border="0" align="center" cellpadding="5">
    <tr>
      <td width="205"><div align="right" style="font-weight: bold">
        <div align="right">Tarihi : </div>
      </div></td>
      <td><label>
		<input  name="tarih" type="text" class="footersmin" id="tarih" value="<%=date()%>" size="25" maxlength="25"/>
      </label></td>
      <td width="575">&nbsp;</td>
    </tr>
      <tr>
      <td width="205">
        <div align="right" style="font-weight: bold">Baslik :</div>      </td>
      <td colspan="2">
      <label><input name="baslik" type="text" class="footersmin" id="baslik" value="<%= rs("baslik") %>" size="50" /></label>      <label></label></td>
    </tr> 
     <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        <div align="right">Detay&#305; :<br>
            </div>
      </div></td>
      <td colspan="2"><textarea name="aciklama" cols="85" rows="7" class="footersmin" id="aciklama"><%= rs("detay") %></textarea>	  </td>
    </tr>        
    <tr>
      <td height="34"><div align="right" style="font-weight: bold">
          <div align="right">Göster : </div>
      </div></td>
      <td colspan="2"><label>
        <input name="goster" type="checkbox" id="goster" value="checkbox" <% if rs("goster")=1 then %> checked="checked" <% end if %> />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');"><img src="images/sil.jpg" border="0" ></a>&nbsp;&nbsp;
        <input name="duyuru_guncelle" type="submit" id="duyuru_guncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none"/>&nbsp;&nbsp;
        <input type="button" value="  Geri Dön  " onclick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
      </label></td>
    </tr>
  </table>
</form>
<% end if %>
<% end if %>