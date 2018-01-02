<!--#include file="sifre.asp"-->
<%  
 if Request.Form("uye_guncelle")<>"" then
 	 sorgum="select * from uyeler where id="&id
	 Rs.Open Sorgum, Baglantim, 1, 3 
		rs("uyeliktarihi")=Request.Form("tarih")
		rs("adres")=Request.Form("adres")
		rs("tel")=Request.Form("tel")
		rs("cep")=Request.Form("cep")
		rs("is")=Request.Form("is")
		rs("isim")=Request.Form("isim")			:	rs("songiris")=Request.Form("songiris")
		rs("soyisim")=Request.Form("soyisim")
		rs("cinsiyet")=Request.Form("cinsiyet")
		rs("dogum")=Request.Form("dogum")
		rs("sehir")=Request.Form("sehir")
		rs("ulke")=Request.Form("ulke")
		rs("meslek")=Request.Form("meslek")
		rs("email")=Request.Form("email")
		rs("website")=Request.Form("website")
		rs("ip")=Request.Form("ip")
		rs("aciklama")=Request.Form("aciklama")
		if Request.Form("onay")<>"" then
			rs("onay")=1
		else
			rs("onay")=0
		end if
	rs.update	
	Response.Write("<center>Üyeyi Güncelliyorum</center>")
	Response.Redirect("giris.asp")
 end if
 
 
 
 if id<>"" then
 	sorgum="select * from uyeler where id="&id&" order by id desc"
 else
 	sorgum="select * from uyeler order by id desc"
 end if
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then%>

    	<div align="center"><a href="?kanal=ekle">Uye Bulunamadi Üye Eklemek Için Tiklayin. </a>
    	    <% if kanal="ekle" then
			rs.addnew
			rs("isim")="Yeni Uye"
			rs("uyeliktarihi")=now()
			rs("onay")=0
			rs.update
			Response.Redirect("giris.asp")
		end if %>
           <% else  %>
    	  
    	  
          <% kanal= Request.QueryString("kanal")  %>   
          <% if kanal="" then %>	
    	  
    	  
    	  
</div>
<table width="100%" border="0" cellpadding="5" cellspacing="0" >
  <tr>
    <td colspan="4"><img src="../tema/<%=sitetema%>/bg_cizgi.gif" width="100%" height="11"></td>
  </tr>
  <%
  		if rs.eof or rs.bof then

		else
			 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
			 
	  	<% rs.pagesize = 20 
		   rs.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rs.pagecount
	  	 	j=0			
		   for i=1 to 20
		     j=j+1
			  if rs.eof then exit for 
				%>
    <td width="25%" align="center">
	  <table width="98%" style="border:1px solid #3F5D38; border-collapse: collapse; margin-top:0px; margin-bottom:0px" cellpadding="0" cellspacing="0" bordercolor="#666666"  	onmouseover="this.style.backgroundColor='#FFFFD9';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';">
        <tr>
          <td><table width="100%" border="0" cellpadding="2" cellspacing="3">
            <tr>
              <td><div align="center"><%= rs("cinsiyet") %>&nbsp;<%= rs("isim") %>&nbsp;<%= rs("soyisim")%></div></td>
            </tr>
            <tr>
              <td><div align="center"><strong>[ <%=rs("uyeliktarihi")%> ]</strong></div></td>
            </tr>
            <tr>
              <td><div align="center"><a href="?sayfa=uyeler&amp;kanal=guncelle&amp;id=<%= rs("id") %>"><img src="images/detay.jpg"border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="?sayfa=uyeler&amp;kanal=sil&amp;id=<%= rs("id") %>" onclick="return confirm('Üyeyi Silmek Istediginizden Emin Misiniz?')"><img src="images/sil.jpg"border="0" /></a></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
  <%if j=4 then
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
        <td width="28%">Toplam<strong> <%=rs.recordcount %> </strong>Adet &Uuml;ye Bulunmaktad&#305;r. </td>
        <td width="72%" align="center">
						<p class="mc">
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<strong>[<%= y %>]</strong>
							<% else %>
				 			 <a href="?sayfa=uyeler&shf=<%= y %>"><%= y %></a>	
							<% end if
					next 
					end if%> </p>		  </td>
      </tr>
    </table></td>
  </tr>
</table>

<% end if
if kanal="ekle" then %>
<% 	rs.addnew
	rs("baslik")="Yeni Uye"
	rs("onay")=1
	rs.update
	Response.Redirect("giris.asp") %>
<% end if
if kanal="sil" then %>
	<% rs.close
	sorgum="delete * from uyeler where id="&id
    Rs.Open Sorgum, Baglantim, 1, 3 
	Response.Redirect("giris.asp")
	 %>
	 
