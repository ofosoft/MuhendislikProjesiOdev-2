<SCRIPT language=JavaScript>
function yenipencere(page,en,boy)
{
window.open(page ,"","scrollbars=need,status=yes,toolbar=no,width="+en+",height="+boy)
}
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
function dm() 
{ 	var Number=event.keyCode;
	
	if(((Number==9)||(Number==8)||(Number==46))||((Number>95&&Number<106)||(Number>47&&Number<58))) 
	{event.returnValue=true;}
	else {event.returnValue=false;}}
</SCRIPT>

<%
Function CompactDatabase(byval FilePath)  
          Set Engine = Server.CreateObject("JRO.JetEngine" )  
          conner = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source="   
          Engine.CompactDatabase FilePath, FilePath  
          Set Engine = Nothing  
End Function


Function cevir(yazi)
	yazi=RTRim(yazi)
	yazi=Ltrim(yazi)
	yazi = Replace(yazi, "  ", " ")
	yazi = Replace(yazi, " ", "_")
	yazi = Replace(yazi, "’", "_")
	yazi = Replace(yazi, "ý", "i")
	yazi = Replace(yazi, "Ý", "I")
	yazi = Replace(yazi, "ö", "o")
	yazi = Replace(yazi, "ü", "u")
	yazi = Replace(yazi, "ð", "g")
	yazi = Replace(yazi, "þ", "s")
	yazi = Replace(yazi, "ç", "c")
	yazi = Replace(yazi, "Ö", "O")
	yazi = Replace(yazi, "Ü", "U")
	yazi = Replace(yazi, "Þ", "S")
	yazi = Replace(yazi, "Ð", "G")
	yazi = Replace(yazi, "Ç", "C")
	yazi = Replace(yazi, "&", "-")
	yazi = Replace(yazi, "%", "-")
	yazi = Replace(yazi, "/", "-")
	yazi = Replace(yazi, "-", "_")
	yazi = Replace(yazi, "__", "_")
	yazi = Replace(yazi, "__", "_")
 	cevir = yazi
End Function%>

<% Function hata(text,sayi)%>
	   <script language="VBScript">
	MsgBox "<%= text %>",<%= sayi %>,"Rehber Yönetimi"
	</script>   
<% End Function  %>  

<%	Function kayitnobul(il, ilce)
	if il=0 or ilce="" or il="" or ilce=0 then
		kayitnobul=1
	else
    	sorgum="Select * from arsiv where ilkod="&il&" and ilcekod="&ilce
		erz.Open sorgum, emlak, 1, 3 
		if erz.eof then
			kayitnobul=1
		 else
			kayitnobul=erz.recordcount
		end if
		erz.close
	end if
	End Function
	
	Function emlakprojebul(kati)
	if kati=0 or kati="" then
		emlakprojebul="Proje Yok"
	else
    	sorgum="Select * from projeler where id="&kati
		erz.Open sorgum, emlak, 1, 3 
		if erz.eof then
			emlakprojebul="Proje Yok"
		 else
			emlakprojebul=erz("projead")
		end if
		erz.close
	end if
	End Function
	
Function haberkatbul(kati)
	if kati=0 or kati="" then
	 response.write("Kategori Seçilmemiþ.")
	else
    	sorgum="Select * from haber_kat where id="&kati
		Ra.Open Sorgum, Baglantim, 1, 3 
		if ra.eof then
			haberkatbul="Kategori Yok"
		 else
			haberkatbul=ra("isim")
		end if
		ra.close
        end if
	End Function 

Function videokatbul(kati)
	if kati=0 or kati="" then
	 response.write("Kategori Seçilmemiþ.")
	else
    	sorgum="Select * from video_kat where id="&kati
		Ra.Open Sorgum, Baglantim, 1, 3 
		if ra.eof then
		  Response.Write("Kategori Bulunamadý")
		 else
		Response.Write ra("isim")
		end if
		ra.close
        end if
	End Function 

