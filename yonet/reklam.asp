<!--#include file="sifre.asp"-->
<%if Request.QueryString("islem")="kodkaydet" then
   if Request.QueryString("id")<>"" then
   	id=request.QueryString("id")
	 sorgum="select * from reklam where id="&id
	 Rx.Open Sorgum, Baglantim, 1, 3
	 rx("detay")=Request.Form("editor1")
	' rx("baslama")=Request.Form("basg")&"."&Request.Form("basa")&"."&Request.Form("basy")
 	 'rx("bitis")=Request.Form("bitg")&"."&Request.Form("bita")&"."&Request.Form("bity")
	 rx("sayfa")=Request.Form("adi")
	 'if Request.Form("goster")<>"" then
	 ' rx("goster")=1
	 'else
	 ' rx("goster")=0
	 'end if  
	 rx.update
	 rx.close
	 hata "Kod Basariyla Kaydedildi...",16
	 Response.Redirect("giris.asp")
   end if
   end if%>
<table width="100%" border="0">
    <tr>
    <td valign="top">
	<table width="100%" border="0" align="center" cellpadding="2" cellspacing="2"> <tr>
      <%
	  sorgum="select * from reklam order by sayfa asc"
	  Rs.Open Sorgum, Baglantim, 1, 3 
	  x=0
	  do while not rs.eof
	  if rs.eof then exit do
	  x=x+1
 	  ' bittarihi=cdate(rs("bitis"))
	  ' if bittarihi>date() then
	  '  rs("goster")=1
	  ' else
	  '  rs("goster")=0
	  ' end if	
	   rs.update
	  %>

        <td width="20%" height="25" align="center"><div align="left">
		<a href="?tablo=reklam&amp;id=<%=rs("id")%>"><img src="images/vurgu.gif" border="0">&nbsp;<%=rs("sayfa")%>&nbsp;&nbsp;</a></div></td>
     
	<%rs.movenext
	 if x>4 then%>
	</tr><tr>  
<%	x=0
	end if
	Loop
	rs.close%> </tr>
    </table>   	  </td>
    </tr>
    <tr>
      <td valign="top">
	   <% tablo=Request.QueryString("tablo")
	id=Request.QueryString("id") 
	%>	
        <% if tablo<>"" and id<>"" then
        
		id=PostKontrol(id)
		sorgum="Select * from reklam where id="&id
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof then
 		 response.write("<br>Reklam Bulunamadý.")
		else
		%>
        <form id="form1" name="form1" method="post" action="?islem=kodkaydet&id=<%=id%>&tablo=reklam">
 <table width="100%" border="0" cellpadding="0" cellspacing="0">
          		<tr>
        <td height="25" background="images/butonsil.png"><div align="center"><strong><font color="#FFFFFF"><em><%=rx("sayfa")%></em> Ayarlarý</font></strong></div></td>
        </tr>
        <tr>
        <td height="25"><table width="100%" border="0" cellpadding="3" cellspacing="3">
          <tr>
            <td width="20%"><span style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10; font-weight: bold">Banner Ad&#305; </span></td>
            <td width="1%"><span style="font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10; font-weight: bold">:</span></td>
            <td width="26%"><div align="left"><span style="font-size: 10">
                <input name="adi" type="text" id="adi" style="width:300px; font-size:12px;font-weight:normal;color:#336666;text-decoration:none text-transform: uppercase" value="<%=rx("sayfa")%>" />
            </span></div></td>
            <td width="9%"></td>
            <td width="1%"></td>
            <td width="43%"></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
            <td><input type="submit" name="Kaydet" id="Kaydet" value="Ayarlarý Kaydet" /></td>
            <td colspan="3"></td>
            </tr>
         <tr><td colspan="6" height="25" background="images/butonsil.png"><div align="center"><strong><font color="#FFFFFF">BANNER DETAY ALANI</font></strong></div></td></tr>
		  <tr valign="top">
            <td colspan="6">
            <textarea id="office2003" name="editor1" rows="50" cols="80"><%= rx("detay") %></textarea>
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
            <td colspan="6"><div align="center"><span style="font-weight: bold">BANNER AÇIKLAMASI :</span><br />
              <%if id=21 then%>
              Bu banner için sadece gidilecek site adresi girmelisiniz. <br />
              <span style="font-weight: bold">Örnegin : </span>www.siteadi.com
              <%else%>
              Bannerin Bitiþ Tarihi Geçmiþ ise otomatik olarak yayýndan kaldýrýlacaktýr. Ayarlarý eksiksiz ve doðru yapmalýsýnýz.
              <%end if%>
            </div></td>
          </tr>
        </table></td>
        </tr>
           </table>
        </form>
		<%
		end if
		Rx.close
	  else%>
	   <table width="100%" border="0" cellpadding="3" cellspacing="3">
         <tr>
           <td colspan="6" height="25" background="images/butonsil.png"><div align="center" class="Menu"><font color="#FFFFFF"><strong>BANNER SAYFASI AYRINTILARI</strong></font></div></td>
         </tr>
         <tr>
           <td width="4%"><div align="left" style="font-weight: bold">
             <div align="center">Ýþlem</div>
           </div></td>
           <td width="34%"><div align="left" style="font-weight: bold">Banner Alaný</div></td>
           <td width="21%"><div align="center" style="font-weight: bold">Baþlama Tarihi </div></td>
           <td width="21%"><div align="center" style="font-weight: bold">Bitiþ Tarihi </div></td>
           <td colspan="16%"><div align="center" style="font-weight: bold">Durum</div></td>
         </tr>
         <%
	  sorgum="select * from reklam order by sayfa asc"
	  Rs.Open Sorgum, Baglantim, 1, 3 
	  x=0
	  do while not rs.eof
	  if rs.eof then exit do
	  %>
		 <tr onmouseover="this.style.backgroundColor='#FFFFE1';" 
    onMouseOut="this.style.backgroundColor='#FFFFFF';" >
           <td><div align="center"><a href="?tablo=reklam&amp;id=<%=rs("id")%>"><img src="images/detay.jpg" border="0"></a></div></td>
           <td><div align="left"><%=rs("sayfa")%></div></td>
           <td><div align="center"><%=rs("baslama")%></div></td>
           <td><div align="center"><%=rs("bitis")%></div></td>
           <td width="4%"><div align="right">
               <%if rs("goster")=1 then%> 
               <img src="images/true.gif">

               <%else%>
               <img src="images/false.gif">
               <%end if%>
           </div></td>
           <td width="16%"><div align="left">
               <%if rs("goster")=1 then%> 
				Açýk. Görünüyor.
               <%else%>
               Kapalý. Süresi Bitmiþ.
               <%end if%>
           </div></td>
         </tr>
		<%rs.movenext
		loop
		rs.close%> 
       </table>
	  <% end if %>	  </td>
    </tr>
</table>
