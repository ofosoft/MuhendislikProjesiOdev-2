		  
		   </div>
		  </div>	
		</div>
</div>
<div class="cnt_bottom"></div>
</div>

<center>    <div class="spacer"></div><div class="spacer"></div><div class="spacer"></div>
             <div class="footer" style="margin:5px;">
			 
             	<span class="copy"><%=copyright%> <a href="http://sivas/telefonrehberi.asp">&nbsp;&nbsp;&nbsp;&nbsp;</a></span>
				<div align="right">
<%
if 1>2 then
Response.Buffer = True
sayacgorunsun=1 ' SAYACIN GÖRÜNMESYNY YSTYYORSANIZ 1 DE?YLSE GYZLY OLMASI YÇYN 0 YAPIN
banlaacik =0  ' BANLA AÇIKSA 1 DE?YLSE 0
bansure   =25  'banlama zamany  saniye
banhak    =10   'banlamak için ziyaretçiye verilen hak adeti

db_veriyolu ="" & vtyolu & "/"& vtadi &""

set Sur = server.createobject("adodb.connection")
Sur.open "provider=microsoft.jet.oledb.4.0;data source=" & Server.mappath(db_veriyolu & ".mdb")
Set efkan = Server.CreateObject("ADODB.Recordset")
Set efkan1 = Server.CreateObject("ADODB.Recordset")
Set efkan2= Server.CreateObject("ADODB.Recordset")

Session.LCID = 1055
Session.CodePage = 1254

zamanmiktari=1 
ip_no=      Request.ServerVariables("REMOTE_ADDR") 

'GELEN YP YASAKLIMI BAK
sor = "SELECT * FROM yasakli where ip='"& ip_no &"'"
efkan.open sor, sur, 1, 3
If efkan.eof Then
Else
response.redirect "sayacadmin/banla.asp?islem=banla"
Response.End
end if
efkan.close

If banlaacik=1 then
sor = "SELECT * FROM online where ipno='"& ip_no &"'"
efkan.open sor, sur, 1, 3
If efkan.eof Then
efkan.addnew
efkan("ipno")=ip_no
efkan("zaman")=Now()
Session ("hak") = 1
elseif datediff("s",efkan("zaman"),Now())  < bansure and Session ("hak") < banhak  then
Session ("hak") = Session ("hak") + 1
response.redirect "sayacadmin/banla.asp?islem=uyar"
Response.End
elseif datediff("s",efkan("zaman"),Now())  < bansure and Session ("hak") => banhak  then
sor = "SELECT * FROM yasakli  "
efkan1.open sor, sur, 1, 3
efkan1.addnew
efkan1("ip")      = ip_no
efkan1("tarih")   = Now()
efkan1.update
efkan1.close
response.redirect "sayacadmin/banla.asp?islem=banla"
Response.End
else
'efkan("zaman")=now()
end if
efkan.update
efkan.Close
End if



'ONLYNE ZYYARETÇY
zamanmiktari=1 
ipno=Request.ServerVariables("REMOTE_ADDR")
sor = "SELECT * FROM online where ipno='"& ipno &"'"
efkan.open sor, sur, 1, 3

If efkan.eof Then
efkan.addnew
efkan("ipno")=ipno
efkan("zaman")=Now()
else
efkan("zaman")=Now()
end if
efkan.update
efkan.Close
sor = "SELECT * FROM online"
efkan.open sor, sur, 1, 3
Do While Not efkan.eof 
zaman=datediff("n",efkan("zaman"),Now())
if zaman > zamanmiktari then
sor = "DELETE FROM online WHERE  ipno = '"&efkan("ipno")&"'"
efkan1.open sor, sur, 1, 3
end if
efkan.movenext
Loop
onlineadet = efkan.RecordCount 'ONLINE TOPLAM ZYYARETCY
efkan.Close



'SAYAÇ BA?LA

ip_no=      Request.ServerVariables("REMOTE_ADDR") 
site_ad=    Request.ServerVariables("URL") 
site_gel=    Request.ServerVariables("HTTP_REFERER") 
if site_gel="" then 
site_gel="Direk Giris"
else
uzunluk=len(site_gel)
kisa=mid(site_gel,8,uzunluk) 
bul=instr(kisa,"/")
if bul<>"0" then
site_gel=mid(site_gel,1,bul+6) 
end if
end if

zaman=      mid(now(),1,10) 'BUGUN
if session("ziyaretaa")<>"yes" then


'EN ÇOK ZYYARET EDEN YPLER YP TOPLAM SAYACI
sor="Select * from say_ip where  ip_number like '"&ip_no&"' "  'YP YLKEZ GELYYORSA
efkan.Open sor,Sur,1,3
if efkan.eof then 
efkan.AddNew
efkan("ip_number")=ip_no
efkan("hit")="1"
efkan("vakit")=zaman
efkan.Update 
efkan.close 
tekil="ok"
else

if efkan("vakit") <> zaman then tekil="ok" else tekil="no" end if  'YP KAYITLI AMA BUGUN GELMEDYYSE T. SAY
efkan("hit")=efkan("hit")+1
efkan("vakit")=zaman
efkan.Update 
efkan.close 
end if


'GÜNLÜK HYTY 
Sor="Select * from say_hit where gun like '"&zaman&"'"
efkan.Open sor,Sur,1,3
if efkan.eof then 
efkan.AddNew
efkan("gun")=zaman
efkan("tekil")="1"
efkan("cogul")="1"
efkan.Update 
efkan.close 
else

if tekil="ok" then  'EGER BUGUN GELMEDY YSE
efkan("tekil")=efkan("tekil")+1
efkan("cogul")=efkan("cogul")+1
efkan.Update 
efkan.close 
else 'E?ER BUGUN ÖNCEDEN GYRY? YAPTISA
efkan("cogul")=efkan("cogul")+1
efkan.Update 
efkan.close 
end if
end if


end if

gunt=0
gunc=0
topt=0
topc=0

Sor="Select * from say_hit"
efkan.Open sor,Sur,1,3
toplamgun=efkan.recordcount  
Do while not efkan.Eof

if efkan("gun")=zaman then
gunt=efkan("tekil")
gunc=efkan("cogul")
end if

topt=efkan("tekil")+topt
topc=efkan("cogul")+topc
efkan.movenext
loop
efkan.close 

'gunluktekilortalama = topt / toplamgun
'gunlukcogulortalama = topc / toplamgun

Session("ziyaretaa")="yes"

%>
		<font color="#f8f8f8">Online :<strong> <%=onlineadet%></strong> | B&uuml;g&uuml;n :<strong> <%=gunt%> </strong> | Toplam : <strong> <%=topc%></strong></font>  &nbsp;&nbsp;&nbsp; 
<%end if%><a href="http://www.ofosoft.com" target="_blank"><img src="images/design_silme.png" alt="Web Tasarým" border="0" align="absmiddle" /></a>
</div>
</div></center>
</div>