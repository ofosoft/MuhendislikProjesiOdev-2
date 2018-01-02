<?xml version="1.0" encoding="UTF-8"?>
<%kays=cint(session("kayanresimsayisi"))
'resim=session("kayanresimurl-1")
'adi=session("kayanresimadi-1")
'resim1="resimler/galeri/1.jpg"%>
<!-- Configuration panel -->
<banner width = "" height = ""
		startWith = "1" 
		random = "false"
		
		backgroundColor = "0xffffff" 
		backgroundTransparency = "100"
		
		cellWidth = "50"
		cellHeight = "50"
		
		showMinTime = "0.2"
		showMaxTime = "1.0"
		
		blur = "50"
		netTime = "0.3"
		alphaNet = "0.5"
		netColor = "0x000000"
		
		overColor = "0x473C31"
		normalColor = "0x000000"
		selectedTextColor = "0xffffff"
		buttonAlpha = "0.3"
		captionButtonAlpha = "0.4"
		
		controllerVisible = "false"
		controllerBackgroundVisible = "true"
		prevNextVisible = "true"
		controllerDistanceX = "10"
		controllerDistanceY = "10"
		controllerHeight = "27"
		distanceBetweenControllerElements = "12"
		distanceBetweenThumbs = "12"
		
		loaderColor = "0x000000"
		
		captionTransparency = "0.6"
		captionY = "8"
		captionX = "8"			
		captionWidth = "180"
		buttonText = ">>"
		btnNormalColor = "0x000000"
		btnOverColor = "0xffffff"
		btnOutColor = "0x000000"
		paddingX = "15"
		paddingY = "10"
		
		btnSpacingW = "30"
		btnSpacingH = "4"
		>
<!-- End panel -->


<!--If you want to customize your font use, for example:
	<font color='#FFffff' size='14px' family='Verdana, Tahoma'> Hevesli Otomotiv </font> 
-->

<%for i=1 to kays%>   
<item>
		<path><%=session("kayanresimurl-"&i&"")%></path>
   <%if 1>2 then%>
        <title><%=session("kayanresimadi-"&i&"")%></title>
		<caption></caption>
		<target>_blank</target>
		<link>#</link>
	<%end if%>
		<bar_color>0xffffff</bar_color>
		<bar_transparency>30</bar_transparency>
		<slideshowTime>3</slideshowTime>
	</item>
	<%next%>

</banner>