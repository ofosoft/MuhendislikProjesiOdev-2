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
		        Case "Ad�_Soyad�"	:  rs("adi_soyadi")=Personel(i).childNodes(j).text
		        Case "�ubesi"		:  rs("subesi")=Personel(i).childNodes(j).text
				Case "Pozisyonu"	:  rs("unvani")=Personel(i).childNodes(j).text
				Case "Fiili_G�rev"	:  rs("fiili_gorev")=Personel(i).childNodes(j).text
				Case "Telev"		:  rs("telev")=Personel(i).childNodes(j).text				
				Case "��renimi"		:  rs("ogrenim")=Personel(i).childNodes(j).text				
				Case "Sigorta_Sicil":  rs("emekli_sicil")=Personel(i).childNodes(j).text				
				Case "�nceki_Hizmet":  rs("onceki_hizmet")=Personel(i).childNodes(j).text				
				Case "Kuruma_BT"	:  rs("ise_giris")=Personel(i).childNodes(j).text				
				Case "Hizmet_Y�l�"	:  rs("hizmet_yili")=Personel(i).childNodes(j).text				
				Case "Yevmiye"		:  rs("yevmiye")=Personel(i).childNodes(j).text				
				Case "Okulu"		:  rs("okulu")=Personel(i).childNodes(j).text				
				Case "Kan_Grubu"	:  rs("kan_grubu")=Personel(i).childNodes(j).text				
				Case "Bana_Ad�"		:  rs("baba_adi")=Personel(i).childNodes(j).text				
				Case "Ana_Ad�"		:  rs("ana_adi")=Personel(i).childNodes(j).text				
				Case "Do�um_Y�l�"	:  rs("dogum_yili")=Personel(i).childNodes(j).text				
				Case "SSKbas"		:  rs("sskbas")=Personel(i).childNodes(j).text				
				Case "SSKKasker"	:  rs("sskkasker")=Personel(i).childNodes(j).text				
				Case "SSKth"		:  rs("sskth")=Personel(i).childNodes(j).text				
				Case "SSKKemk"		:  rs("sskemk")=Personel(i).childNodes(j).text				
				Case "Terfi_Tarihi"	:  rs("terfi_tarihi")=Personel(i).childNodes(j).text				
				Case "Foto"			:  rs("foto")=Personel(i).childNodes(j).text				
				Case "Do�um_Yeri"	:  rs("dogum_yeri")=Personel(i).childNodes(j).text								
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
				Case "�ubeKodu"		:  rs("subekodu")=Personel(i).childNodes(j).text				
				Case "Durumu"		:  rs("durum")=Personel(i).childNodes(j).text				
			End Select 
			Next
			rs("eklenme")=date()
			rs("sirano")=40
			response.write (""&i&". Kay�t ��lendi.<br>")
			rs.update
'		Response.Write("<br>"&(i+1)&".Personel ")
'		Response.Write("<br> Ad�_Soyad� : "&Adi_Soyadi& " <br> Sicil_No : "&Sicil_No&"")
'		REsponse.Write("<br>*******************")
	Next
	rs.close
	response.write("Kayitlar Veritaban�na Ba�ar�yla ��lendi")
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
		        Case "Ad�_Soyad�"	:  rs("adi_soyadi")=Personel(i).childNodes(j).text
		        Case "�ubesi"		:  rs("subesi")=Personel(i).childNodes(j).text
				Case "�nvan�"		:  rs("unvani")=Personel(i).childNodes(j).text
				Case "Fiili_G�rev"	:  rs("fiili_gorev")=Personel(i).childNodes(j).text
				Case "B�l�m�"		:  rs("bolumu")=Personel(i).childNodes(j).text				
				Case "��renimi"		:  rs("ogrenim")=Personel(i).childNodes(j).text				
				Case "Emekli_Sicil"	:  rs("emekli_sicil")=Personel(i).childNodes(j).text				
				Case "�nceki_Hizmet":  rs("onceki_hizmet")=Personel(i).childNodes(j).text				
				Case "Kuruma_BT"	:  rs("ise_giris")=Personel(i).childNodes(j).text				
				Case "Hizmet_Y�l�"	:  rs("hizmet_yili")=Personel(i).childNodes(j).text				
				Case "Okulu"		:  rs("okulu")=Personel(i).childNodes(j).text				
				Case "Kan_Grubu"	:  rs("kan_grubu")=Personel(i).childNodes(j).text				
				Case "Bana_Ad�"		:  rs("baba_adi")=Personel(i).childNodes(j).text				
				Case "Ana_Ad�"		:  rs("ana_adi")=Personel(i).childNodes(j).text				
				Case "Do�um_Y�l�"	:  rs("dogum_yili")=Personel(i).childNodes(j).text				
				Case "Maa�_Kadro"	:  rs("maas_kadro")=Personel(i).childNodes(j).text				
				Case "Emekli_Kadro"	:  rs("emekli_kadro")=Personel(i).childNodes(j).text				
				Case "Terfi_Tarihi"	:  rs("terfi_tarihi")=Personel(i).childNodes(j).text				
				Case "Foto"			:  rs("foto")=Personel(i).childNodes(j).text				
				Case "Do�um_Yeri"	:  rs("dogum_yeri")=Personel(i).childNodes(j).text								
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
				Case "�ubeKodu"		:  rs("subekodu")=Personel(i).childNodes(j).text				
				Case "Durumu"		:  rs("durum")=Personel(i).childNodes(j).text				
			End Select 
			Next
			rs("eklenme")=date()
			response.write (""&i&". Kay�t ��lendi.<br>")
			rs.update
'		Response.Write("<br>"&(i+1)&".Personel ")
'		Response.Write("<br> Ad�_Soyad� : "&Adi_Soyadi& " <br> Sicil_No : "&Sicil_No&"")
'		REsponse.Write("<br>*******************")
	Next
	rs.close
	response.write("Kayitlar Veritaban�na Ba�ar�yla ��lendi")
 Else
	Response.Write(objXML.parseError.errorCode)
 End If
end if
 %>		 