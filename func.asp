<%

Function kayitnobul(il, ilce)
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

Function cevir(yazi)
	yazi=RTRim(yazi)
	yazi=Ltrim(yazi)
	yazi = Replace(yazi, "  ", "_")
	yazi = Replace(yazi, " ", "_")
	yazi = Replace(yazi, "%20", "_")
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
<%
Function cevirascii(yazi)
	yazi=RTRim(yazi)
	yazi=Ltrim(yazi)
	yazi = Replace(yazi, "ý", "i")
	yazi = Replace(yazi, "Ý", "I")
	yazi = Replace(yazi, "ð", "g")
	yazi = Replace(yazi, "þ", "s")
	yazi = Replace(yazi, "Þ", "S")
	yazi = Replace(yazi, "Ð", "G")
 	cevirascii = yazi
End Function%>

<%
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
	s50 = InStr(1,yazi, "order")
	s51 = InStr(1,yazi, "ORDER")
	s52 = InStr(1,yazi, "1=1")
	s53 = InStr(1,yazi, "1=0")
	if s1<>0 or s2<>0 or s3<>0 or s4<>0 or s5<>0 or s6<>0 or s7<>0 or s8<>0 or s9<>0 or s10<>0 then
	 	Response.Redirect("uyari.asp")
	Elseif s11<>0 or s12<>0 or s13<>0 or s14<>0 or s15<>0 or s16<>0 or s17<>0 or s18<>0 or s19<>0 or s20<>0 then
	 	Response.Redirect("uyari.asp")
	Elseif s21<>0 or s22<>0 or s23<>0 or s24<>0 or s25<>0 or s26<>0 or s27<>0 or s28<>0 or s29<>0 or s30<>0 then
	 	Response.Redirect("uyari.asp")
	Elseif s31<>0 or s32<>0 or s33<>0 or s34<>0 or s35<>0 or s36<>0 or s37<>0 or s38<>0 or s39<>0 or s40<>0 then
	 	Response.Redirect("uyari.asp")
	Elseif s40<>0 or s41<>0 or s42<>0 or s43<>0 or s44<>0 or s45<>0 or s46<>0 or s47<>0 or s48<>0 or s49<>0 then
	 	Response.Redirect("uyari.asp")
	Elseif s50<>0 or s51<>0 or s52<>0  or s53<>0 then
	 	Response.Redirect("uyari.asp")
	End if
    PostKontrol = yazi

End Function%>