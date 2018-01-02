<%@CODEPAGE="1254" LANGUAGE="VbScript" LCID="1055"%>

<!--#INCLUDE file="sayacayarlar.asp"-->

<style type="text/css">
<!--
.stil1 {
	font-family: verdana, helvetica, arial, geneva;
	font-weight: bold;
	font-size: 12px;
}
-->
</style>
<div align="center">
<%Session("AdminLogin") = True%>
<BR>
<span class="stil1">SAYAC ISTATISTIKLERI</span>
<P>

<A HREF="sayacdefault.asp?sayac=gunhit"><B>Günlük Hit Dökümü</B></A> |
<A HREF="sayacdefault.asp?sayac=saysite"><B>Hit Gönderen Siteler</B></A> |
<A HREF="sayacdefault.asp?sayac=gunluk"><B>Günlük Gelen Dökümü</B></A> |
<A HREF="sayacdefault.asp?sayac=ip"><B>Ip Dökümü</B></A> |
<A HREF="sayacdefault.asp?sayac=yasakli"><B>Yasaklilar</B></A> |
<A HREF="sayacdefault.asp?sayac=yasakliekle"><B>Yasaklanacak Ip Ekle</B></A> |
<P>


<form name="temizle">
<select name="menu">
<option value="sayacdefault.asp?sayac=iptemizle">5 gün önceki ipleri sil</option>
<option value="sayacdefault.asp?sayac=gunluktemizle">5 gün önceki Günlük Siteleri Sil</option>
<option value="sayacdefault.asp?sayac=saysitetemizle">1 ay önceki hit gönderenleri Sil</option>
</select>
<input type="button" onClick="location=document.temizle.menu.options[document.temizle.menu.selectedIndex].value;" value=" Temizle ">
</form>


<% 
Response.Buffer = True 

sayac=request.querystring("sayac")

If sayac="" Or sayac="gunhit" Then 
sor="select * from say_hit order by id  desc   " 
efkan.Open sor,Sur,1,3
adet=efkan.recordcount

if efkan.eof or efkan.bof then
response.write("Kayit Bulunamadi.")
else

shf = Request.QueryString("shf")
if shf="" then 
shf=1
end If %>

<B>GÜN HITLERI</B>
<table background="" width="50%" bgcolor="" bordercolor="#FFFFFF" border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="<%=bgcolor1%>">
<td align="center"  width="30%"><B>Tarih</B></td>
<td align="center" width="30%"><B>Tekil</B></td>
<td align="center"  width="30%"><B>Çogul</B></td>
</tr>
<%
efkan.pagesize =50
efkan.absolutepage = shf
sayfa = efkan.pagecount
for i=1 to efkan.pagesize
if efkan.eof then exit For
if renk mod 2 then
bgcolor = bgcolor1
else
bgcolor = bgcolor2
end If 
%>
<tr bgcolor="<%=bgcolor%>" onmouseover="this.style.backgroundColor='#CCFFFF';" onmouseout="this.style.backgroundColor='';">
<td align="center"><%= efkan("gun")%></td>
<td align="center"><%= efkan("tekil")%></td>
<td align="center"><%= efkan("cogul")%></td>
</tr>
<%
renk=renk + 1
efkan.movenext
next 
efkan.close
%>
</table>
<P>
Sayfalar :
<%ssay=1
for y=1 to sayfa 
if ssay mod 20 = 0 then
response.write "<BR>"
end If
if  y=cint(shf) then 
response.write "<B>["&y&"]</B>"
else
response.write "<a href='sayacdefault.asp?sayac="&sayac&"&shf="&y&"'>["&y&"]</a>"
end If
ssay=ssay+1
Next
end if
End If


'/////////////////////// HIT GÖNDERENLERIN TOPLAM SAYACI /////////////////////////
If sayac="saysite"  Then 
sor="select * from say_site order by hit desc   " 
efkan.Open sor,Sur,1,3
adet=efkan.recordcount

if efkan.eof or efkan.bof then
response.write("Kayit Bulunamadi.")
else
shf = Request.QueryString("shf")
if shf="" then 
shf=1
end if
%>

<B>HIT GÖNDEREN SITELER</B>
<table background="" width="50%" bgcolor="" bordercolor="#FFFFFF" border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="<%=bgcolor1%>">
<td align="center"  width="20%"><B>En son</B></td>
<td align="center" width="20%"><B>Hit</B></td>
<td align="center"  width="60%"><B>Hit Gönderen</B></td>
</tr>
<%
efkan.pagesize =50
efkan.absolutepage = shf
sayfa = efkan.pagecount
for i=1 to efkan.pagesize
if efkan.eof then exit for
if renk mod 2 then
bgcolor = bgcolor1
else
bgcolor = bgcolor2
end If 
%>
<tr bgcolor="<%=bgcolor%>" onmouseover="this.style.backgroundColor='#CCFFFF';" onmouseout="this.style.backgroundColor='';">
<td align="center"><%= efkan("gun")%></td>
<td align="center"><%= efkan("hit")%></td>
<td align="left"><A HREF="<%= efkan("site_name")%>" target="_blank"><%= efkan("site_name")%></A></td>
</tr>

