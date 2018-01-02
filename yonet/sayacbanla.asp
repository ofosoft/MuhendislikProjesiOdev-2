
<%@CODEPAGE="1254" LANGUAGE="VbScript" LCID="1055"%>

<!--#INCLUDE file="ayarlar.asp"--><style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
</style><body topmargin="200" >
<DIV ALIGN="center">

<%
islem = Request.QueryString("islem")
if islem = "uyar" then
%>
<IMG SRC="../images/stop.gif" WIDTH="64" HEIGHT="64" BORDER="0" ALT="">
<P>
<B>ARKADA&#350;IM NEDEN DEVAMLI S&#304;TEY&#304; YEN&#304;L&#304;YORSUN. DERD&#304;N NED&#304;R SEN&#304;N?</B>
<P>
<B>DEVAM EDERSEN S&#304;TE SANA YASAKLANACAKTIR.</B>
<P><B>UYARLADILAR DEME BAK.:)</B>

<P><br>
  Þimdi Seni ana sayfaya yönlendiriyorum...Akýllý Dur Tamam mý?
<P><meta http-equiv='Refresh' content='4; URL=../giris.asp'>

<%
end if
if islem = "banla" then %>

<IMG SRC="../images/stop.gif" WIDTH="64" HEIGHT="64" BORDER="0" ALT="">
<P>
<B>BAK DOSTUM BEN UYARMI&#350;TIM.</B>
<P><B> BU S&#304;TE SANA YASAKLANMI&#350;TIR</B>.
<P><B>YASAK KALKSIN AKILLI USLU OLACAGIM DIYORSAN BIZE MAIL GONDER.</B>
<P><strong><a href="mailto:sivasfirma@sivasfirma.com">sivasfirma@sivasfirma.com</a></strong>
  <% end if %>
  
</DIV>


