<!--#include file="otomatiktamamla.asp"-->
<%islem=request("islem")
if islem="aramayap" then
	arananad=request.form("adsoyad")	: oncelik=request.form("oncelik")	:	subeid=request.form("subeid")		: sekil=request.form("sekil")
	sinif=request.form("sinif")
	session("arananad")=arananad	:	session("oncelik")=oncelik	: session("subeid")=subeid	: session("sekil")=sekil	: session("sinif")=sinif
	linkuzanti="islem=aramayapsayfa"
elseif islem="aramayapsayfa" then
	arananad=session("arananad")	:	oncelik=session("oncelik")	: subeid=session("subeid")	: sekil=session("sekil")	: sinif=session("sinif")
	linkuzanti="islem=aramayapsayfa"
end if
%>
<div class="blokkenar"><div class="menubaslik">19. Bölge Telefon Rehberi</div>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100"><img src="images/telefon_rehberi.png"></td>
     <td>
	<form id="form1" name="form1" method="post" action="telefonrehberi.asp?islem=aramayap">
	<table width="100%" border="0" cellspacing="1" cellpadding="1" height="114">
    <tr>
      <td width="22%" height="42"><div align="right"><strong>Adý Soyadý : </strong></div></td>
      <td width="22%" height="42"><input type="text" name="adsoyad" id="input" value="<%=arananad%>" size="25"/></td>
      <td width="20%" height="42"><div align="right"><strong>Þubesi :</strong></div></td>
      <td width="21%" height="42"><font size="1">
		<select name="subeid" style="width:200px;">
		<option value="and subekodu>0" <%if subeid="and subekodu>0" then%>selected="selected"<%end if%>>Tüm Þubeler</option>
        <%sorgum="Select * from subeler order by sirano asc"
		set rf=Baglantim.Execute(Sorgum)
		if not rf.eof then
		do while not rf.eof%>
		<option value="and subekodu=<%=rf("sube_kodu")%>" <%if subeid="and subekodu="&rf("sube_kodu")&"" then%>selected="selected"<%end if%>><%=rf("sube_adi")%></option>
     	<%
		rf.movenext
		loop		
		end if
		rf.close%> 
      </select></font></td>
      <td width="18%" rowspan="3"><label>
        <div align="center"></div>
      </label></td>
    </tr>
    <tr>
      <td height="32"><div align="right"><strong>Sýnýfý : </strong></div>
      </label></td>
      <td height="32">
	  <select name="sinif" id="sinif" style="width:150px;">
        <option value="memur" <%if sinif="memur" then%>selected="selected"<%end if%>>Memur</option>
        <option value="isci" <%if sinif="isci" then%>selected="selected"<%end if%>>Ýþçi (S/S)</option> 
        <option value="sozlesmeli" <%if sinif="sozlesmeli" then%>selected="selected"<%end if%>>Sözleþmeli</option>
      </select>
	  </td>
      <td height="32">
      <div align="right"><strong>Öncelik : </strong></div></td>
      <td height="32"><font face="Cambria">
		<select name="oncelik" id="oncelik" style="width:200px;">
        <option value="adi_soyadi" <%if oncelik="adi_soyadi" then%>selected="selected"<%end if%>>Kayýt Adý Soyadýna Göre</option> 
        <option value="sirano" <%if oncelik="sirano" then%>selected="selected"<%end if%>>Liste Önceliðine Göre</option>
        <option value="id" <%if oncelik="id" then%>selected="selected"<%end if%>>Kayýt Sýrasýna Göre</option>
        <option value="sicil_no" <%if oncelik="sicil_no" then%>selected="selected"<%end if%>>Sicil Numarasýna Göre</option>
		</select></font></td>
    </tr>
    <tr>
      <td><div align="right"><strong>Sýralama : </strong></div></td>
      <td>
		<select name="sekil" id="sekil" style="width:150px;">
		  <option value="asc" <%if sekil="asc" then%>selected="selected"<%end if%>>Baþtan Sona</option>
		  <option value="desc" <%if sekil="desc" then%>selected="selected"<%end if%>>Sondan Baþa</option>
        </select>
	  </td>
      <td colspan="2">
        <input type="submit" name="button" id="button" value="Arama Yap" style="width:100px; height:25px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
      </td>
    </tr>
  </table></form>
</td>
  </tr><tr><td colspan="2">
<div class="menubaslik">Memur Personellerimiz</div><!--#include file="telefonrehberiic1.asp"--></td></tr>
</table>
</div>		 