<%
renk=renk+1
efkan.movenext
next 
efkan.close%>
</table>
Sayfalar :
<%ssay=1
for y=1 to sayfa 
if ssay mod 20 = 0 then
response.write "<BR>"
end If
if  y=cint(shf) then 
response.write "<B>["&y&"]</B>"
else
response.write "<a href='sayacdefault.asp?sayac="&sayac&"&shf="&y&"'>["&y&"]</a>"
end If
ssay=ssay+1
Next
end if
End If


'/////////////////////// GÜNLÜK GELENLERIN DÖKÜMÜ /////////////////////////
If sayac="gunluk"  Then 
sor="select * from site_gel order by id desc   " 
efkan.Open sor,Sur,1,3
adet=efkan.recordcount
if efkan.eof or efkan.bof then
response.write("Kayit Bulunamadi.")
else

shf = Request.QueryString("shf")
if shf="" then 
shf=1
end if
%>
<B>GÜNLÜK HIT GÖNDERENLERIN DÖKÜMÜ</B>
<table background="" width="50%" bgcolor="" bordercolor="#FFFFFF" border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="<%=bgcolor1%>">
<td align="center"  width="20%" ><B>Gün</B></td>
<td align="center" width="20%" ><B>Hit</B></td>
<td align="center"  width="60%" ><B>Url</B></td>
</tr>
<%
efkan.pagesize =50 
efkan.absolutepage = shf
sayfa = efkan.pagecount
for i=1 to efkan.pagesize
if efkan.eof then exit For
if renk mod 2 then
bgcolor = bgcolor1
else
bgcolor = bgcolor2
end If 
%>
<tr bgcolor="<%=bgcolor%>" onmouseover="this.style.backgroundColor='#CCFFFF';" onmouseout="this.style.backgroundColor='';">
<td align="center"><%= efkan("gun")%></td>
<td align="center"><%= efkan("hit")%></td>
<td align="left">
<A HREF="<%= efkan("site_gel")%>" target="_blank"><%= efkan("site_gel")%></A>
</td>
</tr>
<%
renk=renk+1
efkan.movenext
next 
efkan.close
%>
</table>

Sayfalar :
<%'ssay=0
for y=1 to sayfa 
if ssay mod 10 = 0 then
response.write "<BR>"
end If
if  y=cint(shf) then 
response.write "<B>["&y&"]</B>"
else
response.write "<a href='sayacdefault.asp?sayac="&sayac&"&shf="&y&"'>["&y&"]</a>"
end If
ssay=ssay+1
Next
End If
end if


'/////////////////////// IP DÖKÜMÜ /////////////////////////
If sayac="ip"  Then 
sor="select * from say_ip order by id desc   " 
efkan.Open sor,Sur,1,3
adet=efkan.recordcount
if efkan.eof or efkan.bof then
response.write("Kayit Bulunamadi.")
else

shf = Request.QueryString("shf")
if shf="" then 
shf=1
end if
%>
<B>ZIYARET EDEN IP NUMARALARI</B>
<table background="" width="50%" bgcolor="" bordercolor="#FFFFFF" border="1" cellspacing="0" cellpadding="2">
<tr bgcolor="<%=bgcolor1%>">
<td align="center"  width="20%" ><B>En Son</B></td>
<td align="center" width="20%" ><B>Hit</B></td>
<td align="center"  width="60%" ><B>Ip No</B></td>
</tr>
<%
efkan.pagesize =50 
efkan.absolutepage = shf
sayfa = efkan.pagecount
for i=1 to efkan.pagesize
if efkan.eof then exit For
if renk mod 2 then
bgcolor = bgcolor1
else
bgcolor = bgcolor2
end If 
%>
<tr bgcolor="<%=bgcolor%>" onmouseover="this.style.backgroundColor='#CCFFFF';" onmouseout="this.style.backgroundColor='';">
<td align="center"><%= efkan("vakit")%></td>
<td align="center"><%= efkan("hit")%></td>
<td align="left"><%= efkan("ip_number")%></td>
</tr>
<%
renk=renk+1
efkan.movenext
next 
efkan.close
%>
</table>
Sayfalar :
<%'ssay=0
for y=1 to sayfa 
if ssay mod 10 = 0 then
response.write "<BR>"
end If
if  y=cint(shf) then 
response.write "<B>["&y&"]</B>"
else
response.write "<a href='sayacdefault.asp?sayac="&sayac&"&shf="&y&"'>["&y&"]</a>"
end If
ssay=ssay+1
Next
End If
end if


If sayac="iptemizle"  Then 

