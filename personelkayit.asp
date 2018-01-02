<!--#include file="bag.asp"-->
<%
 Set XML=Server.CreateObject("Microsoft.XMLDOM")
 Set Personel=Server.CreateObject("Microsoft.XMLDOM")
 XML.async=False
 XML.Load (Server.MapPath("XML/Isci.xml"))
 If XML.parseError.errorCode = 0 Then 
	 Set Personel=XML.getElementsByTagName("insan")
	 rs.open "select * from personel_isci",baglantim,1,3
	 For i=0 to (Personel.Length-1)
	 rs.addnew
		For j=0 To (Personel(i).childNodes.Length-1)
	       Select Case Personel(i).childNodes(j).nodeName
		        Case "Sicil_No"		:  rs("sicil_no")=Personel(i).childNodes(j).text
		        Case "Adý_Soyadý"	:  rs("adi_soyadi")=Personel(i).childNodes(j).text
		        Case "Þubesi"		:  rs("subesi")=Personel(i).childNodes(j).text
				Case "Pozisyonu"	:  rs("unvani")=Personel(i).childNodes(j).text
				Case "Fiili_Görev"	:  rs("fiili_gorev")=Personel(i).childNodes(j).text
				Case "Telev"		:  rs("telev")=Personel(i).childNodes(j).text				
				Case "Öðrenimi"		:  rs("ogrenim")=Personel(i).childNodes(j).text				
				Case "Sigorta_Sicil":  rs("emekli_sicil")=Personel(i).childNodes(j).text				
				Case "Önceki_Hizmet":  rs("onceki_hizmet")=Personel(i).childNodes(j).text				
				Case "Kuruma_BT"	:  rs("ise_giris")=Personel(i).childNodes(j).text				
				Case "Hizmet_Yýlý"	:  rs("hizmet_yili")=Personel(i).childNodes(j).text				
				Case "Yevmiye"		:  rs("yevmiye")=Personel(i).childNodes(j).text				
				Case "Okulu"		:  rs("okulu")=Personel(i).childNodes(j).text				
				Case "Kan_Grubu"	:  rs("kan_grubu")=Personel(i).childNodes(j).text				
				Case "Bana_Adý"		:  rs("baba_adi")=Personel(i).childNodes(j).text				
				Case "Ana_Adý"		:  rs("ana_adi")=Personel(i).childNodes(j).text				
				Case "Doðum_Yýlý"	:  rs("dogum_yili")=Personel(i).childNodes(j).text				
				Case "SSKbas"		:  rs("sskbas")=Personel(i).childNodes(j).text				
				Case "SSKKasker"	:  rs("sskkasker")=Personel(i).childNodes(j).text				
				Case "SSKth"		:  rs("sskth")=Personel(i).childNodes(j).text				
				Case "SSKKemk"		:  rs("sskemk")=Personel(i).childNodes(j).text				
				Case "Terfi_Tarihi"	:  rs("terfi_tarihi")=Personel(i).childNodes(j).text				
				Case "Foto"			:  rs("foto")=Personel(i).childNodes(j).text				
				Case "Doðum_Yeri"	:  rs("dogum_yeri")=Personel(i).childNodes(j).text								
				Case "TC_Kimlik"	:  rs("tc_kimlik")=Personel(i).childNodes(j).text				
				Case "Bakmakla1"	:  rs("bakmakla1")=Personel(i).childNodes(j).text				
				Case "Bakmakla2"	:  rs("bakmakla2")=Personel(i).childNodes(j).text				
				Case "Bakmakla3"	:  rs("bakmakla3")=Personel(i).childNodes(j).text				
				Case "Bakmakla4"	:  rs("bakmakla4")=Personel(i).childNodes(j).text				
				Case "Bakmakla5"	:  rs("bakmakla5")=Personel(i).childNodes(j).text				
				Case "Adres"		:  rs("adres")=Personel(i).childNodes(j).text				
				Case "Cins"			:  rs("cins")=Personel(i).childNodes(j).text				
				Case "Dahili"		:  rs("dahili")=Personel(i).childNodes(j).text				
				Case "Lojtel"		:  rs("lojtel")=Personel(i).childNodes(j).text				
				Case "Vergino"		:  rs("vergino")=Personel(i).childNodes(j).text				
				Case "Ekgos"		:  rs("ekgosterge")=Personel(i).childNodes(j).text				
				Case "Ceptel"		:  rs("ceptel")=Personel(i).childNodes(j).text				
				Case "ÞubeKodu"		:  rs("subekodu")=Personel(i).childNodes(j).text				
				Case "Durumu"		:  rs("durum")=Personel(i).childNodes(j).text				
			End Select 
			Next
			rs("eklenme")=date()
			rs("sirano")=40
			response.write (""&i&". Kayýt Ýþlendi.<br>")
			rs.update
'		Response.Write("<br>"&(i+1)&".Personel ")
'		Response.Write("<br> Adý_Soyadý : "&Adi_Soyadi& " <br> Sicil_No : "&Sicil_No&"")
'		REsponse.Write("<br>*******************")
	Next
	rs.close
	response.write("Kayitlar Veritabanýna Baþarýyla Ýþlendi")
 Else
	Response.Write(objXML.parseError.errorCode)
 End If










































