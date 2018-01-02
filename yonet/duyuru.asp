<%@codepage=1254%>
<%  If  session("adminmi") = ""  Then  
response.redirect "sifre.asp"
End If
%>
<!-- #include file="conn.asp"-->
<%
islem=Request.QueryString("islem")
if islem="ekle" then
call ekle
end if
%>

<html>
<head>
<title>Duyuru Sistemi</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
<style type="text/css">

A {text-decoration:none;}
A:hover {color:FFFFFF;}
BODY {     
           scrollbar-3d-light-color:#F4EEE6;
           scrollbar-arrow-color:#640000;
           scrollbar-base-color:#FFE3BD;
           scrollbar-dark-shadow-color:#FE9810;
           scrollbar-face-color:#ffffff;
           scrollbar-highlight-color:#f7f7f7;
           scrollbar-shadow-color:#FFE3BD}
           
SELECT, option, textarea, input {FONT-FAMILY:verdana,arial;color:#666666; FONT-SIZE: 12px; background-color:#eeeeee  }

body, table, tr, td        {  font-family : tahoma; font-size: 8 pt  }


a:link, a:visited, a:active {text-decoration:none; color:#044B93; font-weight:plain;}

a:hover {
	text-decoration:none;
	color:#FF0000;
	font-weight: plain;
}
.stil_menu {font-family:Verdana, Arial,Helvetica;font-size: 8pt}

.bottom { vertical-align: bottom }
.stil1 {font-size: 8pt; font-family: Verdana; color: #000000; float: right; border-style: solid; border-width: 1; background-color: #C0C0C0}

.top { vertical-align: top }

.poster { FONT-SIZE: 12px }
 
 </style>
<script  language="JavaScript">
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}

// -->
</script>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a:link {
	color: #0000FF;
}
body,td,th {
	font-family: Verdana;
	font-size: 11px;
}
-->
</style></head>

<body>
<table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse">
  <tr>
    <td height="434"><table width="100%" border="0" align="center" cellpadding="2" cellspacing="0">
        <tr>
          <td width="20%" height="451" valign="top"><!-- #include file="menu.asp"--></td>
          <td width="80%" valign="top"><table width="100%"  border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse">
              <tr bgcolor="#EBEBEB">
                <td width="66%"><strong>Başlık</strong></td>
                <td width="19%"><div align="center"><strong>Kime</strong></div></td>
                <td width="15%"><div align="center"><strong>Tarih</strong></div></td>
              </tr>
			   <%
Set muslim1 = Server.CreateObject("ADODB.Recordset")
sor1 = "Select * from duyurular order by id desc"
muslim1.Open sor1,Sur,1,3
if muslim1.recordcount = 0 then
Response.write "<tr>"
Response.write "<td colspan=3 align=center>Duyuru Bulunamadı.</td>"
Response.write "</tr>"
Else
%>
<%
do while not muslim1.eof
%>
              <tr>
                <td><b><a href="JavaScript:openWin('duyuruoku.asp?id=<%=muslim1("id")%>','yukle','toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=350,height=350')"><%=muslim1("baslik")%></a></b></td>
                <td><div align="center">
                  <% if muslim1("kime") = 0 then
				Response.write "Üyelere"
				ElseIf muslim1("kime") = 1 then
				Response.write "Ziyaretçilere"
				ElseIf muslim1("kime") = 2 then
				Response.write "Yazarlara"
				End If
				%>
                </div></td>
                <td><div align="center"><b><%=muslim1("tarih")%></b></div></td>
              </tr>
<%
muslim1.movenext
Loop
%>
<%End If%>
<% 
muslim1.close
%>
            </table>            
            <p align="center"><strong>ZİYARETÇİ VEYA KÖŞE YAZARLARINA DUYURU EKLE </strong></p><form name="form1" method="post" action="duyuru.asp?islem=ekle">
            <table width="100%"  border="1" align="center" cellpadding="3" cellspacing="0" bordercolor="#CCCCCC" style="border-collapse:collapse">
              <tr>
                <td width="16%"><strong>Başlık : </strong></td>
                <td width="84%"><input name="baslik" type="text" class="form" id="baslik" size="35"></td>
              </tr>
              <tr>
                <td><strong>Tarih : </strong></td>
                <td><input name="tarih" type="text" class="form" id="tarih" value="<%=Date()%>"></td>
              </tr>
              <tr>
                <td><strong>Kime : </strong></td>
                <td><select name="kime" class="form" id="kime">
                      <option value="0">Üyelere</option>	
	              <option value="1">Site Ziyaretçilerine</option>      
                      <option value="2">Tüm Yazarlara</option>
                      			   <%
'sor1 = "Select * from yazar order by id desc"
'muslim1.Open sor1,Sur,1,3
'if muslim1.recordcount <> 0 then
'do while not muslim1.eof
'if muslim1.eof then exit do%>
 
<%'muslim1.movenext
'muslim1.close%>                
                	</select></td>
              </tr>
              <tr>
                <td><strong>Detaylar : </strong></td>
                <td><textarea name="detay" cols="45" rows="7" class="form" id="detay"></textarea></td>
              </tr>
              <tr>
                <td colspan="2"><div align="center">
                  <input name="Submit" type="submit" class="form" value=" Ekle ">
                </div></td>
                </tr>
            </table>     
            </form></td>
        </tr>
    </table>   </td>
  </tr>
</table>
</body>
</html>
<!-- #include file="conn.asp"-->
<%sub ekle

Set muslimd = Server.CreateObject("ADODB.Recordset")
sord = "Select * from duyurular"
muslimd.Open sord,Sur,1,3
%>
<%
baslik = Request.Form("baslik")
detay = Request.Form("detay")
kime = Request.Form("kime")
tarih = Request.Form("tarih")

muslimd.addnew
muslimd("baslik") = baslik
muslimd("kime") = kime
muslimd("detay") = detay
muslimd("tarih") = tarih
muslimd.update

Response.redirect "duyuru.asp"
end sub
%>