sor="SELECT * FROM say_ip  "
efkan.Open sor,Sur,1,3
do while not efkan.eof  
zaman=datediff("d",efkan("vakit"),now)  
if zaman > 5 then
sor="DELETE from say_ip WHERE id = "&efkan("id")&"  "
efkan1.Open sor,Sur,1,3
end if
efkan.movenext
Loop
efkan.Close
response.redirect "sayacdefault.asp?sayac=ip"
end If


If sayac="gunluktemizle"  Then 

sor="SELECT * FROM site_gel  "
efkan.Open sor,Sur,1,3
do while not efkan.eof  
zaman=datediff("d",efkan("gun"),now)  ' 1 ay öncesi
if zaman > 5 then
sor="DELETE from site_gel WHERE id = "&efkan("id")&"  "
efkan1.Open sor,Sur,1,3
end if
efkan.movenext
Loop
efkan.Close
response.redirect "sayacdefault.asp?sayac=gunluk"
end if


If sayac="saysitetemizle"  Then 

sor="SELECT * FROM say_site  "
efkan.Open sor,Sur,1,3
do while not efkan.eof  
zaman=datediff("m",efkan("gun"),now)  ' 1 ay öncesi
if zaman > 1 then
sor="DELETE from say_site WHERE id = "&efkan("id")&"  "
efkan1.Open sor,Sur,1,3
end if
efkan.movenext
Loop
efkan.Close
response.redirect "sayacdefault.asp?sayac=saysite"
end if





'//////// YASAKLILAR
if sayac="yasakli" then  %>
<A HREF="?sayac=yasakliekle"><B>Yasaklanacak Ip Ekle</B></A><P>
<% sor = "Select * from yasakli order by id desc " 
efkan.Open sor,Sur,1,3
adet=efkan.recordcount
if efkan.eof or efkan.bof then
response.write "Yasakli Yok"
Else
shf = Request.QueryString("shf")
if shf="" then 
shf=1
end If %>
<B>YASAKLI IP IPLER</B><BR>
<table width="50%" bgcolor="#F9F9F9" bordercolor="#FFFFFF" border="1" cellspacing="0" cellpadding="3">
<tr bgcolor="<%=bgcolor%>">
<td width="1%"><B>id</B></td>
<td width="10%" align="center"><B>Tarih</B></td>
<td width="10%" align="center"><B>Ip</B></td>
<td width="4%" align="center"><B>Islem</B></td>
</tr>
<% efkan.pagesize =50
efkan.absolutepage = shf
sayfa = efkan.pagecount
for i=1 to efkan.pagesize
if efkan.eof then exit For
if renk mod 2 then
bgcolor = bgcolor1
else
bgcolor = bgcolor2
end If %>
<tr bgcolor="<%=bgcolor%>" onmouseover="this.style.backgroundColor='#CCFFFF';" onmouseout="this.style.backgroundColor='';">
<td align="center"><%=efkan("id")%></td>
<td align="center"><%=efkan("tarih")%></td>
<td align="center"><%=efkan("ip")%></td>
<td align="center">
<A HREF="sayacdefault.asp?sayac=yasaklisil&id=<%=efkan("id")%>">Sil</A>
</td></tr>
<%
renk=renk+1
efkan.movenext
Next
efkan.close%>
</table><P>
Sayfalar :
<%'ssay=0
for y=1 to sayfa 
if ssay mod 10 = 0 then
response.write "<BR>"
end If
if  y=cint(shf) then 
response.write "<B>["&y&"]</B>"
Else
	  response.write "<a href='?sayac=yasakli&shf="&y&"'>["&y&"]</a>"
end If
ssay=ssay+1
next
end if
End If




'////////////////////////// YASAKLI EKLE /////////////////////////////////
If sayac="yasakliekle" Then %>
<form method="POST" action="sayacdefault.asp?sayac=yasakliekle">
<A HREF="?sayac=yasakli">Tüm Yasaklilar</A>
<table width="50%" bgcolor="" bordercolor="#f5f5ff" border="1" cellspacing="0" cellpadding="3">
<tr><td width="40%">Yasaklanacak Ip</td><td width="60%">
<input name="ip" type="text" value="" size="40"></td></tr>
<tr><td align="center" colspan="2">
<input type="submit" value=" Ekle " name="submit" > <INPUT TYPE="reset" value=" Temizle ">
</td></tr></table></form>
<% 
if request.form("ip")=""  then
else
sor = "Select * from yasakli  " 
efkan.Open sor,Sur,1,3
efkan.AddNew
  efkan("ip")         =Trim(request.form("ip"))
  efkan("tarih")     =Now()
efkan.Update
efkan.close
Response.redirect "sayacdefault.asp?sayac=yasakli"
end if
end if






'//////////////////YASAKLI SIL
if sayac="yasaklisil" then 

id=request.querystring("id")
sor="DELETE from yasakli WHERE id = "&id&"  "
efkan.Open sor,sur,1,3
Response.redirect "sayacdefault.asp?sayac=yasakli"
End If




Set efkan1=Nothing
Set efkan=Nothing
%>
