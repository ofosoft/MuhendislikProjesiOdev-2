<!--#include file="bag.asp"-->
<%sorgum="Select * from personel_isci"
	Rs.Open Sorgum, Baglantim, 1, 3 
	do while not rs.eof
			resim=rs("foto")
			rs("foto")=replace(resim , "\wprs\RESIM-I\" , "resimler/personel_isci/" )
			rs.update
	rs.movenext
	loop
	rs.close
%>