<!--#include file="solmenustil.asp"-->
<div class="sidebarmenu">
  <ul id="sidebarmenu1">
 <li><a href="default.asp">Ana Sayfa</a></li>
    <li><a href="#">DS� Genel M�d�rl���</a>
		  <ul>				
			<li style="display:none"><a href="http://edys" target="_blank">EDYS</a></li>
			<li><a href="http://dsipaylasim/" target="_blank">DS� Payla��m</a></li>    	
			<li><a href="http://www.dsi.gov.tr" target="_blank">DS� Web Sitesi</a></li>
			<li style="display:none"><a href="https://posta.dsi.gov.tr" target="_blank">E-Posta (Outlook)</a></li>
			<li style="display:none"><a href="http://misnet" target="_blank">MIS.Net</a></li>
			<li style="display:none"><a href="http://dsinet" target="_blank">DS� Net</a></li>
			<li><a href="http://emlakenvanter" target="_blank">Emlak Envanter</a></li>
			<li><a href="http://kuyulog/" target="_blank">Kuyu Loglar�</a></li>    	
			<li><a href="dsitelefon.asp">Telefon Rehberi</a></li>
			<li><a href="http://yazilimnet" target="_blank">Su Kalitesi</a></li>
			<li><a href="http://dsisvt/" target="_blank">Su Veri Taban�</a></li>
			<li><a href="http://ybds/" target="_blank">YBDS</a></li>
			<li><a href="http://dsilab/" target="_blank">DS� Lab</a></li>
		</ul>
    </li>  
            <li><a href="#">DS� 19.B�lge M�d�rl���</a>
				<ul>				
						<li style="display:none"><a href="telefonrehberi.asp?shf=1">Telefon Rehberi</a> </li>
					    <li><a href="file://dsi19" target="_blank">B�lge FTP</a></li>                        
					    <%if 1>2 then%>
						<li><a href="#">Bilgi Teknolojileri</a>
					      <ul>
                            <li><a href="http://sivaseski/Telefon.aspx" target="_blank">Telefon �cretleri</a> </li>
                            <li><a href="http://sivaseski/TelFatura.aspx" target="_blank">Telefon Faturalar�</a> </li>
                            <li><a href="http://sivaseski/Telsizler.aspx" target="_blank">Telsiz Envanteri</a> </li>
					      </ul>
					    </li>
					    <li style="display:noen"><a href="#">Personel E�itim</a>
					    <ul>
                                <li><a href="http://sivaseski/GorevYollugu.aspx" target="_blank">G�rev Yollu�u Bildirimi</a> </li>
                                <li><a href="http://sivaseski/IsAnalizi.aspx" target="_blank">�� Analizi Anket Formu</a> </li>          
                                <li><a href="http://sivaseski/GorevTanimi.aspx" target="_blank">G�rev Tan�m� Formu</a></li>
					    </ul>
					    </li>
						<%end if%>
						<%
							sorgum="Select * from sayfa where goster=true and turu=1 and id=6 order by id asc"
							ru.Open Sorgum, Baglantim, 1, 3  
							if ru.eof or ru.bof then 
							else%>
							<% do while not ru.eof
							   if ru.eof then exit do
							%>
								<li><a href="/sayfa.asp?id=<%= ru("id") %>&<%=cevir(ru("adi"))%>.html" title="<%=ru("adi")%>"><%=ru("adi")%></a>
								
								<% 	askodu=ru("id")
							sorgum="Select * from sayfa where goster=true and turu=0 and askodu="&askodu&" order by adi asc"
							rv.Open Sorgum, Baglantim, 1, 3  
							if rv.eof or rv.bof then 
							else%>
							<ul>
							<% do while not rv.eof
							   if rv.eof then exit do
							%>
								<li><a href="/sayfa.asp?id=<%= rv("id") %>&<%=cevir(ru("adi"))%>_<%=cevir(rv("adi"))%>.html" title="<%=rv("adi")%>"><%=rv("adi")%></a></li>
							<% rv.movenext
							loop%>
							</ul>
							<%end if
							rv.close%> 
							</li>
							<% ru.movenext
							loop%>
							<%end if
							ru.close
						 %> 
					    <li><a href="#">Destek Hizmetleri</a>
							<ul>
								<li><a href="http://sivaseski/Gziyaret.aspx" target="_blank">Ziyaret�iler</a></li>
								<li><a href="http://sivaseski/LojmanXml.aspx" target="_blank">Lojmanlar</a> </li>
								<li><a href="http://sivaseski/OtelGor.aspx" target="_blank" target="_blank">Misafirhane Rezervasyon</a> </li>
								<li><a href="http://sivaseski/MishaneUcretleri.aspx" target="_blank">Misafirhane �cretleri</a> </li>
								<li><a href="http://sivaseski/Kutuphane.aspx" target="_blank">K�t�phane</a> </li>
							</ul>
					    </li>
						
					    <li><a href="#">Et�t Plan</a>
                            <ul>
                                <li><a href="http://sivaseski/Agi.aspx" target="_blank">Ak�m G�zlem �stasyonlar�</a></li>
                                <li><a href="http://sivaseski/Pafta_Index.aspx" target="_blank">Harita Pafta Fihristi</a> </li>
                                <li><a href="http://10.119.1.19:8060" target="_blank">UTM den Google Map</a> </li>
                            </ul>
                        </li>
 
						<li><a href="#">Strateji</a>
					        <ul>
                                <li><a href="file:\\dsi19\19.B�lge tan�t�m\TAKD�M 2016 SON (ftp ye at�lan)" target="_blank">2016 Takdim Sunumlari</a></li>
					        </ul>
					    </li> 
                                        
                </ul>
            </li>
            <li><a href="http://sivaseski/GorevYollugu.aspx" target="_blank">G�rev Yollu�u Bildirimi</a> </li>
			<li><a href="http://10.119.1.19:8060" target="_blank">UTM'den Google Earth</a> </li>
            <li><a>Panel</a>
                <ul>
			<li><a href="/yonet" target="_blank">Yeni Portal Paneli</a> </li>
			<li><a href="http://sivaseski/SifreOnay.aspx?url=panel/MemurMesai.aspx" target="_blank" target="_blank">Memur Mesaileri</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/EventKayit.aspx" target="_blank" target="_blank">Toplant�lar, Faaliyetler</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/MisafirhaneUcret.aspx" target="_blank" target="_blank">Misafirhane �cretleri</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/Ziyaretciler.aspx" target="_blank" target="_blank">Ziyaret�i Giri�-��k���</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/Araclar.aspx" target="_blank" target="_blank">Ara� Giri�-��k��lar�</a> </li>
			<li><a href="http://sivaseski/SifreOnay.aspx?url=panel/TelefonUcret.aspx" target="_blank" target="_blank">Telefon �cretleri</a> </li>
                        <li><a href="http://sivaseski/panel/TelsizGiris.aspx?url=panel/TelsizGiris.aspx" target="_blank" onclick="window.open(this.href, 'child', 'left=100,top=80,scrollbars=yes,width=770,height=670'); return false">Telsizler</a></li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/TelefonFatura.aspx" target="_blank" target="_blank">Telefon Faturalar�</a> </li>                        
			<li><a href="http://sivaseski/SifreOnay.aspx?url=panel/MalzemeOcaklari.aspx" target="_blank" target="_blank">Malzeme Ocaklar�</a> </li>
                        <li><a href="http://sivaseski/CBS_Guncelle.aspx" target="_blank" onclick="window.open(this.href, 'child', 'left=300,top=200,scrollbars=no,width=350,height=500'); return false">Co�rafi Bilgi Sistemi</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/NesKayit.aspx" target="_blank" target="_blank">NES</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/Kutuphane.aspx" target="_blank" target="_blank">K�t�phane</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/AkimGozlem.aspx" target="_blank" target="_blank">Ak�m G�zlem</a> </li>
                        <li><a href="http://sivaseski/SifreOnay.aspx?url=panel/Otel.aspx" target="_blank" target="_blank">Misafirhane Rezervasyon</a> </li>
                </ul>
            </li>   
