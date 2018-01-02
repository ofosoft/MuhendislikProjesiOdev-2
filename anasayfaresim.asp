<%sorgum="Select top 30 * from galeri where onay=1 and goster=1 order by id desc"
ru.Open Sorgum, Baglantim, 1, 3
session("kayanresimsayisi")=ru.recordcount
kys=ru.recordcount
if kys>0 then
  do while not ru.eof
   if  ru.eof then exit do
   kss=kss+1
   session("kayanresimurl-"&kss&"")=ru("url")
   session("kayanresimadi-"&kss&"")=cevirascii(ru("isim"))
   ru.movenext
  loop
end if
ru.close
%>
