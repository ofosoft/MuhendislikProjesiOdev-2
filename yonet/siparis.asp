<!--#include file="sifre.asp"-->
<%  if Request.Form("listeyedon")<>"" then
Response.Redirect("giris.asp")
end if
 if Request.Form("guncelle")<>"" then
 	 sorgum="select * from talepler where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		if rs("okundu")=1 then
			rs("okundu")=0
		else
			rs("okundu")=1
		end if
	rs.update	
	Response.Write("<center>Kaydý Güncelliyorum</center>")
	Response.Redirect("giris.asp?kanal=oku&id="&id&"")
 end if
 
'--------------- stok kýsmý ----------------
 if Request.Form("stok")<>"" then
 	 sorgum="select * from talepler where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("stok")=1
		uid=rs("u_id")
	rs.update	: rs.close	
	'---------------urunlerde güncelleniyor -------------
	 sorgum="select * from urun where id="&uid
	 Rs.Open Sorgum, Baglantim, 1, 3 
	 if rs.eof or rs.bof then
	 else
		rs("stok")=rs("stok")-1
	 end if
	 rs.update	: rs.close	
	'--------------- bitiþ ------------------------------
	Response.Write("<center>Kaydý Güncelliyorum</center>")
	Response.Redirect("giris.asp?kanal=oku&id="&id&"")
 end if


'---------------- stok bitiþ ---------------
 
 
 
 if id<>"" then
 	sorgum="select * from talepler where id="&id&" order by id desc"
 else
 	sorgum="select * from talepler order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>
<style type="text/css">
<!--
.stil100 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>


    	<div align="center">Yeni Sipari&#351; Kayd&#305;  Yok.
           <% else  %>
	  
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then %>	
    	  
    	  
    	  
</div>
<table width="100%" border="0" cellpadding="5" cellspacing="0" >
  <%
  		if rs.eof or rs.bof then

		else
			 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize = 14 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	 	j=0			
		   for i=1 to 14
		     j=j+1
			  if rs.eof then exit for 
				%>
    <td width="25%" align="center">
	  <table width="98%" style="border:1px solid #3F5D38; border-collapse: collapse; margin-top:0px; margin-bottom:0px" cellpadding="0" cellspacing="0" bordercolor="#666666" onmouseover="this.style.backgroundColor='#FFFFD9';" 
    onMouseOut="this.style.backgroundColor='<%if rs("okundu")=0 then%>#FFDFDF<%end if%>';" <%if rs("okundu")=0 then%>bgcolor="#FFDFDF"<%end if%>>
        <tr>
          <td><table width="100%" border="0" cellpadding="2" cellspacing="3" >
            <tr>
              <td><div align="center"><%= rs("cinsiyet") %>&nbsp;<strong><%= rs("isim") %>&nbsp;<%= rs("soyisim")%></strong>&nbsp;[ <%= rs("sehir")%> ]</div></td>
            </tr>
            <tr>
              <td><div align="center"><strong>[ <%=rs("tarih")%> ]</strong></div></td>
            </tr>
            <tr>
              <td><div align="center"><a href="?kanal=oku&amp;id=<%= rs("id") %>"><img border="0" src="images/<%if rs("okundu")=1 then%>okundu.gif<%else%>okunmadi.gif<%end if%>"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="?kanal=oku&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="?kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Silmek Istediginizden Emin Misiniz?')"><img src="images/sil.jpg"border="0"></a></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
  <%if j=2 then
   j=0%>
  </tr>  <tr>
      <td colspan="4" align="center" height="4"></td>
  </tr><tr>
  <%end if%>
	 <% 
      rs.movenext
	next%>
   
  <tr>
    <td colspan="4">
    <table width="100%" border="0" cellspacing="3" cellpadding="3">
      <tr>
        <td width="28%">Toplam<strong> <%=rs.recordcount %> </strong>Adet Kayit Var.</td>
        <td width="72%" align="center">
						<p class="mc">
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<strong>[<%= y %>]</strong>
							<% else %>
				 			 <a href="?shf=<%= y %>"><%= y %></a>	
							<% end if
					next 
					end if%> </p>		  </td>
      </tr>
    </table></td>
  </tr>
</table>

