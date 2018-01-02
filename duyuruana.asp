<!-- Duyuru Modülü -->
<script type="text/javascript" src="ofosoft_js/dyrcode.js"></script>
<%
sira=0
	sorgum="Select top 5 * from haber where goster=1 and turu=1 order by hkodu desc"
	rv.Open Sorgum, Baglantim, 1, 3  
	if rv.eof or rv.bof then 
%>
	  <center><img src="/images/interact.png"><br><br>Kayýtlý Toplantý / Duyuru Bulunmamaktadýr.</center>
<%else%>
<script id="Scroller" type="text/javascript">
<!--
sts_bs("jwscroller048a",[20080623,"","","/images/bosluk.gif",0,1,1,3,"100%","left",10,0,15,15,1,130,0,1,130,5000,3,40,2,"stEffect(\"scroll(Rate=24,enabled=0,Duration=0.55)\")",-2,55],["solid",1,"#ffffff","#FFFFFF","","repeat-y"]);

<%'rv.pagesize = 10
do while not rv.eof
if rv.eof then exit do  
%>
sts_pag(["#333333","10pt Tahoma","#FFFFFF","none","#333333","10pt Tahoma","#FFFFFF","none","#f8a235","10pt Tahoma","#FFFFFF","none","#f8a235","10pt Tahoma","#FFFFFF","none"]);
sts_sbd([0],["solid",0,"#DFDFDF"]);
sts_tbd([0],["solid",0,"#DFDFDF"]);
sts_ai("i<%=sira%>",[0,"<%=rv("baslik")%>\r\n\r\n<%=rv("ekleme")%>","/haberler-<%= rv("hkodu")%>-<%=cevir(rv("baslik"))%>.html","_self","/images/bosluk.gif",1,1,"left"],["transparent","9pt Tahoma","#000000","none","9pt Tahoma","#CC0000","none"]);
<%sira=sira+ 1%>
<%
rv.movenext
loop
%>
sts_es();
//-->
</script>
<% end if
   rv.close%>