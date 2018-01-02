<% if Request.QueryString("sayfasil")<>"" and Request.QueryString("sayfasil")<>10 and Request.QueryString("sayfasil")<>11 and Request.QueryString("sayfasil")<>49 then 
	sorgum="delete * from sayfa where id="&Request.QueryString("sayfasil")
	Rs.Open Sorgum, Baglantim, 1, 3
end if 
tablo=Request.QueryString("tablo")
id=Request.QueryString("id")
%>

<style type="text/css">
<!--
.stil2 {font-family: Verdana, Arial, Helvetica, sans-serif; font-weight: bold; font-size: 11px; }
-->
</style>

<table width="100%" border="0">
  <tr>
    <td>
	
 <% sorgum="Select * from Sayfa where id<>10 or id<>11 or id<>49 or id<>58 or id<>59 or id<>60"
	Rs.Open Sorgum, Baglantim, 1, 3 %> 
	
	<% if Request.Form("ekle")<>"" then
		rs.addnew
		rs("goster")=false
		rs.update
		rs.close
		Response.Redirect("giris.asp")
	end if %>
	
	<% if Request.Form("tekguncelle")<>"" then
  	    sorgum="Select * from sayfa where id="&id
	    Ra.Open Sorgum, Baglantim, 1, 3 
		ra("adi")=Request.form("Sayfa_adi_"&id)
		ra("turu")=Request.form("Sayfa_turu_"&id)	:	ra("blok")=Request.form("sayfa_blok_"&id)			
		ra("askodu")=Request.form("Sayfa_kategorisi_"&id)
		if Request.form("Sayfa_goster_"&id)<>"True" then
			ra("goster")=false
		else
			ra("goster")=true
		end if
		ra("detay")=Request.Form("editor1")
		ra.update
	   end if
	
	if Request.Form("Guncelle")<>"" then
	do while not rs.eof
		if Request.form("Sayfa_adi_"&rs("id"))<>"" then
			rs("adi")=Request.form("Sayfa_adi_"&rs("id"))
			rs("turu")=Request.form("Sayfa_turu_"&rs("id"))
			rs("blok")=Request.form("sayfa_blok_"&rs("id"))		
			rs("askodu")=Request.form("Sayfa_kategorisi_"&rs("id"))
				if Request.form("Sayfa_goster_"&rs("id"))<>"True" then
					rs("goster")=false
				else
					rs("goster")=true
				end if
			
			rs.update
		end if
	rs.movenext
	loop
	rs.close
	Response.Redirect("giris.asp")
	end if %>	
	<form name="form1" method="post" action="">
	  <table width="100%" align="center"  cellpadding="2" cellspacing="3" >
        <tr>
          <td width="71"><div align="center" class="stil2">Onay</div></td>
          <td><span class="stil2">Sayfa Adý</span></td>
          <td><span class="stil2">Sayfa T&uuml;r&uuml;</span></td>
          <td><span class="stil2">Ana Sayfa Ad&#305;</span></td>
		  <td><span class="stil2">Blok Görünümü</span></td>
          <td colspan="2" align="center"><span class="stil2">Ýþlemler</span></td>
        </tr>
        <tr>
          <td colspan="8" background="images/kesik_cizgi.gif" height="4"></td>
        </tr>
        <% do while not rs.eof %>
        <tr  <%if rs("id")=cint(Request.QueryString("id")) then %> bgcolor="#96DEDE"<% end if %>>
          <td width="20" align="center" height="30"><input name="Sayfa_goster_<%= rs("id") %>" type="checkbox" class="footersmin" id="Sayfa_goster_<%= rs("id") %>" value="True" <% if rs("goster")=true then %> checked <% end if %> /></td>
          <td width="543"><input name="Sayfa_adi_<%= rs("id") %>"skodu")_adi" type="text" class="footersmin" id="Sayfa_adi_<%= rs("id") %>" value="<%= rs("adi") %>" size="45" /></td>
          <td width="91"><label>
            <select  name="Sayfa_turu_<%= rs("id") %>" class="footersmin" >
              <option value="1"<%if rs("turu")=1 then%> selected="selected"<%end if%>>Ana Sayfa</option>
              <option value="0"<%if rs("turu")=0 then%> selected="selected"<%end if%>>Alt Sayfa</option>
            </select>
          </label></td>
          <td width="279"><%if rs("turu")=0 then%>
              <select  name="Sayfa_kategorisi_<%= rs("id") %>" class="footersmin">
                <%
	sorgum="Select * from Sayfa where turu=1 order by adi asc"
	Rv.Open Sorgum, Baglantim, 1, 3 
    do while not rv.eof
	 if rs("askodu")=rv("id") then
	 snc=1
	 else
	 snc=0
	 end if%>
                <option value="<%= rv("id") %>" <%if snc=1 then%> selected="selected"<%end if%>><%=rv("adi")%></option>
                <%  rv.movenext
	   loop
	   rv.close %>
              </select>
            <%end if%></td>
			<td width="91"><label>
            <select  name="sayfa_blok_<%= rs("id") %>" class="footersmin" >
              <option value="0"<%if rs("blok")=0 then%> selected="selected"<%end if%>>Sað-Sol Aktif</option>
              <option value="1"<%if rs("blok")=1 then%> selected="selected"<%end if%>>Sol Blok Aktif</option>
              <option value="2"<%if rs("blok")=2 then%> selected="selected"<%end if%>>Sað Blok Aktif</option>
              <option value="3"<%if rs("blok")=3 then%> selected="selected"<%end if%>>Sað-Sol Pasif</option>

            </select>
          </label></td>
          <td width="32"><div align="center">
          <% if tablo<>"" and cint(id)=rs("id") then%>
       <input name="tekguncelle" type="submit" id="tekguncelle" value="GÜNCELLE" style="width:80px; font-size:12px;font-weight:bold;color:#000000;text-decoration:none" />		  
		  <%else%>
          <a href="?tablo=sayfa&id=<%= rs("id") %>"><img src="images/detay.jpg" border="0" /></a>
          <%end if%></div></td>
          <td width="34"><div align="center">
              <%if rs("id")<>10 and rs("id")<>11 and rs("id")<>49 and rs("id")<>58 and rs("id")<>59 and rs("id")<>60 then%>
            <a href="?sayfasil=<%= rs("id") %>" onclick="return confirm('Silmek Ýstediginizden Emin Misiniz?');" ><img src="images/sil.jpg" border="0" /></a>
            <%end if%>
          </div></td>
        </tr>
        <% if tablo<>"" and cint(id)=rs("id") then%>
        <tr>
          <td colspan="7" height="4">
          <textarea id="office2003" name="editor1" rows="50" cols="80"><%= rs("detay") %></textarea>
			<script type="text/javascript">
			if ( typeof CKEDITOR == 'undefined' )
			{
				document.write('Ýçerik Boþ...' ) ;
			}
			else
			{
				var editor = CKEDITOR.replace( 'editor1' );
				CKFinder.setupCKEditor( editor, 'ckfinder/' ) ;
			}
			</script> 
          
          </td>
        </tr> <% end if %>
        <tr>
          <td colspan="7" background="images/kesik_cizgi.gif" height="4"></td>
        </tr>
        <%  rs.movenext
	   loop %>
        <tr>
          <td>&nbsp;</td>
          <td colspan="4"><div align="left">
              <input name="Ekle" type="submit"  id="Ekle" value="Yeni Sayfa Ekle" style="width:200px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
            &nbsp;&nbsp;
            <input name="Guncelle" type="submit" id="Guncelle" value="Sayfa Bilgilerini G&uuml;ncelle" style="width:200px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
          </div></td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
	</form>	</td>
  </tr>
</table>