<% end if
if REQUEST.Form("siparis_sil")<>"" or kanal="sil" then %>
	<% rs.close
	sorgum="delete * from talepler where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
	if kanal="oku" then%>
        <table width="100%" border="0" cellpadding="4" cellspacing="2">
      <tr>
        <td width="19%" bgcolor="#FFFFD5"><div align="right" class="style6 style7" style="font-weight: bold">Ad</div></td>
        <td width="2%" bgcolor="#FFFFD5"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td width="58%" bgcolor="#FFFFD5"><%=rs("isim")%></td>
    <td width="21%" rowspan="6" bgcolor="#FFFFD5"><div align="center"><strong><img src="../images/firmalar.gif" width="95" height="95"><br>
        Kiþisel Bilgileri</strong></div></td>
    </tr>
      <tr>
        <td bgcolor="#FFFFD5"><div align="right" class="style6 style7" style="font-weight: bold"> Soyad</div></td>
        <td bgcolor="#FFFFD5"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#FFFFD5"><%=rs("soyisim")%></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFD5"><div align="right" class="style6 style7" style="font-weight: bold">Doðum Tarihi</div></td>
        <td bgcolor="#FFFFD5"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#FFFFD5"><%=rs("dogum")%></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFD5"><div align="right" class="style6 style7" style="font-weight: bold">Cinsiyet</div></td>
        <td bgcolor="#FFFFD5"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#FFFFD5"><%=rs("cinsiyet")%></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFD5"><div align="right" class="style6 style7" style="font-weight: bold">Þehir </div></td>
        <td bgcolor="#FFFFD5"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#FFFFD5"><%=rs("sehir")%></td>
      </tr>
      <tr>
        <td bgcolor="#FFFFD5"><div align="right" class="style6 style7" style="font-weight: bold"> Mesleginiz</div></td>
        <td bgcolor="#FFFFD5"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#FFFFD5"><%=rs("meslek")%></td>
      </tr>
      <tr>
        <td colspan="4" height="10"></td>
      </tr>

      <tr>
        <td bgcolor="#DDFBFA"><div align="right" class="style6 style7" style="font-weight: bold"> Cep-Tel</div></td>
        <td bgcolor="#DDFBFA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#DDFBFA"><%=rs("cep_tel")%></td>
    <td rowspan="5" bgcolor="#DDFBFA"><div align="center"><strong><img src="../images/formmail.gif" width="95" height="95"><br>
            <br>
        Ýletiþim Bilgiler</strong></div></td>
    </tr>
      <tr>
        <td bgcolor="#DDFBFA"><div align="right" class="style6 style7" style="font-weight: bold"> E-Mail</div></td>
        <td bgcolor="#DDFBFA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#DDFBFA"><%=rs("mail")%></td>
      </tr>
      <tr>
        <td bgcolor="#DDFBFA"><div align="right" class="style6 style7" style="font-weight: bold"> Sabit Tel</div></td>
        <td bgcolor="#DDFBFA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#DDFBFA"><%=rs("tel")%></td>
      </tr>
      <tr>
        <td bgcolor="#DDFBFA"><div align="right" class="style6 style7" style="font-weight: bold"> Faks No</div></td>
        <td bgcolor="#DDFBFA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#DDFBFA"><%=rs("fax")%></td>
      </tr>
      <tr>
        <td valign="top" bgcolor="#DDFBFA"><div align="right" class="style6 style7" style="font-weight: bold">Adres</div></td>
        <td valign="top" bgcolor="#DDFBFA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td valign="top" bgcolor="#DDFBFA"></span><%=rs("adres")%></td>
      </tr>
      <tr>
        <td colspan="4" height="10" valign="top"></td>
      </tr>
      <tr>
        <td bgcolor="#C7D2FA"><div align="right" class="style6 style7" style="font-weight: bold"> Kay&#305;t Tarihi</div></td>
        <td bgcolor="#C7D2FA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#C7D2FA"><%=rs("tarih")%></td>
    <td rowspan="4" bgcolor="#C7D2FA"><div align="center"><strong><img src="../images/yoneticiler.gif" width="95" height="95"><br>
            <br>
        Talep Bilgileri</strong></div></td>
      </tr>
        <tr>
        <td bgcolor="#C7D2FA"><div align="right" class="style6 style7" style="font-weight: bold"> Urun Ad&#305; </div></td>
        <td bgcolor="#C7D2FA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#C7D2FA"><a href="/urunlerimiz-<%=rs("u_id")%>-<%=urunbul(rs("u_id"))%>.html" target="_blank"><%=urunbul(rs("u_id"))%></a></td>
          </tr>
        <tr>
          <td bgcolor="#C7D2FA"><div align="right" class="style6 style7" style="font-weight: bold">Stok Durumu</div></td>
          <td bgcolor="#C7D2FA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
          <td bgcolor="#C7D2FA">
          <%if rs("stok")=0 then%>
          <input name="stok" type="submit" id="stok"  onclick="return confirm('| <%=urunbul(rs("u_id"))%> | Ýsimli Ürünün Stoðu 1 Eksilecektir. Emin Misiniz?');"  value="Stoktan Düþ" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
          <%else%><b><font color="#FF0000">Stoktan Düþüldü.</font></b>
          <%end if%>
          </td>
        </tr>
            <tr>
              <td bgcolor="#C7D2FA"><div align="right" class="style6 style7" style="font-weight: bold">Açiklama</div></td>
              <td bgcolor="#C7D2FA"><div align="left" class="style6" style="font-weight: bold">:</div></td>
        <td bgcolor="#C7D2FA"></span><%=rs("aciklama")%></td>
          </tr>
            
      <tr>
        <td colspan="4" height="10"></td>
      </tr>
      <tr>
        <td></td>
        <td>&nbsp;</td>
        <td colspan="2"><form action="" method="post" name="form1" id="form1">
		<input name="listeyedon" type="submit" id="listeyedon" style="width:120px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" value="Sipariþlere Dön  ">
  &nbsp;&nbsp;
            <input name="siparis_sil" type="submit" id="Sil" value="Sil"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />&nbsp;&nbsp;<input name="guncelle" type="submit" id="guncelle" value="<%if rs("okundu")=1 then%>Okunmadý Olarak Güncelle<%else%>Okundu Olarak G&uuml;ncelle<%end if%>" style="width:200px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
      &nbsp;&nbsp;
        </form></td>
      </tr>
    </table>
        
        
<% end if 
end if%>