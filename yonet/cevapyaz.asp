<!--#include file="sifre.asp"-->
<!--#include file="bag.asp"-->
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
<form action="cevapyaz.asp?id=<%=rs("id")%>&islem=duzenle" method="post">
			<table border="0" width="100%" id="table16">
				<tr>
					<td><div align="center"><b>
				    <font face="Verdana" style="font-size: 8pt">Cevabýnýz  :</font></b></div></td>
				  </tr>
				<tr>
					<td height="135"><div align="center"><font face="Verdana">
			  <span style="font-size: 8pt">
	<textarea name="cevap" cols="40" rows="15" id="metinalani"><%=rs("cevap")%></textarea>
				    </span></font></div></td>
				</tr>
				<tr>
					<td> 
					  <div align="center">
					    <input type="submit" class="style2" value="Cevabý Gönder">
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
	rs("cevap") = cevap
	rs.Update
	'rs.close
	Response.Write "<script>alert('Cevabiniz Eklenmistir.!');</script>"
End sub
%>
<center><input  type="image" src="images/pencereyikapat.gif" value="Pencereyi Kapat" onClick="javascript:self.close();" onKeyPress="javascript:self.close();"></center>