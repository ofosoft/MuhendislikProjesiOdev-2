<%gun=day(now)
if gun=11 then
isaat="20:10:00"	: ogun=3
elseif gun=12 then
isaat="20:10:00"	: ogun=4
elseif gun=13 then
isaat="20:09:00"	: ogun=5
elseif gun=14 then
isaat="20:10:00"	: ogun=6
elseif gun=15 then
isaat="20:08:00"	: ogun=7
elseif gun=16 then
isaat="20:08:00"	: ogun=8
elseif gun=17 then
isaat="20:07:00"	: ogun=9
elseif gun=18 then
isaat="20:06:00"	: ogun=10
elseif gun=19 then
isaat="20:06:00"	: ogun=11
elseif gun=20 then
isaat="20:05:00"	: ogun=12
elseif gun=21 then
isaat="20:04:00"	: ogun=13
elseif gun=22 then
isaat="20:04:00"	: ogun=14
elseif gun=23 then
isaat="20:03:00"	: ogun=15
elseif gun=24 then
isaat="20:02:00"	: ogun=16
elseif gun=25 then
isaat="20:01:00"	: ogun=17
elseif gun=26 then
isaat="20:00:00"	: ogun=18
elseif gun=27 then
isaat="20:00:00"	: ogun=19
elseif gun=28 then
isaat="19:59:00"	: ogun=20
elseif gun=29 then
isaat="19:58:00"	: ogun=21
elseif gun=30 then
isaat="19:57:00"	: ogun=22
elseif gun=31 then
isaat="19:56:00"	: ogun=23
elseif gun=1 then
isaat="19:55:00"	: ogun=24
elseif gun=2 then
isaat="19:54:00"	: ogun=25
elseif gun=3 then
isaat="19:53:00"	: ogun=26
elseif gun=4 then
isaat="19:51:00"	: ogun=27
elseif gun=5 then
isaat="19:50:00"	: ogun=28
elseif gun=6 then
isaat="19:49:00"	: ogun=29
else
isaat="19:48:00"	: ogun=30
end if
%>
<div style="border:solid 0px;
border-color:#976b3e;
background:#e0001a url('../ofosoft_img/baslikbggg.jpg');
padding:5px;
color: #f8f8f8;
font-size: 13px;	font-weight:bold;
font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;
text-align:center;
border-radius: 5px;"><%=ogun%>. Orucun Ýftar Vaktine » <%
tarihsaat = Cdate(""&date&" "&isaat&"") ' Varilacak zaman..
saniye=DateDiff("s" ,now,tarihsaat)
kalansaniye=saniye Mod 60
dakika = Int(saniye/60)
kalandakika=dakika Mod 60
saat=Int(dakika/60)
kalansaat=saat  Mod 24
kalangun=Int(saat/24)
kalanzaman="<em><font color=#9dffab>"&kalansaat&" Saat "&kalandakika&" Dakika</font></em>"
Response.Write kalanzaman
%> Kaldý. [ <%=isaat%> ]
</div>