Function PostKontrol(yazi)
	s1 = InStr(1,yazi, "<")
	s2 = InStr(1,yazi, ">")
	s3 = InStr(1,yazi, "+")
	s4 = InStr(1,yazi, "(")
	s5 = InStr(1,yazi, ")")
	s6 = InStr(1,yazi, ";")
	s7 = InStr(1,yazi, ":")
	s8 = InStr(1,yazi, "'")
	s9 = InStr(1,yazi, "SELECT")
	s10 = InStr(1,yazi, ",")
	s11 = InStr(1,yazi, "script")
	s12 = InStr(1,yazi, "SCRIPT")
	s13 = InStr(1,yazi, "Script")
	s14 = InStr(1,yazi, "script")
	s15 = InStr(1,yazi, "object")
	s16 = InStr(1,yazi, "OBJECT")
	s17 = InStr(1,yazi, "Object")
	s18 = InStr(1,yazi, "object")
	s19 = InStr(1,yazi, "applet")
	s20 = InStr(1,yazi, "APPLET")
	s21 = InStr(1,yazi, "Applet")
	s22 = InStr(1,yazi, "applet")
	s23 = InStr(1,yazi, "embed")
	s24 = InStr(1,yazi, "EMBED")
	s25 = InStr(1,yazi, "Embed")
	s26 = InStr(1,yazi, "embed")
	s27 = InStr(1,yazi, "event")
	s28 = InStr(1,yazi, "EVENT")
	s29 = InStr(1,yazi, "Event")
	s30 = InStr(1,yazi, "event")
	s31 = InStr(1,yazi, "document")
	s32 = InStr(1,yazi, "DOCUMENT")
	s33 = InStr(1,yazi, "Document")
	s34 = InStr(1,yazi, "document")
	s35 = InStr(1,yazi, "cookie")
	s36 = InStr(1,yazi, "COOKIE")
	s37 = InStr(1,yazi, "Cookie")
	s38 = InStr(1,yazi, "cookie")
	s39 = InStr(1,yazi, "form")
	s40 = InStr(1,yazi, "FORM")
	s41 = InStr(1,yazi, "Form")
	s42 = InStr(1,yazi, "form")
	s43 = InStr(1,yazi, "document.cookie")
	s44 = InStr(1,yazi, "javascript:")
	s45 = InStr(1,yazi, "vbscript:")
	s46 = InStr(1,yazi, "union")
	s47 = InStr(1,yazi, "select")
	s48 = InStr(1,yazi, "from")
	s49 = InStr(1,yazi, "UNION")

	if s1<>0 or s2<>0 or s3<>0 or s4<>0 or s5<>0 or s6<>0 or s7<>0 or s8<>0 or s9<>0 or s10<>0 then
	 	Response.Redirect("../uyari.asp")
	Elseif s11<>0 or s12<>0 or s13<>0 or s14<>0 or s15<>0 or s16<>0 or s17<>0 or s18<>0 or s19<>0 or s20<>0 then
	 	Response.Redirect("../uyari.asp")
	Elseif s21<>0 or s22<>0 or s23<>0 or s24<>0 or s25<>0 or s26<>0 or s27<>0 or s28<>0 or s29<>0 or s30<>0 then
	 	Response.Redirect("../uyari.asp")
	Elseif s31<>0 or s32<>0 or s33<>0 or s34<>0 or s35<>0 or s36<>0 or s37<>0 or s38<>0 or s39<>0 or s40<>0 then
	 	Response.Redirect("../uyari.asp")
	Elseif s40<>0 or s41<>0 or s42<>0 or s43<>0 or s44<>0 or s45<>0 or s46<>0 or s47<>0 or s48<>0 or s49<>0 then
	 	Response.Redirect("../uyari.asp")
	End if
    PostKontrol = yazi

End Function%>

<%	Function kategoribul(kid)
		if kid<>"" then
		sorgum="Select * from urun_kat where id="&kid
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof then
 		 response.write("Kategori Bulunamadý.")
		else
		Response.Write rx("isim")
		end if
		Rx.close
		end if
	End Function %>

<%	Function altkategoribul(kid)
		if kid<>"" then
		sorgum="Select * from urun_altkat where id="&kid
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof then
 		 response.write("Kategori Bulunamadý.")
		else
		Response.Write rx("isim")
		end if
		Rx.close
		end if
	End Function %>

<%	Function altaltkategoribul(kid)
		if kid<>"" then
		sorgum="Select * from urun_altkat2 where id="&kid
		Rx.Open Sorgum, Baglantim, 1, 3 
		if rx.eof then
 		 response.write("Kategori Bulunamadý.")
		else
		Response.Write rx("isim")
		end if
		Rx.close
		end if
	End Function %>
