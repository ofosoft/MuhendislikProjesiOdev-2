<?xml version="1.0" encoding="UTF-8" ?>
<%kays=cint(session("kayanresimsayisi"))
'resim=session("kayanresimurl-1")
'adi=session("kayanresimadi-1")
'resim1="resimler/galeri/1.jpg"%>
<flash_parameters>
    <preferences>
        <golbal>
            <basic_property movieWidth="950" movieHeight="335" decoration="jumping_line_1.swf" html_title="Title" loadStyle="Pie" hideAdobeMenu="false" anvsoftMenu="false" photoDynamicShow="true" enableURL="true" transitionArray=""/>
            <title_property photoTitle="false" photoTitleX="5" photoTitleY="5" photoTitleSize="15" photoTitleFont="Verdana" photoTitleColor="0xffffff"/>
            <music_property path="" stream="true" loop="true"/>
            <photo_property topPadding="0" bottomPadding="0" leftPadding="0" rightPadding="0"/>
            <properties enable="true" backgroundColor="0xffffff" backgroundAlpha="30" cssText="a:link{text-decoration: underline;} a:hover{color:#eaab31; text-decoration: none;} a:active{color:#0000ff;text-decoration: none;} .blue {color:#0000ff; font-size:15px; font-style:italic; text-decoration: underline;} .body{color:#ff5500;font-size:20px;}" align="top"/>
        </golbal>
        <thumbnail>
            <basic_property showPrview="true" prviewWidth="100" prviewHeight="75" lineColor="0xffffff" numberColor="0xffffff" hovrColor="0xeaab31" prviewBorderColor="0xffffff"/>
        </thumbnail>
    </preferences>

    <album>
	<%for i=1 to kays%>   
		<slide jpegURL="<%=session("kayanresimurl-"&i&"")%>" d_URL="<%=session("kayanresimurl-"&i&"")%>" transition="64" panzoom="1" URLTarget="0" phototime="4" url="" title="<%=session("kayanresimadi-"&i&"")%>" width="923" height="326"/>
   
	<%next%>
   </album>
</flash_parameters>

