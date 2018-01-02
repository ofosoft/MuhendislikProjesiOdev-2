<!--#include file="sifre.asp"-->
<%  sorgum="select * from basvuru order by id desc"
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>
 		<div align="center"><br />
 		Gelen Arsa Bildirimi Bulunmamaktadir...<br /><br />
 		</div>
    <%else%>    
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then 
		  %>	
	
<table width="100%" border="0" cellpadding="5" cellspacing="0" >
  <tr>
    <td width="200"><div align="center"><strong>Tarih</strong></div></td>
    <td><div align="left" style="font-weight: bold">G&ouml;nderen Adý Soyadý</div></td>
    <td><div align="left" style="font-weight: bold">Telefon</div></td>
    <td><div align="left" style="font-weight: bold">Adres</div></td>
    <td><div align="left" style="font-weight: bold">
      <div align="center">Okundu Mu?</div>
    </div></td>
    <td colspan="2"><div align="center"><strong>&#304;&#351;lemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="7" background="images/kesik_cizgi.gif" height="2"></td>
  </tr>
  <%     if rs.eof or rs.bof then
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
    <tr onmouseover="this.style.backgroundColor='#FFFFCC';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
     <td width="200" align="center"><strong><%= rs("tarih") %></strong></td>
     <td width="194" valign="middle"><%= rs("adi") %></td>
     <td width="146" valign="middle"><%= rs("tel") %></td>
     <td width="345" valign="middle"><%= rs("adres") %></td>
     <td width="157" valign="middle"> <div align="center">
       <%if rs("okundu")=0 then %>
       <img src="images/false.gif" width="20" height="20" />
       <%else%>
       <img src="images/true.gif" width="20" height="20" />
       <%end if%>
     </div></td>
     <td width="50" valign="middle">
  <div align="center"><a href="?sayfa=arsa bildirim&amp;kanal=oku&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div></td>
  <td width="50"><div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
    <td colspan="7" align="center" background="images/kesik_cizgi.gif" height="2"></td>
    </tr>
	 <% 
      rs.movenext
	next%>
 
  <tr>
    <td colspan="2">
    Toplam<strong> <%=rs.recordcount %> </strong>Adet Arsa Bildirimi Bulunmaktad&#305;r. </td>
    <td colspan="5">
      <div align="center">						
						<p class="mc">
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<strong>[<%= y %>]</strong>
							<% else %>
				 			 <a href="?shf=<%= y %>"><%= y %></a>	
							<% end if
					next 
					end if%> </p>
    </div></td>
  </tr>
  <tr>
    <td colspan="6">    </td>
  </tr>
</table>

<% end if
if kanal="sil" then %>
	<% rs.close
	sorgum="delete * from basvuru where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
<% end if
if kanal="oku" then
	rs.close
	sorgum="select * from basvuru where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
 rs("okundu")=1
 rs.update
%>

  <table width="100%" border="0" cellpadding="5" cellspacing="5">
    <tr>
      <td width="171"><div align="right" style="font-weight: bold">
        <div align="right">Tarih : </div>
      </div></td>
      <td width="315">
        <%= rs("tarih") %></td>
      <td width="155"><div align="right" style="font-weight: bold">Mail Adresi :</div></td>
      <td width="508" colspan="3">
      <%= rs("mail") %></td>
    </tr>
    <tr>
      <td width="171"><div align="right" style="font-weight: bold">
        <div align="right">G&ouml;nderen : </div>
      </div></td>
      <td width="315">
      <label><%= rs("adi") %></label></td>
      <td><div align="right" style="font-weight: bold">Telefon No :</div></td>
      <td colspan="3"><%= rs("tel") %></td>
    </tr>
    <tr>
      <td width="171" valign="top">
      <div align="right" style="font-weight: bold">Adres :</div>      </td>
      <td colspan="3" valign="top">
      <%= rs("adres") %></td>
    </tr>
        <tr>
      <td width="171"><div align="right" style="font-weight: bold">
        <div align="right">Arsanýn Ýlçesi : </div>
      </div></td>
      <td width="315">
      <label><%= rs("ilce") %></label></td>
      <td><div align="right" style="font-weight: bold">M<sup>2</sup>'si :</div></td>
      <td colspan="3"><%= rs("metre") %></td>
    </tr>
        <tr>
      <td width="171"><div align="right" style="font-weight: bold">
        <div align="right">Ýmar Durumu : </div>
      </div></td>
      <td width="315">
      <label><%= rs("imar") %></label></td>
      <td><div align="right" style="font-weight: bold">Pafta No :</div></td>
      <td colspan="3"><%= rs("pafta") %></td>
    </tr>
        <tr>
      <td width="171"><div align="right" style="font-weight: bold">
        <div align="right">Ada : </div>
      </div></td>
      <td width="315">
      <label><%= rs("ada") %></label></td>
      <td><div align="right" style="font-weight: bold">Parsel :</div></td>
      <td colspan="3"><%= rs("parsel") %></td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        Mesaj :</div></td>
      <td colspan="3" valign="top"><%= rs("mesaj") %></td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        Baþvuran :</div></td>
      <td colspan="3" valign="top"><%= rs("kim") %></td>
    </tr>
    <tr>
      <td height="34">&nbsp;</td>
      <td><div align="right"><a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Silmek Istediginizden Emin Misiniz?');"><img src="images/sil.jpg" border="0" /></a>&nbsp;&nbsp;</td>
      <td><input type="button" value="  Geri Dön  " onclick="history.go(-1)" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" /></td>
      <td>&nbsp;</td>
    </tr>
  </table>
<% end if
end if %>