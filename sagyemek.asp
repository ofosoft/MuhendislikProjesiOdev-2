<script language="javascript">
function invalid(frm) {
if (document.rezervasyon.iptalkodu.value!="") {
	var valid = "0123456789"
	var ok = "yes";
	var temp;
	for (var i=0; i<frm.iptalkodu.value.length; i++) {
	temp = "" + frm.iptalkodu.value.substring(i, i+1);
	if (valid.indexOf(temp) == "-1") ok = "no";}
	if (ok == "no") {
	alert("Ýptal Kodu Sadece Rakamlardan Oluþabilir.");
	frm.iptalkodu.focus();
	return false; } }
if (document.rezervasyon.iptalkodu.value.length < 4){
alert("Yazdýðýnýz Ýptal Kodu 4 rakamdan eksik olamaz.");
frm.iptalkodu.focus()
return false;
}	
return true;
}
</script>

<%	
'response.write(ikip)
   sorgum="Select * from yemek where id="&day(now())
	   set rf=Baglantim.Execute(Sorgum)
		if not rf.eof then
			do while not rf.eof%><div align="center"><b><%=date%></b></div>
				<%if rf("yemek1")<>"" then%><div class="kucukmetin">» <%=rf("yemek1")%></div><%end if%>
				<%if rf("yemek2")<>"" then%><div class="kucukmetin">» <%=rf("yemek2")%></div><%end if%>
				<%if rf("yemek3")<>"" then%><div class="kucukmetin">» <%=rf("yemek3")%></div><%end if%>
				<%if rf("yemek4")<>"" then%><div class="kucukmetin">» <%=rf("yemek4")%></div><%end if%>
				<%if rf("aciklama")<>"" then%><div class="kucukmetinn">» <%=rf("aciklama")%></div><%end if%>
    		<%rf.movenext
			loop		
		 end if %>
		 <div align="center"><b><a href="yemeklistesi.asp">:::...Tüm Günleri Göster...:::</a></b>
		 <%if rezervasyon="acik" then%>
		 <br><a href="#" onClick="yenipencere('yemekrezervasyon.asp',550,400)">
		 <img src="images/rezervasyon.png" title="Rezervasyon Vermek Ýçin Týklayýnýz" border="0"></a>
		 <form id="rezervasyon" name="rezervasyon" method="post" target="_blank" action="rezervasyoniptal.asp?islem=iptalet" style="margin-top:5px;margin-bottom:0;" onSubmit="return invalid(rezervasyon);">
		 <div class="menubaslik">Rezervasyon Ýptali</div>
		 <input type="text" name="iptalkodu" id="input" value="Ýptal Kodunu Yazýn" title="4 Karakterli Ýptal Kodunuzu Yazmanýz Gerekmektedir." onBlur="if(this.value=='')this.value='Ýptal Kodunu Yazýn';" onFocus="if(this.value=='Ýptal Kodunu Yazýn')this.value='';" size="15" maxlength="10"/>
		 <input type="submit" name="button" id="button" value="Ýptal Et" onClick="return confirm('Dikkat! Rezervasyonunuz Tamamen Silinecektir.')" style="width:60px; height:25px; font-size:12px;font-weight:normal;color:#000000;text-decoration:none" />
		 </center></form>
		 <%else%>Rezervasyon Süresi Bitmiþtir.<%end if%> 
</div>