if 1>2 then
 Set XML=Server.CreateObject("Microsoft.XMLDOM")
 Set Personel=Server.CreateObject("Microsoft.XMLDOM")
 XML.async=False
 XML.Load (Server.MapPath("XML/MemurXml.xml"))
 If XML.parseError.errorCode = 0 Then 
	 Set Personel=XML.getElementsByTagName("insan")
	 rs.open "select * from personel_memur",baglantim,1,3
	 For i=0 to (Personel.Length-1)
	 rs.addnew
		For j=0 To (Personel(i).childNodes.Length-1)
	       Select Case Personel(i).childNodes(j).nodeName
		        Case "Sicil_No"		:  rs("sicil_no")=Personel(i).childNodes(j).text
		        Case "Adý_Soyadý"	:  rs("adi_soyadi")=Personel(i).childNodes(j).text
		        Case "Þubesi"		:  rs("subesi")=Personel(i).childNodes(j).text
				Case "Ünvaný"		:  rs("unvani")=Personel(i).childNodes(j).text
				Case "Fiili_Görev"	:  rs("fiili_gorev")=Personel(i).childNodes(j).text
				Case "Bölümü"		:  rs("bolumu")=Personel(i).childNodes(j).text				
				Case "Öðrenimi"		:  rs("ogrenim")=Personel(i).childNodes(j).text				
				Case "Emekli_Sicil"	:  rs("emekli_sicil")=Personel(i).childNodes(j).text				
				Case "Önceki_Hizmet":  rs("onceki_hizmet")=Personel(i).childNodes(j).text				
				Case "Kuruma_BT"	:  rs("ise_giris")=Personel(i).childNodes(j).text				
				Case "Hizmet_Yýlý"	:  rs("hizmet_yili")=Personel(i).childNodes(j).text				
				Case "Okulu"		:  rs("okulu")=Personel(i).childNodes(j).text				
				Case "Kan_Grubu"	:  rs("kan_grubu")=Personel(i).childNodes(j).text				
				Case "Bana_Adý"		:  rs("baba_adi")=Personel(i).childNodes(j).text				
				Case "Ana_Adý"		:  rs("ana_adi")=Personel(i).childNodes(j).text				
				Case "Doðum_Yýlý"	:  rs("dogum_yili")=Personel(i).childNodes(j).text				
				Case "Maaþ_Kadro"	:  rs("maas_kadro")=Personel(i).childNodes(j).text				
				Case "Emekli_Kadro"	:  rs("emekli_kadro")=Personel(i).childNodes(j).text				
				Case "Terfi_Tarihi"	:  rs("terfi_tarihi")=Personel(i).childNodes(j).text				
				Case "Foto"			:  rs("foto")=Personel(i).childNodes(j).text				
				Case "Doðum_Yeri"	:  rs("dogum_yeri")=Personel(i).childNodes(j).text								
				Case "TC_Kimlik"	:  rs("tc_kimlik")=Personel(i).childNodes(j).text				
				Case "Bakmakla1"	:  rs("bakmakla1")=Personel(i).childNodes(j).text				
				Case "Bakmakla2"	:  rs("bakmakla2")=Personel(i).childNodes(j).text				
				Case "Bakmakla3"	:  rs("bakmakla3")=Personel(i).childNodes(j).text				
				Case "Bakmakla4"	:  rs("bakmakla4")=Personel(i).childNodes(j).text				
				Case "Bakmakla5"	:  rs("bakmakla5")=Personel(i).childNodes(j).text				
				Case "Adres"		:  rs("adres")=Personel(i).childNodes(j).text				
				Case "Dahili"		:  rs("dahili")=Personel(i).childNodes(j).text				
				Case "Lojtel"		:  rs("lojtel")=Personel(i).childNodes(j).text				
				Case "Vergino"		:  rs("vergino")=Personel(i).childNodes(j).text				
				Case "Ekgos"		:  rs("ekgosterge")=Personel(i).childNodes(j).text				
				Case "Ceptel"		:  rs("ceptel")=Personel(i).childNodes(j).text				
				Case "ÞubeKodu"		:  rs("subekodu")=Personel(i).childNodes(j).text				
				Case "Durumu"		:  rs("durum")=Personel(i).childNodes(j).text				
			End Select 
			Next
			rs("eklenme")=date()
			response.write (""&i&". Kayýt Ýþlendi.<br>")
			rs.update
'		Response.Write("<br>"&(i+1)&".Personel ")
'		Response.Write("<br> Adý_Soyadý : "&Adi_Soyadi& " <br> Sicil_No : "&Sicil_No&"")
'		REsponse.Write("<br>*******************")
	Next
	rs.close
	response.write("Kayitlar Veritabanýna Baþarýyla Ýþlendi")
 Else
	Response.Write(objXML.parseError.errorCode)
 End If
end if
 %>		 