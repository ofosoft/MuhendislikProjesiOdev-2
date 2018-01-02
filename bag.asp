<!--#include file="ayarlar.asp"-->
<% 
	db_veriyolu ="" & vtyolu & "/"& vtadi &""

	set Baglantim = server.createobject("adodb.connection")
	Baglantim.open "provider=microsoft.jet.oledb.4.0;data source=" & Server.mappath(db_veriyolu & ".mdb")

	Set data=Server.CreateObject("ADODB.Connection") 
	data.Open"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.mappath(db_veriyolu & ".mdb")
 	

	Set Rs=Server.CreateObject("Adodb.Recordset")
	Set Ra=Server.CreateObject("Adodb.Recordset")
	Set Rf=Server.CreateObject("Adodb.Recordset")
	Set Ru=Server.CreateObject("Adodb.Recordset")
	Set Rk=Server.CreateObject("Adodb.Recordset")	
	Set Rl=Server.CreateObject("Adodb.Recordset")
	Set Rt=Server.CreateObject("Adodb.Recordset")
	Set Rv=Server.CreateObject("Adodb.Recordset")
	Set Ry=Server.CreateObject("Adodb.Recordset")
	Set Rz=Server.CreateObject("Adodb.Recordset")
	Set Ru=Server.CreateObject("Adodb.Recordset")
	Set Ruu=Server.CreateObject("Adodb.Recordset")
	Set Rx=Server.CreateObject("Adodb.Recordset")
	Set Rfs=Server.CreateObject("Adodb.Recordset")
	Set Ras=Server.CreateObject("Adodb.Recordset")
	Set Rax=Server.CreateObject("Adodb.Recordset")
	Set Rj=Server.CreateObject("Adodb.Recordset")
	sayfa=Request.QueryString("sayfa")
	islem=Request.QueryString("islem")
	kanal=Request.QueryString("kanal")
	fkodu=Request.QueryString("fkodu")
	skodu=Request.QueryString("skodu")
	hkodu=Request.QueryString("hkodu")
	ukodu=Request.QueryString("ukodu")
	askodu=Request.QueryString("askodu")
	firma_id=Request.QueryString("firma_id")
	urun_id=Request.QueryString("urun_id")
	sayfaid=Request.QueryString("sayfaid")
	id=Request.QueryString("id")

   dim klm(100)
    sorgum="select * from kelimeler"
	rl.open sorgum,Baglantim,3,1
	for i=1 to 100
	 klm(i)=rl("k"&i&"")
	next
	rl.close
	
	sorgum="select *from ayarlar"
	rl.open sorgum,Baglantim,3,1
	siteadi			=	rl("site_adi")
	copyright		=	rl("copyright")
	siteslogan		=	rl("site_slogan")
	siteurl			=	rl("site_url")
	sitemail		=	rl("site_mail")
	mailsunucu		=	rl("mail_sunucu")
	mailbilesen		=	rl("mail_bilesen")
	siteyetkili		=	rl("site_yetkili")
	siteili			=	rl("site_ili")
	havaili			=	rl("hava_ili")
	meta1			=	rl("meta1")		: rezervasyon=rl("rezervasyon")
	meta2			=	rl("meta2")		: listestil=rl("liste_stil")
	if Session("sitetema")="" then
	 sitetema		=	rl("site_tema")
	else
	 sitetema		= 	Session("sitetema")
	end if
	sitekonum		=	rl("konum")
	sitegenislik		=	rl("site_genislik")
	mailsifre		=	rl("mail_sifre")
	smtpmail		=	rl("site_mail2")
	smtpserver		=	rl("smtp_server")
	smtpport		=	rl("smtp_port")
	smtpcate		=	rl("smtp_cate")
	smtpssl			=	rl("smtp_ssl")
	sendusing		=	rl("send_using")
	rl.close
' Blok ayarlari aliniyor...

	sorgum="select *from bloklar"
	rl.open sorgum,Baglantim,2,3
	girisb	=	rl("giris")		:	sagub	=	rl("sagustr")
	sagab	=	rl("sagaltr")	:	aramaa	=	rl("arama")
	anketa	=	rl("anket")		:	havaa	=	rl("hava")
	temaa	=	rl("tema")		:	anaab	=	rl("anaaltr")
	anaub	=	rl("anaustr")	:	spona	=	rl("sponsor")
	anar	=	rl("referans")	:	anau	=	rl("urun")
	emenua	=	rl("ekmenu")	:	aramaa	=	rl("arama")
	haberob	=	rl("haberr")	:	sayfaob	=	rl("sayfar")
	urunob	=	rl("urunr")		:	galeriob	=rl("galerir")
	yaprakb	=	rl("yaprak")	:	anash	=	rl("anasol")
	anasah	=	rl("anasag")	:	anaoh	=	rl("anaorta")
	anaresim	=rl("anaresim")	:	sagha	=	rl("saghaber")
	mn1=rl("b1")	:	mn7=rl("b7")	:	mn13=rl("b13")	
	mn2=rl("b2")	:	mn8=rl("b8")	:	mn14=rl("b14")	
	mn3=rl("b3")	:	mn9=rl("b9")	:	mn15=rl("b15")	
	mn4=rl("b4")	:	mn10=rl("b10")	:	mn16=rl("b16")	
	mn5=rl("b5")	:	mn11=rl("b11")	:	mn17=rl("b17")	
	mn6=rl("b6")	:	mn12=rl("b12")	:	mn18=rl("b18")	
	rl.close

	edb_veriyolu ="" & vtyolu & "/"& emlakvtadi &""
	Set emlak=Server.CreateObject("ADODB.Connection")
	emlak.open"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.mappath(edb_veriyolu & ".mdb")
	Set ers=Server.CreateObject("Adodb.Recordset")
	Set erz=Server.CreateObject("Adodb.Recordset")
	
	kip=Request.ServerVariables("REMOTE_ADDR")
	sorgum="select * from saldiran where engel=true and ip like '%"&kip&"%'"
 	Rs.Open Sorgum, Baglantim, 1, 3 	 
	i = rs.recordcount
	rs.close
	if i<>0 then
	 Response.Redirect("/engelli.asp")	
	end if 	
	ikip=left(kip,6)
%>
<!--#include file="func.asp"-->
<!--#include file="func2.asp"-->