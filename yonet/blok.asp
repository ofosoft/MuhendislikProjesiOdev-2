<!--#include file="sifre.asp"-->
<%if session("yetkisi")=1 then%>
<%  
 sorgum="select * from bloklar"
 Rs.Open Sorgum, Baglantim, 1, 3 
 if rs.eof or rs.bof then
 
 else
  if Request.form("blok_guncelle")<>"" then
       rs("tema")=Request.form("tema")
       rs("sagustr")=Request.form("sagustr")	   	   	   
       rs("sagaltr")=Request.form("sagaltr")
       rs("anaaltr")=Request.form("anaaltr")
       rs("anaustr")=Request.form("anaustr")
       rs("sponsor")=Request.form("sponsor")
       rs("referans")=Request.form("referans")
       rs("urun")=Request.form("urun")
       rs("anasag")=Request.form("urun2")	
       rs("anaorta")=Request.form("anaorta")		      
       rs("anket")=Request.form("anket")
       rs("ekmenu")=Request.form("ekmenu")
       rs("arama")=Request.form("arama")
       rs("haberr")=Request.form("haberr")
       rs("sayfar")=Request.form("sayfar")
       rs("urunr")=Request.form("urunr")
       rs("galerir")=Request.form("galerir")
       rs("yaprak")=Request.form("yaprak")
       rs("anasol")=Request.form("anasol")
       rs("giris")=Request.form("giris")
       rs("hava")=Request.form("hava")
       rs("saghaber")=Request.form("saghaber")
	   for i=1 to 18
	    rs("b"&i&"")=Request.form("b"&i&"")
	   next
	   rs.update%>
<p class="mbon" style="background-color:#FFFF99"><center><br>
<strong>Blok Ayarlarý Baþarýyla Güncellendi.<br />
<br></strong></center></p>
<%
	end if	
%>

<link href="Dm.Rehber.Css.css" rel="stylesheet" type="text/css" />
<form name="form1" method="post" action="?islem=guncelle">
<table width="80%" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#FFFFff" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px">
  <tr>

    <td align="left"><div align="center" style="font-weight: bold">Site Blok  Ayarlar&#305;</div></td>
    <td align="left"><div align="center" style="font-weight: bold">Menü Blok Ayarlarý (Üstten ve Soldan Saða)</div></td>
  </tr>
  <tr>
    <td width="50%" align="left" valign="top"><table width="95%" border="0" cellspacing="5" align="center" cellpadding="5" bgcolor="#FFFFff" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px">
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td width="67%"><div align="right" style="font-weight: bold">Site Giri&#351; Reklam&#305; : </div></td>
          <td width="33%"><label>
            <select name="giris" id="giris" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
              <option value="1" <%if rs("giris")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
              <option value="0" <%if rs("giris")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
              </select>
            </label></td>
        </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Sol Blok Menü Listesi  : </div></td>
        <td><label>
          <select name="ekmenu" id="ekmenu" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("ekmenu")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("ekmenu")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Ana Sayfa Haber Alan&#305;  : </div></td>
        <td><label>
          <select name="anasol" id="uye_paneli17" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("anasol")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("anasol")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Ana Sayfa &Uuml;st Banner: </div></td>
          <td><label>
            <select name="anaustr" id="uye_paneli15" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
              <option value="1" <%if rs("anaustr")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
              <option value="0" <%if rs("anaustr")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
              </select>
            </label></td>
        </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Referanslar Alan&#305;  : </div></td>
   	    <td><label>
   	      <select name="referans" id="anasayfareklam" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
   	        <option value="1" <%if rs("referans")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
   	        <option value="0" <%if rs("referans")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
   	        </select>
   	      </label></td>
 	    </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Son Ürünler Alan&#305;  : </div></td>
   	    <td><label>
   	      <select name="urun" id="anasayfareklam" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
   	        <option value="1" <%if rs("urun")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
   	        <option value="0" <%if rs("urun")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
   	        </select>
   	      </label></td>
 	    </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">&#304;ndirimli &Uuml;r&uuml;nler Alan&#305;  : </div></td>
        <td><label>
          <select name="urun2" id="urun" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("anasag")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("anasag")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr> 
     <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Ana Sayfa Alt Banner  : </div></td>
        <td><label>
          <select name="anaaltr" id="anaaltr" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("anaaltr")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("anaaltr")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
     <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
       <td><div align="right" style="font-weight: bold">Ana Sayfa Kayan Resimler : </div></td>
       <td><select name="anaorta" id="anaorta" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
         <option value="1" <%if rs("anaorta")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
         <option value="0" <%if rs("anaorta")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
       </select></td>
     </tr>
       <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td width="67%"><div align="right" style="font-weight: bold">Sol Blok &Uuml;st Banner: </div></td>
        <td width="33%"><label>
          <select name="sagustr" id="uye_paneli5" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("sagustr")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("sagustr")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Sol Blok Alt Banner: </div></td>
        <td><label>
          <select name="sagaltr" id="uye_paneli5" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("sagaltr")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("sagaltr")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Son Etkinlikler Alani   : </div></td>
        <td><label>
          <select name="saghaber" id="anaaltr3" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("saghaber")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("saghaber")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Arama Alani    : </div></td>
        <td><label>
          <select name="arama" id="arama" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("arama")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("arama")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Anket Alan&#305;  : </div></td>
        <td><label>
          <select name="anket" id="uye_paneli6" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("anket")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("anket")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Sponsorlar Alan&#305;  : </div></td>
        <td><label>
          <select name="sponsor" id="sponsor" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("sponsor")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("sponsor")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Yaprak Reklam Banner   : </div></td>
        <td><label>
          <select name="yaprak" id="yaprak" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("yaprak")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("yaprak")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 

    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Tema De&#287;i&#351;tirme   : </div></td>
        <td><label>
          <select name="tema" id="tema" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("tema")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("tema")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td><div align="right" style="font-weight: bold">Hava Durumu Alan&#305;  : </div></td>
        <td><label>
          <select name="hava" id="hava" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value="1" <%if rs("hava")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value="0" <%if rs("hava")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </label></td>
      </tr>
    </table></td>
    <td width="50%" align="left" valign="top">
    <table width="95%" border="0" cellspacing="5" align="center" cellpadding="5" bgcolor="#FFFFff" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px">
     <%for i=1 to 18%>
      <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onmouseout="this.style.backgroundColor='#FFFFFF';" >
        <td width="67%"><div align="right" style="font-weight: bold"><%=i%>. Menü : </div></td>
        <td width="33%">
          <select name="b<%=i%>" id="giris2" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none">
            <option value=1 <%if rs("b"&i&"")=1 then%> selected="selected"<%end if%>>G&ouml;r&uuml;n&uuml;r.</option>
            <option value=0 <%if rs("b"&i&"")=0 then%> selected="selected"<%end if%>>G&ouml;r&uuml;nmez.</option>
          </select>
        </td>
      </tr>
      <%next%>
    </table></td>
  </tr>  
  <tr>
    <td colspan="3" align="left"><div align="center">
      <input name="blok_guncelle" type="submit" class="footersmin2" id="guncelle"  onclick="SubmitContent();" value="Blok Ayarlarýný Güncelle" style="width:200px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
    </div></td>
  </tr>
</table>
</form>

<% end if %>
<%else%>
<p align="center"><img src="../images/hata.jpg" width="300" height="181"><br>
          <br />
        Ulasmaya Çalistiginiz Sayfaya Erisim Yetkiniz Bulunmamaktadir.<br />
        <br>
	<%=siteadi%><br>

      <br>
<%end if%>
