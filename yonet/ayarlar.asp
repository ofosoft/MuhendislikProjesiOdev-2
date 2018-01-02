<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 then%>
<%  
 sorgum="select * from ayarlar"
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then
 
 else
	if Request.Form("guncelle")<>"" then
       rs("site_adi")=Request.form("adi")
	   rs("site_url")=Request.form("url")
	   rs("site_slogan")=Request.form("slogan")
   	   rs("site_mail")=Request.form("mail")
	   rs("site_yetkili")=Request.form("yetkili")
   	   rs("site_ili")=Request.form("ili")	   
   	   rs("meta1")=Request.form("meta1")	
   	   rs("meta2")=Request.form("meta2")	
   	   rs("copyright")=Request.form("telif")
	   rs("smtp_server")=request.form("smtpserver")	
	   rs("site_mail2")=request.form("mail2")
	   rs("mail_sifre")=request.form("mailsifre")
	   rs("smtp_port")=request.form("smtpport")	
	   rs("smtp_cate")=request.form("smtpcate")	 
	   rs("smtp_ssl")=request.form("smtpssl")
	   rs("send_using")=request.form("sendusing")
	   rs("mail_bilesen")=Request.form("mailbilesen")
	   rs("rezervasyon")=Request.form("rezervasyon")
   	   rs("tarih_ayraci")=Request.form("mailbilesen2")
   	   rs("site_genislik")=Request.form("genislik")
	   rs.update%>
<p class="mbon" style="background-color:#FFFF99"><center><strong><img src="../images/bilgi.png" width="128" height="128" /><br />
Bilgiler Baþarýyla Güncellendi.</strong>
</center></p><%
	end if	

%>
<link href="Dm.Rehber.Css.css" rel="stylesheet" type="text/css" />
<form name="form1" method="post" action="">
<table width="100%" border="0" align="center" cellpadding="5" bgcolor="#FFFFFF" cellspacing="0" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px">
<% if Session("yetki")="admin" then%>
<%else
  end if%>  
   	<tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td width="25%"><div align="right"><strong>Site Adý : </strong></div></td>
    <td colspan="3"><div align="left">
      <input name="adi" type="text" class="footersmin" id="adi" value="<%= rs("site_adi") %>" size="60"/>
    </div></td>
  </tr>
   	<tr bgcolor="#FFFFFF" onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Url :</strong></div></td>
    <td colspan="3"><div align="left">
      <input name="url" type="text" class="footersmin" id="url" value="<%= rs("site_url") %>" size="60" />
    </div></td>
  </tr>
   	<tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Yetkilisi :</strong></div></td>
    <td colspan="3"><div align="left">
      <input name="yetkili" type="text" class="footersmin" id="url" value="<%= rs("site_yetkili") %>" size="60" />
    </div></td>
  </tr>
   	<tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong> Site Bölgesi veya Ili :</strong></div></td>
    <td colspan="3"><div align="left">
      <input name="ili" type="text" class="footersmin" id="url" value="<%= rs("site_ili") %>" size="60" />
    </div></td>
  </tr>
   	<tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Slogan : </strong></div></td>
    <td colspan="3"><div align="left">
      <input name="slogan" type="text" class="footersmin" id="slogan" value="<%= rs("site_slogan") %>" size="60" />
    </div></td>
  </tr>
   	<tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail : </strong></div></td>
    <td colspan="3"><div align="left">
      <input name="mail" type="text" class="footersmin" id="mail" value="<%= rs("site_mail") %>" size="50" />
    </div></td>
  </tr>
   	<tr onMouseOver="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail : </strong></div></td>
    <td colspan="3"><div align="left">
      <input name="mail2" type="text" class="footersmin" id="mail" value="<%= rs("site_mail2") %>" size="50">
    &Ouml;rn : ofosoft@gmail.com - Burasi bilgilendirme mailleri içindir.</div></td>
  </tr>
   	<tr onMouseOver="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail Sifresi : </strong></div></td>
    <td colspan="3"><div align="left">
      <input name="mailsifre" type="password" class="footersmin" id="mail" value="<%= rs("mail_sifre") %>" size="30">
    &Ouml;rn : 123XX456</div></td>
  </tr>  
   	<tr onMouseOver="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail Sunucusu : </strong></div></td>
    <td colspan="3"><div align="left">
        <input name="smtpserver" type="text" class="footersmin" id="sunucu" value="<%= rs("smtp_server") %>" size="30">
    &Ouml;rn : smtp.gmail.com</div></td>
    </tr>
   	<tr onMouseOver="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail Sunucu Portu : </strong></div></td>
    <td colspan="3"><div align="left">
        <input name="smtpport" type="text" class="footersmin" id="sunucu" value="<%= rs("smtp_port") %>" size="30">
    &Ouml;rn : 465</div></td>
    </tr>
   	<tr onMouseOver="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail Sunucusu Authenticate : </strong></div></td>
    <td colspan="3"><div align="left">
        <input name="smtpcate" type="text" class="footersmin" id="sunucu" value="<%= rs("smtp_cate") %>" size="30">
    &Ouml;rn : 1</div></td>
    </tr>  
   	<tr onMouseOver="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail Sunucusu Usessl : </strong></div></td>
    <td colspan="3"><div align="left">
        <input name="smtpssl" type="text" class="footersmin" id="sunucu" value="<%= rs("smtp_ssl") %>" size="30">
    &Ouml;rn : 1</div></td>
    </tr>  
   	<tr onMouseOver="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Site Mail Sunucusu Send Using : </strong></div></td>
    <td colspan="3"><div align="left">
        <input name="sendusing" type="text" class="footersmin" id="sunucu" value="<%= rs("send_using") %>" size="30">
    &Ouml;rn : 2</div></td>
    </tr> 
  <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
        <td width="30%"><div align="right" style="font-weight: bold">Mail Gönderme Bileseni : </div></td>
      <td colspan="3"><div align="left">
          <select name="mailbilesen" id="mailbilesen" class="footersmin">
            <option value="JMail" <%if rs("mail_bilesen")="JMail" then%> selected="selected"<%end if%>>JMail</option>
            <option value="CDONTS" <%if rs("mail_bilesen")="CDONTS" then%> selected="selected"<%end if%>>CDONTS</option>
            <option value="CDOSYS" <%if rs("mail_bilesen")="CDOSYS" then%> selected="selected"<%end if%>>CDOSYS</option>
            <option value="ASPEmail" <%if rs("mail_bilesen")="ASPEmail" then%> selected="selected"<%end if%>>ASPEmail</option>
          </select>
      </div></td>
   	</tr>
  <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
        <td width="30%"><div align="right" style="font-weight: bold">Yemekhane Rezervasyonu : </div></td>
      <td colspan="3"><div align="left">
          <select name="rezervasyon" id="mailbilesen" class="footersmin">
            <option value="acik" <%if rs("rezervasyon")="acik" then%> selected="selected"<%end if%>>Rezervasyona Açýk</option>
            <option value="kapali" <%if rs("rezervasyon")="kapali" then%> selected="selected"<%end if%>>Rezervasyona Kapalý</option>
          </select>
      </div></td>
   	</tr>
   	<tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
    <td><div align="right"><strong>Telif Yaz&#305;s&#305; : </strong></div></td>
    <td colspan="3"><div align="left">
      <input name="telif" type="text" class="footersmin" id="telif" value="<%= rs("copyright") %>" size="60"/>
     </div></td>
   	<tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
        <td width="30%"><div align="right" style="font-weight: bold">Sitenin Geni&#351;li&#287;i : </div></td>
      <td colspan="3"><input name="genislik" type="text" class="footersmin" id="genislik" value="<%= rs("site_genislik") %>" size="5"/>
