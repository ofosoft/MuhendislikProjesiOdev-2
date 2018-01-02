<!--#include file="sifre.asp"-->
<%  sorgum="select * from formmail order by id desc"
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>
 		<div align="center"><br />
 		Gelen Mail Bulunmamaktadir...<br /><br />
 		</div>
    <%else%>    
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then 
		  %>	
	
<table width="100%" border="0" cellpadding="5" cellspacing="0" >
  <tr>
    <td width="200"><div align="center"><strong>Tarih</strong></div></td>
    <td><div align="left" style="font-weight: bold">G&ouml;nderen</div></td>
    <td><div align="left" style="font-weight: bold">Mail Adresi</div></td>
    <td><div align="left" style="font-weight: bold">Konu</div></td>
    <td><div align="left" style="font-weight: bold">
      <div align="center">Okundu Mu?</div>
    </div></td>
    <td colspan="2"><div align="center"><strong>&#304;&#351;lemler</strong></div></td>
  </tr>
  <tr>
    <td colspan="7" background="images/kesik_cizgi.gif" height="1"></td>
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
     <td width="194" valign="middle"><%= rs("ad_soyad") %></td>
     <td width="146" valign="middle"><%= rs("mail") %></td>
     <td width="345" valign="middle"><%= rs("konu") %></td>
     <td width="157" valign="middle"> <div align="center">
       <%if rs("durum")=false then %>
       <img src="images/false.gif" width="20" height="20" />
       <%else%>
       <img src="images/true.gif" width="20" height="20" />
       <%end if%>
     </div></td>
     <td width="50" valign="middle">
  <div align="center"><a href="?sayfa=formmail&amp;kanal=oku&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a></div></td>
  <td width="50"><div align="center"><a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');"><img src="images/sil.jpg"border="0" /></a></div></td>
  </tr>  <tr>
    <td colspan="7" align="center" background="images/kesik_cizgi.gif" height="1"></td>
    </tr>
	 <% 
      rs.movenext
	next%>
 
  <tr>
    <td colspan="2">
    Toplam<strong> <%=rs.recordcount %> </strong>Adet Mail Bulunmaktad&#305;r. </td>
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
	sorgum="delete * from formmail where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
<% end if
if kanal="oku" then
	rs.close
	sorgum="select * from formmail where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
 rs("durum")=true
 rs.update
%>

  <table width="80%" border="0" cellpadding="5" cellspacing="5">
    <tr>
      <td width="192"><div align="right" style="font-weight: bold">
        <div align="right">Tarih : </div>
      </div></td>
      <td width="197">
        <%= rs("tarih") %></td>
      <td width="123"><div align="right" style="font-weight: bold">Mail Adresi :</div></td>
      <td width="408" colspan="3">
      <%= rs("mail") %></td>
    </tr>
    <tr>
      <td width="192"><div align="right" style="font-weight: bold">
        <div align="right">G&ouml;nderen : </div>
      </div></td>
      <td width="197">
      <label><%= rs("ad_soyad") %></label></td>
      <td><div align="right" style="font-weight: bold">Telefon No :</div></td>
      <td colspan="3"><%= rs("tel") %></td>
    </tr>
    <tr>
      <td width="192" valign="top">
      <div align="right" style="font-weight: bold">Konu :</div>      </td>
      <td colspan="3" valign="top">
      <%= rs("konu") %></td>
    </tr>
    <tr>
      <td valign="top"><div align="right" style="font-weight: bold">
        Mesaj :</div></td>
      <td colspan="3" valign="top"><%= rs("mesaj") %></td>
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