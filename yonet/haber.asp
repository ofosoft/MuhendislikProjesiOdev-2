<!--#include file="sifre.asp"-->
<% if Request.form("sil")<>"" or Request.QueryString("sil")="ok" then
  			sorgum="delete * from haber where hkodu="&hkodu
	    	Rs.Open Sorgum, Baglantim, 1, 3  
			hata "Haber Basariyla Silindi",16
			Response.Redirect("giris.asp")
			
end if %>
<% if Request.QueryString("ekle")="ok" then
		    sorgum="select * from haber"
	    	Ra.Open Sorgum, Baglantim, 1, 3
			ra.addnew  
			ra("baslik")="Yeni Haber"
			ra("aciklama")="Açiklama Giriniz."
			ra("goster")=0
			ra("ekleme")=date()
			hid=ra("hkodu")
			ra.update
			ra.close
			Set FSO = CreateObject("Scripting.FileSystemObject")
			veri=FSO.GetFolder(server.MapPath("/resimler/haber/"))&"\"&hid
			FSO.CreateFolder veri
			Response.Redirect("giris.asp?hkodu="&hid&"")
end if %>

<% if Request.form("guncelle")<>"" then
		    sorgum="select * from haber where hkodu="&hkodu
	    	Ra.Open Sorgum, Baglantim, 1, 3  
			ra("baslik")=Request.Form("baslik")
			ra("konum")=Request.Form("konum")
			ra("aciklama")=Request.Form("aciklama")
			ra("kat_id")=Request.Form("album")	
			ra("detay")=Request.Form("editor1")
			if Request.Form("resim")<>"" then
			 ra("resim")=Request.Form("resim")
			end if
				if Request.Form("goster")<>"" then
					ra("goster")=1
				else
					ra("goster")=0
				end if
			ra("update")=date()
			ra.update
			ra.close
end if %>
<center><div align="center" class="mbon" style="border-radius:10px"><a href="?ekle=ok">:::... Yeni Haber Ekle ...:::</a></div></center>
<table width="100%" border="0" cellpadding="1" cellspacing="1">
  <% if hkodu="" then
  sorgum="Select * from haber  order by hkodu desc"
	Rf.Open Sorgum, Baglantim, 1, 3  
		if rf.eof or rf.bof then%>


  <tr valign="top">
    <td> <center>
        Henüz Haber Kaydý Yapilmamýþ.
        <p align="center" class="mbon" style="border-radius:10px"><a href="?ekle=ok">:::... Yeni Haber Ekle ...:::</a></p></center></td></tr>
	<%	else %>
<tr valign="top">
    <td> 
    <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFDD" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px; padding:5px">
        <tr>
          <td height="65%" height="30px"><div align="left"><span style="font-weight: bold; padding:5px">Baslik</span></div></td>
          <td width="20%"><div align="left"><span style="font-weight: bold; padding:5px">Kategorisi</span></div></td>
          <td width="5%"><div align="center"><span style="font-weight: bold; padding:5px">Durum</span></div></td>
          <td width="20%"><div align="center"><span style="font-weight: bold; padding:5px">Islemler</span></div></td>
        </tr>
      </table>
