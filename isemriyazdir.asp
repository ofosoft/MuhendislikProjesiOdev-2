<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="bag.asp"-->
<title>�� Emri Yazd�rma Sayfas� | <%=siteadi%></title>
<!-- #include file="headic.asp" -->
<link rel="shortcut icon" href="favicon.ico" />
<style type="text/css">
<!--
body {
	width:100%;
	height:100%;
	background-color:#ffffff;
	font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;

}
.stil1 {font-size: 11px}
.stil2 {font-size: 12px}
.stil4 {font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; }
.stil5 {font-family: Verdana, Arial, Helvetica, sans-serif}
.stil6 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 12px;

}
-->
</style>
<script language="Javascript1.2"><!�function printpage() {window.print();}//�> </script>
</head>
<body onload="window.print()">
<table width="96%" align="center" cellspacing="2" cellpadding="2" border="0">
   <tr height="24">
     <td colspan="9" height="24"><div align="center">T.C.</div></td>
   </tr>
   <tr height="24">
     <td colspan="9" height="24"><div align="center">ORMAN VE SU ��LER�    BAKANLI�I</div></td>
   </tr>
   <tr height="24">
     <td colspan="9" height="24"><div align="center">DEVLET SU ��LER�    GENEL M�D�RL���</div></td>
   </tr>
   <tr height="24">
     <td colspan="9" height="24"><div align="center">19. B�LGE M�D�RL���</div></td>
   </tr>
   <tr height="24">
     <td colspan="9" height="24"><div align="center">MAK�NE, �KMAL VE    DONATIM �UBE M�D�RL���</div></td>
   </tr>
   <tr height="24">
     <td colspan="9" height="24"><div align="center">MERKEZ AT�LYES�</div></td>
   </tr>
   <tr height="62">
     <td colspan="9" height="50"><div align="center"><strong>�� EMR�</strong></div></td>
   </tr>
   <tr height="20">
     <td width="57" height="20"></td>
     <td width="158"></td>
     <td width="24"></td>
     <td width="24"></td>
     <td width="24"></td>
     <td width="24"></td>
     <td width="89"></td>
     <td colspan="2"><div align="right"><%=request("tarih")%></div></td>
   </tr>
   </table>
   <table width="98%" align="center" cellspacing="0" cellpadding="0" border="1">
   <tr height="40">
     <td width="100px" align="center"><strong>S�ra No</strong></td>
     <td width="75%" align="center"><strong> Yap�lacak ��in Ad� - Cinsi</strong></td>
     <td width="10%"><div align="center"><strong>Birimi</strong></div></td>
     <td width="10%"><div align="center"><strong>Miktar�</strong></div></td>
   </tr>
   <%sno=0
   for i=1 to 10
   if request("is"&i&"")<>"" then
   sno=sno+1%>
   <tr height="30"><td height="30"><div align="center"><strong><%=sno%></strong></div></td><td>&nbsp;<%=request("is"&i&"")%></td><td align="center"><%=request("birim"&i&"")%></td><td align="center"><%=request("miktar"&i&"")%></td></tr>
   <%end if
   next
   if sno<10 then
   for i=sno+1 to 10%>
      <tr height="30"><td height="30"><div align="center"><strong><%=i%></strong></div></td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
   
   <%
   next
   end if%>

   
   <tr height="143">
     <td colspan="9" height="135" align="center"><p>M�d�rl�k Makam�na<br>
       Yukar�da belirtilen i�lerin proje ve detaylara uygun yapt�r�lmas�n� arz    ederim.</p>
       <p><br>
         KISIM �EFݠ�������������������������������������������������������������UBE M�D�R�<br>
          <br>
         </p></td>
   </tr>
     </table>
   <table width="99%" align="center" cellspacing="3" cellpadding="3" border="0">
   <tr height="44">
     <td colspan="9" height="44">Makine ve �kmal �ube M�d�rl���ne<br>
       Gere�ini rica ederim.</td>
   </tr>
   <tr height="10">
     <td height="10"></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
     <td></td>
   </tr>

   <tr>
     <td colspan="9" height="30" valign="top"><div align="center">�.. / �.. / 201�</div></td>
   </tr>
   <tr>
     <td colspan="9" height="30" valign="bottom"><div align="center">B�lge M�d�r�</div></td>
   </tr>
 </table>
</body>

</html>