[&Ouml;rn: <span style="color: #000099">90%</span> veya <span style="color: #FF0000">900</span> gibi]</td>
    <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
      <td><div align="right"><strong>Site A&ccedil;&#305;klamas&#305; : </strong></div></td>
      <td colspan="2"><div align="left">
          <textarea name="meta1" cols="60" rows="4" class="footersmin" id="meta1"><%= rs("meta1") %></textarea>
      </div></td>
      <td>Arama motorlar&#305; i&ccedil;in<span style="font-weight: bold"> &quot;description&quot; </span>ifadesidir. </td>
    </tr>
    <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
      <td><div align="right"><strong>Site Anahtar Kelimeleri : </strong></div></td>
      <td colspan="2"><div align="left">
          <textarea name="meta2" cols="60" rows="4" class="footersmin" id="sunucu3"><%= rs("meta2") %></textarea>
      </div></td>
      <td>Arama motorlar&#305; i&ccedil;in<span style="font-weight: bold"> &quot;keywords&quot; </span>ifadesidir. </td>
    </tr>
    <tr>
    <td align="left"><div align="right"><strong>Tarih Ayrac&#305; : </strong></div></td>
    <td colspan="3" align="left"><select name="mailbilesen2" id="mailbilesen2" class="footersmin">
      <option value="." <%if rs("tarih_ayraci")="." then%> selected="selected"<%end if%>>.</option>
      <option value="-" <%if rs("tarih_ayraci")="-" then%> selected="selected"<%end if%>>-</option>
      <option value="_" <%if rs("tarih_ayraci")="_" then%> selected="selected"<%end if%>>_</option>
      <option value="/" <%if rs("tarih_ayraci")="/" then%> selected="selected"<%end if%>>/</option>
    </select> 
      Host tarih ayrac&#305;n&#305;z&#305; belirtiniz.</td>
  </tr>
    <tr>
      <td align="left">&nbsp;</td>
      <td colspan="3" align="left"><input name="guncelle" type="submit" class="footersmin2" id="guncelle"  onclick="SubmitContent();" value="Ayarlari Kaydet" /></td>
    </tr>
</table>
</form>

<% end if %>
<%else%>
<div align="center"><img src="../ofosoft_img/hata.png"><br><br />Ulaþmaya Çalýstýðýnýz Sayfaya Eriþim Yetkiniz Bulunmamaktadýr.<br /><br><%=siteadi%><br><br></div>
<%end if%>