<%@LANGUAGE="VBSCRIPT" CODEPAGE="1254"%>
<!--#include file="bag.asp"-->
<html>
<head>
<!-- #include file="headic.asp" -->
<title><%=siteadi%> | <%=klm(55)%></title>
<link href="tema/<%=sitetema%>/style.css" rel="stylesheet" type="text/css" >
<style type="text/css">
<!--
body {
	background-image: url(tema/<%=sitetema%>/bg.gif);
}
-->
</style></head>

<body>
<table width="<%=sitegenislik%>" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="15"><img src="tema/<%=sitetema%>/solustkenar.png"></td>
    <td colspan="2" background="tema/<%=sitetema%>/ustortakenar.png"></td>
    <td width="15"><img src="tema/<%=sitetema%>/sagustkenar.png"></td>
  </tr>
  <tr>
    <td rowspan="3" background="tema/<%=sitetema%>/solortakenar.png"></td>
    <td colspan="2"><!--#include file="ust.asp"--></td>
    <td rowspan="3" background="tema/<%=sitetema%>/sagortakenar.png"></td>
  </tr>
  <tr><td width="230" valign="top"><!--#include file="sag_menu.asp"--></td>
   <td valign="top">
	<table width="100%" cellpadding="0" cellpadding="0" align="right">
    <tr><td>
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="right">
  <tr>
    <td width="1"><img src="/tema/<%=sitetema%>/bustsol.gif"></td>
    <td width="99%" background="/tema/<%=sitetema%>/bust.gif" class="Menu">
		&nbsp;<img src="/tema/<%=sitetema%>/baslikok.gif"> <%=klm(56)%></span>    
    </td>
    <td width="1"><img src="/tema/<%=sitetema%>/bustsag.gif"></td>
  </tr>
  <tr>
    <td background="/tema/<%=sitetema%>/bsol.gif"></td>
    <td>
                 <%=sayfa_goster(71)%>
          
               <td background="/tema/<%=sitetema%>/bsag.gif"></td>
  </tr>
  <tr>
    <td><img src="/tema/<%=sitetema%>/baltsol.gif"></td>
    <td background="/tema/<%=sitetema%>/balt.gif"></td>
    <td><img src="/tema/<%=sitetema%>/baltsag.gif"></td>
  </tr>
</table><br>

</td></tr><tr><td>
    <table width="99%" border="0" cellspacing="0" cellpadding="0" align="right">
  <tr>
    <td width="1"><img src="/tema/<%=sitetema%>/bustsol.gif"></td>
    <td width="99%" background="/tema/<%=sitetema%>/bust.gif" class="Menu">
		&nbsp;<img src="/tema/<%=sitetema%>/baslikok.gif"> <%=klm(55)%></span>    
    </td>
    <td width="1"><img src="/tema/<%=sitetema%>/bustsag.gif"></td>
  </tr>
  <tr>
    <td background="/tema/<%=sitetema%>/bsol.gif"></td>
    <td>
            <IFRAME border="0" frameborder="0"  src="uyeol2.asp" width="100%" scrolling="no" height="560"></IFRAME>
          <td background="/tema/<%=sitetema%>/bsag.gif"></td>
  </tr>
  <tr>
    <td><img src="/tema/<%=sitetema%>/baltsol.gif"></td>
    <td background="/tema/<%=sitetema%>/balt.gif"></td>
    <td><img src="/tema/<%=sitetema%>/baltsag.gif"></td>
  </tr>
</table></td></tr></table>  
   </td>
  </tr>
  <tr>
    <td colspan="2"><!--#include file="alt.asp"--> </td>
  </tr>
  <tr>
    <td><img src="tema/<%=sitetema%>/solaltkenar.png"></td>
    <td colspan="2" background="tema/<%=sitetema%>/altortakenar.png"></td>
    <td><img src="tema/<%=sitetema%>/saglatkenar.png"></td>
  </tr>
</table>
</body> 
</html>