<% end if
if kanal="guncelle" then%>
	<form id="form1" name="form1" method="post" action="?kanal=<%=kanal%>&id=<%= id %>">
  <table width="98%" border="0" cellpadding="5">
    <tr>
      <td width="295"><div align="right" style="font-weight: bold">
        <div align="right">&Uuml;yelik Tarihi : </div>
      </div></td>
      <td width="150"><label>
		<input  name="tarih" type="text" class="footersmin" id="tarih" value="<%=rs("uyeliktarihi")%>" size="25" maxlength="25" readonly="true">
      </label></td>
      <td width="211"><div align="right" style="font-weight: bold">
        <div align="right"> Tel : </div>
      </div></td>
      <td width="158"><input  name="cep" type="text" class="footersmin" id="cep" value="<%=rs("tel")%>" size="25" ></td>
      <td width="141"><div align="right" style="font-weight: bold">
        <div align="right">Cinsiyeti : </div>
      </div></td>
      <td width="159" colspan="3"><div align="right">
        <input  name="cinsiyet" type="text" class="footersmin" id="cinsiyet" value="<%=rs("cinsiyet")%>" size="25" >
      </div></td>
    </tr>
    <tr>
      <td width="295"><div align="right" style="font-weight: bold">
        <div align="right">Ad&#305; :  </div>
      </div></td>
      <td width="150">
      <label>
      <input  name="isim" type="text" class="footersmin" id="isim" value="<%=rs("isim")%>" size="25" >
      </label></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Cep : </div>
      </div></td>
      <td><input  name="cep" type="text" class="footersmin" id="cep" value="<%=rs("cep")%>" size="25" ></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Do&#287;um Tarihi : </div>
      </div></td>
      <td colspan="3"><div align="right">
        <input  name="dogum" type="text" class="footersmin" id="dogum" value="<%=rs("dogum")%>" size="25" >
      </div></td>
    </tr>
    <tr>
      <td width="295">
      <div align="right" style="font-weight: bold"> Soyad&#305;  :</div>      </td>
      <td width="150">
      <label></label>      
      <input  name="soyisim" type="text" class="footersmin" id="soyisim" value="<%=rs("soyisim")%>" size="25" ></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Ýþ : </div>
      </div></td>
      <td><input  name="is" type="text" class="footersmin" id="is" value="<%=rs("is")%>" size="25" maxlength="25" /></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">&#350;ehir : </div>
      </div></td>
      <td><div align="right">
        <input  name="sehir" type="text" class="footersmin" id="sehir" value="<%=rs("sehir")%>" size="25" >
      </div></td>
    </tr> 
        <tr>
      <td width="295">
      <div align="right" style="font-weight: bold"> E-Mail :</div>      </td>
      <td width="150">
      <label></label>
      <input  name="email" type="text" class="footersmin" id="email" value="<%=rs("email")%>" size="25" /></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Web Site : </div>
      </div></td>
      <td><input  name="website" type="text" class="footersmin" id="website" value="<%=rs("website")%>" size="25" ></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">&Uuml;lke : </div>
      </div></td>
      <td><div align="right">
        <input  name="ulke" type="text" class="footersmin" id="ulke" value="<%=rs("ulke")%>" size="25" >
      </div></td>
    </tr> 
        <tr>
      <td width="295"><div align="right" style="font-weight: bold">
        <div align="right">Kart Teslimi : </div>
      </div></td>
      <td width="150">
      <label>
      <input  name="songiris" type="text" class="footersmin" id="songiris" value="<%=rs("songiris")%>" size="25" />
      </label></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Meslek : </div>
      </div></td>
      <td><input  name="meslek" type="text" class="footersmin" id="meslek" value="<%=rs("meslek")%>" size="25" ></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">&#304;P No : </div>
      </div></td>
      <td><div align="right">
        <input  name="ip" type="text" class="footersmin" id="ip" value="<%=rs("ip")%>" size="25" readonly="true">
      </div></td>
    </tr> 
        <tr>
      <td width="295" height="32"><div align="right" style="font-weight: bold">
        <div align="right">Kart Gönderildi Mi?: </div>
      </div></td>
      <td width="150"><input type="checkbox" name="onay" id="onay" <%if rs("onay")=1 then%> checked="checked" <%end if%> /></td>
      <td><div align="right" style="font-weight: bold">
        <div align="right">Adres : </div>
      </div></td>
      <td colspan="3" rowspan="2" valign="top">
        <div align="left">
          <textarea name="adres" cols="78" rows="3"  class="footersmin" id="adres"><%=rs("adres")%></textarea>
          </div></td></tr>        
    <tr>
      <td height="34">&nbsp;</td>
      <td colspan="2"><label></label>
        <a href="?kanal=sil&amp;id=<%= rs("id") %>"  onclick="return confirm('Üyeyi Silmek Istediginizden Emin Misiniz?')"><img src="images/sil.jpg" border="0" /></a>&nbsp;&nbsp;
              <input name="uye_guncelle" type="submit" id="uye_guncelle" value="G&uuml;ncelle">&nbsp;&nbsp;
        <INPUT TYPE="button" VALUE="  Geri Dön  " onClick="history.go(-1)" ></td>
    </tr>
    <tr>
      <td height="29">&nbsp;</td>
      <td colspan="5"><span style="font-weight: bold">NOT : </span>Sistemin i&#351;lerli&#287;i a&ccedil;&#305;s&#305;nda bo&#351; alan b&#305;rakmamaya dikkat ediniz.</td>
    </tr>
  </table>
</form>
		<% end if %>
<% end if %>