<li style="display:none"><a href="resimgalerisi.asp">Resim Galerisi</a>
<%
sorgum="select * from galeri_kat where goster=1 order by isim asc"
Ru.Open Sorgum, Baglantim, 1, 3
ks=ru.recordcount
if ks<>0 then
response.Write("<ul>")
do while not ru.eof
if ru.eof then exit do  
%>
<li><a href="/resimgalerileri.asp?id=<%=ru("id")%>&shf=1&<%=cevir(ru("isim"))%>.html" title="<%=ru("isim")%>"><%=ru("isim")%></a></li>
<% ru.movenext
loop
response.Write("</ul>")
end if
ru.close%> 
</li>	
<li style="display:none"><a href="/videogalerisi.asp">Video Galerisi</a>
<%
sorgum="select * from video_kat where goster=1 order by isim asc"
Ru.Open Sorgum, Baglantim, 1, 3
ks=ru.recordcount
if ks<>0 then
response.Write("<ul>")
do while not ru.eof
if ru.eof then exit do  
%>
<li><a href="/videolar.asp?id=<%=ru("id")%>&shf=1&<%=cevir(ru("isim"))%>.html"><%=ru("isim")%></a></li>
<% ru.movenext
loop
response.Write("</ul>")
end if
ru.close%> 
</li>		
 <%
 	sorgum="Select * from sayfa where goster=true and turu=1 and id<>6 order by id asc"
	ru.Open Sorgum, Baglantim, 1, 3  
	if ru.eof or ru.bof then 
	else%>
    <% do while not ru.eof
	   if ru.eof then exit do
	%>
		<li><a href="/sayfa.asp?id=<%= ru("id") %>&<%=cevir(ru("adi"))%>.html" title="<%=ru("adi")%>"><%=ru("adi")%></a>
		
		<% 	askodu=ru("id")
	sorgum="Select * from sayfa where goster=true and turu=0 and askodu="&askodu&" order by adi asc"
	rv.Open Sorgum, Baglantim, 1, 3  
	if rv.eof or rv.bof then 
	else%>
	<ul>
	<li><a href="/sayfa.asp?id=<%= ru("id") %>&<%=cevir(ru("adi"))%>.html" title="<%=ru("adi")%>"><%=ru("adi")%></a></li>
    <% do while not rv.eof
	   if rv.eof then exit do
	%>
		<li><a href="/sayfa.asp?id=<%= rv("id") %>&<%=cevir(ru("adi"))%>_<%=cevir(rv("adi"))%>.html" title="<%=rv("adi")%>"><%=rv("adi")%></a></li>
	<% rv.movenext
	loop%>
	</ul>
	<%end if
	rv.close%> 
	</li>
	<% ru.movenext
	loop%>
	<%end if
	ru.close
 %> 
 					    <li><a href="#">Makine �kmal</a>
							<ul>
								<li><a href="http://sivaseski/Garac.aspx" target="_blank">Ara� Giri�-��k��lar�</a> </li>
								<li><a href="aractalep.xlsx" target="_blank">Ara� Talep</a> </li>
								<li><a href="http://sivaseski/IsMakTalep.aspx" target="_blank">�� Makinesi Talep</a> </li>
								<li><a href="MalzemeTalep.xls">Malzeme Talep Formu</a> </li>                    
								<li><a href="isemri.asp">�� Emri</a> </li>
								<li><a href="file:\\dsi19\makina\tasit_takip_cetveli.xlsx" target="blank">Ta��t Takip Cetveli</a> </li>                    
								<li><a href="file:\\dsi19\makina\is_makinalari_takip_cetveli.xlsx" target="blank">�� Makinas� Takip Cetveli</a> </li>
								<li><a href="file:\\dsi19\makina\S�V�L ARA� TAK�P KARTI.doc" target="blank">Kiral�k Ara� Takip</a> </li>
							</ul>
					    </li> 
	<li><a href="file:\\dsi19\bt\E�itim Videolar�" target="_blank">E�itim Videolar�</a></li>
	<li><a href="emlakarsiv.asp">Emlak Ar�iv Kay�tlar�</a></li>
</ul>
</div>