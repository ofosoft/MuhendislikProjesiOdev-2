<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="sifre.asp"-->
<!--#include file="bag.asp"-->
<link href="ofosoftrehber.css" rel="stylesheet" type="text/css"><title>Ziyaretçi Defterini Düzelt</title>
<script language="JavaScript" type="text/javascript" src="/jsnew/wysiwyg.js"></script>
<table border="0" width="300" id="table15" height="217" cellspacing="0" cellpadding="0" align="center">
<tr>
<td height="39">&nbsp;
<%
id = Request.QueryString("id")
sorgum="Select * from mesaj Where id = "&id&""
rs.Open Sorgum, Baglantim, 1, 3  
islem=Request.QueryString("islem")

if islem="duzenle" then
call duzenle
end if
%>
<form action="defterduzelt.asp?id=<%=rs("id")%>&islem=duzenle" method="post">
			<table border="0" width="100%" id="table16">
				<tr>
					<td bgcolor="#000033"><div align="center" style="color: #FFFFFF; font-weight: bold; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 11px">Defter Mesajýný Düzelt</div></td>
			  </tr>
				<tr>
					<td height="135"><div align="center"><font face="Verdana">
			  <span style="font-size: 8pt">
	<textarea name="cevap" cols="50" rows="15" id="metinalani"><%=rs("mesaj")%></textarea>
				    </span></font></div></td>
				</tr><script language="javascript1.2">
  generate_wysiwyg('metinalani');
</script>
				<tr>
					<td> 
					  <div align="center">
					    <input type="submit" class="yuklebuton" value="Mesajý Düzelt">
			        </div></td>
				  </tr>
			</table>
</form><%rs.close%>
</div>
<%
sub duzenle
cevap = Request.Form("cevap")
id = Request.QueryString("id")
sorgum="Select * from mesaj Where id = "&id&""
'rs.Open Sorgum, Baglantim, 1, 3  
	rs("mesaj") = cevap
	rs.Update
	'rs.close
	Response.Write "<script>alert('Mesaj Düzeltilmiþtir.!');</script>"
	Response.Write "<script>window.navigate('defterduzelt.asp?id="&id&"');</script>"
End sub
%>
<center><input  type="image" src="../images/pencereyikapat.gif" value="Pencereyi Kapat" onClick="javascript:self.close();" onKeyPress="javascript:self.close();"></center>