<% function menu_listesi() %>
	   <table width="100%" border="0" cellpadding="0" cellspacing="10">
      <% 
			sorgum="Select * from sektor order by adi asc"
	    	Rs.Open Sorgum, Baglantim, 1, 3  
			if rs.eof or rs.bof then
				Response.Write("Kayit Bulunamadi")
			else
				do while not rs.eof	%>
      <tr>
        <td><a <% if rs("goster")=true then %>  href=""<% end if %> ><%= rs("adi") %>
              <% if rs("goster")=false then %>
          [ gizli ]
          <% end if %>
          </a>
            <% if rs("skodu")=cint(skodu) then %>
            <%  sorgum1="Select * from altsektor where skodu="&skodu&" and goster=true"
					Ra.Open Sorgum1, Baglantim, 1, 3  
						if ra.eof or ra.bof then
							Response.Write("Kayit Bulunamadi")
						else
							do while not ra.eof %>
							<table width="100%" border="0">
							  <tr>
								<td width="73"><img src="images/arrow.gif" alt="Menü Listele" width="21" height="6" /></td>
								<td width="200%"><a  href=""><%= ra("adi") %></a>
							  </td>
							  </tr>
							  <tr> </tr>
							</table>
					  <% ra.movenext
						   loop 
						   ra.close
					   %>
            <% end if %>
            <% end if %>
        </td>
      </tr>
      <% 	rs.movenext
				loop
			rs.close
			end if %>
    </table>
<% end function %>



<% Function hesapla_sektor(sektor)
	    tablo="firma"
		Set Rx=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from "&tablo&" where Skodu='"&sektor &"'"&" and onay=true" 
		Rx.Open Sorgum, Baglantim, 1, 3 
		Response.Write rx.recordcount
   End Function 
	
   Function hesapla_altsektor(altsektor)
	    tablo="firma"
		Set Rx=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from "&tablo&" where altsektor like '%"&altsektor &"%'"&" and onay=true" 
		Rx.Open Sorgum, Baglantim, 1, 3 
		Response.Write rx.recordcount
   End Function 
		
   Function hesapla_talep(sektor)
	    Set Rs=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from talepler where Skodu="&sektor  
		Rs.Open Sorgum, Baglantim, 1, 3 
		Response.Write rs.recordcount
   End Function 
	
   Function hesapla_urun(sektor)
	    Set Rs=Server.CreateObject("Adodb.Recordset")
		if sektor<100 then 
			sorgum="Select * from urun where Skodu="&sektor  
		else 
			sorgum="Select * from urun where kodu="&sektor  
		end if
		Rs.Open Sorgum, Baglantim, 1, 3 
		Response.Write rs.recordcount
   End Function
	
   Function hesapla_talep_alt(kodu)
		tablo="talepler"
		Set Rs=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from "&tablo&" where Altsektor="&kodu  
		Rs.Open Sorgum, Baglantim, 1, 3 
		Response.Write rs.recordcount
   End Function 
  
  Function ayadibul(aid)
		if aid=1 then
			ayadibul="Ocak"
		elseif aid=2 then
			ayadibul="Subat"
		elseif aid=3 then
			ayadibul="Mart"
		elseif aid=4 then
			ayadibul="Nisan"
		elseif aid=5 then
			ayadibul="Mayis"
		elseif aid=6 then
			ayadibul="Haziran"
		elseif aid=7 then
			ayadibul="Temmuz"
		elseif aid=8 then
			ayadibul="Agustos"
		elseif aid=9 then
			ayadibul="Eylul"			
		elseif aid=10 then
			ayadibul="Ekim"
		elseif aid=11 then
			ayadibul="Kasim"			
			else
			ayadibul="Aralik"
		end if		
	End Function
  
  
Function urunbul(sektor)
    	sorgum="Select * from urun where id="&sektor 
		Ra.Open Sorgum, Baglantim, 1, 3 
		if ra.eof or ra.bof then
		urunbul="Ürün Silinmiþ."
		else
		urunbul=ra("adi")
		end if
		ra.close
	End Function 
	
	Function altsektorbul(altsektor)
		sorgum="Select * from altsektor where kodu='"&altsektor&"'" 
		Ra.Open Sorgum, Baglantim, 1, 3 
		Response.Write ra("Adi")
		ra.close
	End Function 
		
	Function firma_toplami()
	    Set Rs=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from firma "  
		Rs.Open Sorgum, Baglantim, 1, 3 
		Response.Write rs.recordcount
	End Function 
	
	Function urun_toplami(sektor)
	     	Set Rs=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from urun "  
		Rs.Open Sorgum, Baglantim, 1, 3 
		Response.Write rs.recordcount
	End Function 
	
	Function talep_toplami(sektor)
		Set Rs=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from talep "  
		Rs.Open Sorgum, Baglantim, 1, 3 
		Response.Write rs.recordcount
	End Function 
	
	Function say(cookle)
		Set Rs=Server.CreateObject("Adodb.Recordset")
		sorgum="Select * from sayac "  
		Rs.Open Sorgum, Baglantim, 1, 3 
		if cookle<>"ekle" then
 							x=rs("cogul")
							x=x+1
							rs("cogul")=x
							rs.update
							Response.Write rs("cogul")
						end if
	End Function 

