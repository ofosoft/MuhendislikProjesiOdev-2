<!--#include file="../ayarlar.asp"-->
 <% 
	db_veriyolu ="../" & vtyolu & "/"& vtadi &""

	set Baglantim = server.createobject("adodb.connection")
	Baglantim.open "provider=microsoft.jet.oledb.4.0;data source=" & Server.mappath(db_veriyolu & ".mdb")

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
	Set Rx=Server.CreateObject("Adodb.Recordset")
	Set Rfs=Server.CreateObject("Adodb.Recordset")
	Set Ras=Server.CreateObject("Adodb.Recordset")
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
%>
<%  
	sorgum="select *from ayarlar"
	rl.open sorgum,Baglantim,3,3
	siteadi			=	rl("site_adi")
	copyright		=	rl("copyright")
	siteslogan		=	rl("site_slogan")
	siteurl			=	rl("site_url")
	sitemail		=	rl("site_mail")
	mailsunucu		=	rl("mail_sunucu")
	siteyetkili		=	rl("site_yetkili")
	siteili			=	rl("site_ili")
	havaili			=	rl("hava_ili")
	sitetema		=	rl("site_tema")
	siteduyuru		=	rl("site_duyuru")
	rl.close
	
	ip=Request.ServerVariables("REMOTE_ADDR")
	sorgum="select * from saldiran where engel=true and ip like '%"&ip&"%'"
 	Rs.Open Sorgum, Baglantim, 1, 3 	 
	i = rs.recordcount
	rs.close
	if i<>0 then
	 Response.Redirect("../../engelli.asp")	
	end if 	

%>
<!--#include file="../func.asp"-->
