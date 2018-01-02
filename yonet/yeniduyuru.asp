<!--#include file="bag.asp"-->
<html>
<head>
<!-- #include file="headic.asp" -->
<title><%=siteadi%> | <%=siteili%></title>
<link href="tema/<%=sitetema%>/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table border="0" width="100%" height="20" id="table2" cellpadding="0" style="border:1px solid #3F5D38; border-collapse: collapse; margin-top:1px; margin-bottom:1px" bgcolor="#F8F8F8">
	<tr>
		<td width="9%" style="padding-left: 5px" height="20">
		<img src="images/duyuru.gif"></td>
	    <td width="91%" style="padding-left: 5px">
  <% 	
	sorgum="Select * from duyurular where goster=true and kime=1 order by id desc"
	rs.Open Sorgum, Baglantim, 1, 3  
	if rs.eof or rs.bof then 
		Response.Write("<center>Kayýtlý Duyuru Bulunamadý.</center> ")
	else%>
    
        <SCRIPT language=JavaScript>
<!--
function SymError()
{
  return true;
}
window.onerror = SymError;
//-->
</SCRIPT>
          <SCRIPT type=text/javascript>
var scrollerdelay='2000'
var scrollerwidth='100%'
var scrollerheight='32px'
var scrollerbgcolor=''
var scrollerbackground='scrollerback.gif'
var messages=new Array()</SCRIPT>
          <SCRIPT>
document.write('')
document.write('')
<!--  -->
messages["0"]="<table border=0 cellpadding='1' cellspacing='0' style='border-collapse: collapse' bordercolor='#F7F7F7' width=100%><tr><td width=100%><a href='firmaekle.asp'><font color=#3333CC><B><%=siteili%> Firma Rehberi</B></font><BR>Sitemize Firmanýzý Ekleyebilir. Eklediðiniz Firmanýzýn bilgilerini, resimlerini internet kullanýcýlarý ile paylaþabilirsiniz... Eklemek Ýçin Burayý Týklayýnýz...» </a></td></td></tr></table>"
messages["1"]="<table border=0 cellpadding='1' cellspacing='0' style='border-collapse: collapse' bordercolor='#F7F7F7' width=100%><tr><td width=100%><a href='uyeol.asp'><font color=#3333CC><B><%=siteadi%>'a Üye Olun.</B></font><BR>Sitemizden tam olarak faydalanabilmeniz için buraya týklayarak üye olunuz...» </a></td></td></tr></table>"
	<% ds=1  
	   do while not rs.eof
 	   if rs.eof then exit do
	   ds=ds+1%>
			

messages["<%=ds%>"]="<table border=0 cellpadding='1' cellspacing='0' style='border-collapse: collapse' bordercolor='#F7F7F7' width=100%>
<tr><td width=100%><a href='#'>
<font color=#3333CC><B><%=rs("baslik")%></B> [ <%=rs("tarih")%> ]</font><BR><%=left(rs("detay"),150)%><%=adres%>...» </a></td></td></tr></table>"
<% rs.movenext
			loop
		end if
		rs.close %>
document.write('')
document.write('')
document.write('')
  </SCRIPT>
          <SCRIPT>
var ie=document.all
var dom=document.getElementById
if (messages.length>2)
i=2
else
i=0
function move(whichdiv){
tdiv=eval(whichdiv)
if (parseInt(tdiv.style.top)>0&&parseInt(tdiv.style.top)<=5){
tdiv.style.top=0+"px"
setTimeout("move(tdiv)",scrollerdelay)
setTimeout("move2(second2_obj)",scrollerdelay)
return
}
if (parseInt(tdiv.style.top)>=tdiv.offsetHeight*-1){
tdiv.style.top=parseInt(tdiv.style.top)-5+"px"
setTimeout("move(tdiv)",50)
}
else{
tdiv.style.top=parseInt(scrollerheight)+"px"
tdiv.innerHTML=messages[i]
if (i==messages.length-1)
i=0
else
i++
}
}
function move2(whichdiv){
tdiv2=eval(whichdiv)
if (parseInt(tdiv2.style.top)>0&&parseInt(tdiv2.style.top)<=5){
tdiv2.style.top=0+"px"
setTimeout("move2(tdiv2)",scrollerdelay)
setTimeout("move(first2_obj)",scrollerdelay)
return
}
if (parseInt(tdiv2.style.top)>=tdiv2.offsetHeight*-1){
tdiv2.style.top=parseInt(tdiv2.style.top)-5+"px"
setTimeout("move2(second2_obj)",50)
}
else{
tdiv2.style.top=parseInt(scrollerheight)+"px"
tdiv2.innerHTML=messages[i]
if (i==messages.length-1)
i=0
else
i++
}
}
function startscroll(){
first2_obj=ie? first2 : document.getElementById("first2")
second2_obj=ie? second2 : document.getElementById("second2")
move(first2_obj)
second2_obj.style.top=scrollerheight
second2_obj.style.visibility='visible'
}
if (ie||dom){
document.writeln('<div id="main2" style="position:relative;width:'+scrollerwidth+';height:'+scrollerheight+';overflow:hidden;background-color:'+scrollerbgcolor+' ;background-image:url('+scrollerbackground+')">')
document.writeln('<div style="position:absolute;width:'+scrollerwidth+';height:'+scrollerheight+';clip:rect(0 '+scrollerwidth+' '+scrollerheight+' 0);left:0px;top:0px">')
document.writeln('<div id="first2" style="position:absolute;width:'+scrollerwidth+';left:0px;top:1px;">')
document.write(messages[0])
document.writeln('</div>')
document.writeln('<div id="second2" style="position:absolute;width:'+scrollerwidth+';left:0px;top:0px;visibility:hidden">')
document.write(messages[dyndetermine=(messages.length==1)? 0 : 1])
document.writeln('</div>')
document.writeln('</div>')
document.writeln('</div>')
}
if (window.addEventListener)
window.addEventListener("load", startscroll, false)
else if (window.attachEvent)
window.attachEvent("onload", startscroll)
else if (ie||dom)
window.onload=startscroll
  </SCRIPT>
        
        
        
        
        </td>
	</tr>
</table>
</body> 
</html>