%>

<% Function tema_sec()%>
<select name="tema" id="tema" style="width:100px; font-size:11px;font-weight:normal;color:#336666;text-decoration:none">
          <% 
			sorgum="Select  * from temalar order by tema_adi ASC"
			Rf.Open Sorgum, Baglantim, 1, 3 	 
			do while not rf.eof%>
		         <option value="<%=rf("tema_adi")%>"><%= rf("tema_adi") %></option>
            <%
			 rf.movenext
			 loop
			%>
       </select>
       <%Rf.Close%>
<% End Function  %>

<%
Function bcevir(metin)
	metin = Replace(metin, "a", "A")
	metin = Replace(metin, "b", "B")
	metin = Replace(metin, "c", "C")
	metin = Replace(metin, "ç", "Ç")
	metin = Replace(metin, "d", "D")
	metin = Replace(metin, "e", "E")
	metin = Replace(metin, "f", "F")
	metin = Replace(metin, "g", "G")
	metin = Replace(metin, "ð", "Ð")
	metin = Replace(metin, "h", "H")
	metin = Replace(metin, "ý", "I")
	metin = Replace(metin, "i", "Ý")
	metin = Replace(metin, "j", "K")
	metin = Replace(metin, "k", "K")
	metin = Replace(metin, "l", "L")
	metin = Replace(metin, "m", "M")
	metin = Replace(metin, "n", "N")
	metin = Replace(metin, "o", "O")
	metin = Replace(metin, "ö", "Ö")
	metin = Replace(metin, "p", "P")
	metin = Replace(metin, "r", "R")
	metin = Replace(metin, "s", "S")
	metin = Replace(metin, "þ", "Þ")
	metin = Replace(metin, "t", "T")
	metin = Replace(metin, "u", "U")
	metin = Replace(metin, "ü", "Ü")
	metin = Replace(metin, "v", "V")
	metin = Replace(metin, "w", "W")
	metin = Replace(metin, "x", "X")
	metin = Replace(metin, "y", "Y")
	metin = Replace(metin, "z", "Z")
 	bcevir = metin
End Function

Function kcevir(kelime)
	kelime = Replace(kelime, "A", "a")
	kelime = Replace(kelime, "B", "b")
	kelime = Replace(kelime, "C", "c")
	kelime = Replace(kelime, "Ç", "ç")
	kelime = Replace(kelime, "D", "d")
	kelime = Replace(kelime, "E", "e")
	kelime = Replace(kelime, "F", "f")
	kelime = Replace(kelime, "G", "g")
	kelime = Replace(kelime, "Ð", "ð")
	kelime = Replace(kelime, "H", "h")
	kelime = Replace(kelime, "I", "ý")
	kelime = Replace(kelime, "Ý", "i")
	kelime = Replace(kelime, "J", "j")
	kelime = Replace(kelime, "K", "k")
	kelime = Replace(kelime, "L", "l")
	kelime = Replace(kelime, "M", "m")
	kelime = Replace(kelime, "N", "n")
	kelime = Replace(kelime, "O", "o")
	kelime = Replace(kelime, "Ö", "ö")
	kelime = Replace(kelime, "P", "p")
	kelime = Replace(kelime, "R", "r")
	kelime = Replace(kelime, "S", "s")
	kelime = Replace(kelime, "Þ", "þ")
	kelime = Replace(kelime, "T", "t")
	kelime = Replace(kelime, "U", "u")
	kelime = Replace(kelime, "Ü", "ü")
	kelime = Replace(kelime, "V", "v")
	kelime = Replace(kelime, "W", "w")
	kelime = Replace(kelime, "X", "x")
	kelime = Replace(kelime, "Y", "y")
	kelime = Replace(kelime, "Z", "z")
 	Kcevir = kelime
End Function%>