<% 	 shf = Request.QueryString("shf")
		if shf="" then shf=1 end if %>
			 
	  	<% rf.pagesize = 20 
		   rf.absolutepage = shf
		   cellcolor="#FFFFFF"
		   sayfa = rf.pagecount
	  	 				
		   for i=1 to 20
		  
			  if rf.eof then exit for 
				%>
      <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#F8F8F8" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:2px; margin-bottom:3px">
        <tr>
          <td height="65%"><div align="left">
            <%= rf("baslik") %>
          </div></td>
          <td width="20%"><div align="left">
          <%= haberkatbul(rf("kat_id")) %>
          </div></td>
          <td width="5%"><div align="center">
          <% if rf("goster")=1 then%> <img src="images/true.gif"><%else%><img src="images/false.gif"><%end if%>
          </div></td>
          <td width="20%"><div align="center">
          <a href="?Hkodu=<%= rf("hkodu") %>"><img src="images/detay.jpg" border="0"></a>
          <a href="?sayfa=haber&sil=ok&amp;hkodu=<%= rf("hkodu") %>"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');">
          <img src="images/sil.gif" width="70" height="22" border="0"></a></div></td>
        </tr>
      </table>
	 		 <% 
		      rf.movenext
			next%></td>
			 <tr valign="top">
    <td>  <table width="99%" height="20" align="center" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFDD" style="border:1px solid #dddddd; border-collapse: collapse; margin-top:1px; margin-bottom:1px">
        <tr>
          <td><div align="center">						
						
                         <%for y=1 to sayfa 
							if cint(shf)=cint(y) then %>
						 	<strong>[<%= y %>]</strong>
							<% else %>
				 			 <a href="?sayfa=haber&shf=<%= y %>"><%= y %></a>	
							<% end if
					                  next %>
			  </div></td></tr></table>
	<% end if %>
    </p> </td>
  </tr><%Rf.Close
   end if
   if hkodu<>"" then %>
  <tr valign="top">
    <td><% 
			sorgum="Select * from haber where hkodu="&hkodu
	    	Rs.Open Sorgum, Baglantim, 1, 3  
			if rs.eof or rs.bof then
				Response.Write("Kayit Bulunamadi")
			else
	%>
      <form action="" method="post" name="form1" id="form1">
        <table width="100%" border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td width="308"><div align="right" style="font-weight: bold">Haber Ba&#351;l&#305;k : </div></td>
            <td colspan="2"><div align="left">
                <input name="baslik" type="text" class="footersmin2" id="baslik" value="<%=rs("baslik")%>" size="100" />
            </div>              <div align="left"> </div></td>
          </tr>

          <tr>
            <td valign="top"><div align="right" style="font-weight: bold">K&#305;sa A&ccedil;&#305;klama  : </div></td>
            <td colspan="2"><textarea name="aciklama" cols="100" rows="8" class="footersmin2" id="aciklama"><%=rs("aciklama")%></textarea></td>
          </tr>
          <tr>
            <td><div align="right" style="font-weight: bold">Eklenme Tarihi : </div></td>
            <td colspan="2"><%= rs("ekleme") %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>G&uuml;ncelleme :</b> <%= rs("update") %></td>
          </tr>
          <tr>
            <td valign="top"><div align="right" style="font-weight: bold">Man&#351;et Olsun Mu : </div></td>
            <td colspan="2"><div align="left">
                <select name="konum" id="konum" class="footersmin2">
                  <option value="1">Evet</option>
                  <option value="0">Hay&#305;r</option>
                </select>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>Eklenecek Kategori : </b>&nbsp;&nbsp;
				<select class="footersmin" name="album" id="album">
					<% ru.open "select * from haber_kat",baglantim,1,3 %>
					<% do while not ru.eof
					if ru.eof then exit do%>
					<option value="<%= ru("id") %>" <% if rs("kat_id")=ru("id") then  %>selected="selected" <% end if %>><%= ru("isim") %></option>
					<% ru.movenext
					loop
					ru.close %>
				</select>
				
          </div>
            </div></td>
          </tr>
          <tr>
            <td><div align="right" style="font-weight: bold">Haber G&ouml;ster :</div></td>
            <td width="132"><div align="left">
                <input name="goster" type="checkbox" id="goster" <% if rs("goster")=1 then %>  checked="checked" <% end if %> />
              G&ouml;ster </div></td>
            <td width="728"><div align="left">
              <input name="button" type="button" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" onclick="history.go(-1)" value="  Geri D&ouml;n  " />
              &nbsp;&nbsp;
              <input name="Sil" type="submit" id="Sil" value="Sil"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
              &nbsp;&nbsp;
              <input name="guncelle" type="submit" id="guncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
            </div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr><td colspan="3" height="25" background="images/butonsil.png" style="border-radius:10px"><div align="center"><strong><font color="#FFFFFF">Habere Ait Resimler</font></strong></div></td></tr>
                     <tr> <td colspan="3">
					 <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
              <tr>
			  <%for i=1 to 20
			  if i=1 then 
			     ss=""
			    else
			     ss=i
			  end if%>
                <td align="center" width="10%">
				<%if rs("resim"&ss&"")<>"" then
				  snc = InStr(1,rs("resim"&ss&""), "http://")%>
                 <img  onerror="src = '/ofosoft_img/resimyok.jpg'" src="<%if snc=0 then%>../<%end if%><%=rs("resim"&ss&"")%>" border="0" width="75" height="75" /><br />
                 <a href="<%if snc=0 then%>../<%end if%><%=rs("resim"&ss&"")%>" target="_blank">[ Resmi B&uuml;y&uuml;t ]</a>
                 <%else%>
                  <img src="../images/resimyok.gif" border="0" width="75" height="75" />
                <%end if%><br>
				<input name="Button3" type="button" onClick="yenipencere('/ofosoft_editor/resimyukle.asp?id=<%= rs("hkodu")%>&yer=resim<%=ss%>&klasor=haber','','resizable=yes,status=yes,width=800,height=600')" value="Resim Yükle" />
				</td>
				<%if i=10 then response.write("</tr><tr>")
				next%>	
              </tr>
            </table></td>
          </tr>
                    <tr><td colspan="3" height="25" background="images/butonsil.png" style="border-radius:10px"><div align="center"><strong><font color="#FFFFFF">Haber Detayý</font></strong></div></td></tr>
		  <tr valign="top">
            <td colspan="3">
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
	      </tr>
              <tr>
            <td><div align="right" style="font-weight: bold">Haberi G&ouml;ster :</div></td>
            <td width="132"><div align="left">
                <input name="goster" type="checkbox" id="goster" value="cdsfdfd" <% if rs("goster")=1 then %>  checked="checked" <% end if %> />
              G&ouml;ster </div></td>
            <td width="728"><div align="left">
              <input name="button" type="button" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" onclick="history.go(-1)" value="  Geri D&ouml;n  " />
              &nbsp;&nbsp;
              <input name="Sil" type="submit" id="Sil" value="Sil"  onclick="return confirm('Silmek Istediginizden Emin Misiniz?');" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
              &nbsp;&nbsp;
              <input name="guncelle" type="submit" id="guncelle" value="G&uuml;ncelle" style="width:100px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
            </div></td>
          </tr>
		  
        </table>
      </form>
 <% end if %>
 </td>
  </tr><% end if %>
</table>
