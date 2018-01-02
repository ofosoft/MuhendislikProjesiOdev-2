<% Response.CharSet = "windows-1254" %>
<!--#include file="bag.asp"-->
<%
'Formdan gelen veriyi alýyoruz
aranan = LCase(Request.QueryString("q"))
'Recordset açýlýyor
sorgum="select * from personel_memur where adi_soyadi Like '" & aranan & "%' and durum=1 order by sirano asc"
ras.Open Sorgum, Baglantim, 1, 3
If ras.RecordCount > 0 Then
	i = 1
	Sinirla = 10
	Do While Not ras.EOF And i < (Sinirla + 1)
		Response.Write ras("adi_soyadi") & vbCrlf
		i = i + 1
		ras.MoveNext
	Loop
End If
ras.Close

'Formdan gelen veriyi alýyoruz
aranan = LCase(Request.QueryString("q"))
'Recordset açýlýyor
sorgum="select * from personel_isci where adi_soyadi Like '" & aranan & "%' and durum=1 order by sirano asc"
ras.Open Sorgum, Baglantim, 1, 3
If ras.RecordCount > 0 Then
	i = 1
	Sinirla = 10
	Do While Not ras.EOF And i < (Sinirla + 1)
		Response.Write ras("adi_soyadi") & vbCrlf
		i = i + 1
		ras.MoveNext
	Loop
End If
ras.Close
%>