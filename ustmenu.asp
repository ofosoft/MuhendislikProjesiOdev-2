<div id="cssmenu">				
<ul>
<li><a href="<%=siteurl%>" title="Ana Sayfa" ><span><i class="fa fa-home"></i> <%=klm(1)%></span></a></li>
<li><a href="/sayfa.asp?id=1&bolgemiz"><span><i class="fa fa-building-o"></i> <%=klm(2)%></span></a>
<ul>
            <li><a href="#">DS� 19.B�lge M�d�rl��� <i style="float:right; margin-top:7px;" class="fa fa-angle-right" aria-hidden="true"></i></a>
				<ul><%if 3>2 then%>
					<li><a href="#" ><i style="float:left; margin-top:7px;" class="fa fa-laptop" aria-hidden="true"></i>&nbspBilgi Teknolojileri �b. Md.
						<i style="float:right; margin-top:7px;" class="fa fa-angle-right" aria-hidden="true"></i></a>
					      <ul>
                            <li><a href="http://sivaseski/Telefon.aspx" target="_blank">Telefon �cretleri</a> </li>
                            <li><a href="http://sivaseski/TelFatura.aspx" target="_blank">Telefon Faturalar�</a> </li>
                            <li><a href="http://sivaseski/Telsizler.aspx" target="_blank">Telsiz Envanteri</a> </li>
							<li><a href="file://DSI19/bt" target="_blank">BT FTP</a> </li>
					      </ul>
					    </li>
					    <li><a href="#"><i style="float:left; margin-top:7px;" class="fa fa-users" aria-hidden="true"></i>&nbspPersonel E�itim �b. Md. 
						<i style="float:right; margin-top:7px;" class="fa fa-angle-right" aria-hidden="true"></i></a>
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
								<li><a href="/sayfayeni.asp?id=<%= ru("id") %>&<%=cevir(ru("adi"))%>.html" title="<%=ru("adi")%>"><%=ru("adi")%></a>
								
								<% 	askodu=ru("id")
							sorgum="Select * from sayfa where goster=true and turu=0 and askodu="&askodu&" order by adi asc"
							rv.Open Sorgum, Baglantim, 1, 3  
							if rv.eof or rv.bof then 
							else%>
							<ul>
							<% do while not rv.eof
							   if rv.eof then exit do
							%>
								<li><a href="/sayfayeni.asp?id=<%= rv("id") %>&<%=cevir(ru("adi"))%>_<%=cevir(rv("adi"))%>.html" title="<%=rv("adi")%>"><%=rv("adi")%></a></li>
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
					    <li><a href="#">Makine �kmal �b. Md. <i style="float:right; margin-top:7px;" class="fa fa-angle-right" aria-hidden="true"></i></a>
							<ul>
								<li><a href="http://sivaseski/Garac.aspx" target="_blank">Ara� Giri�-��k��lar�</a> </li>
								<li><a href="aractalep.xlsx" target="_blank">Ara� Talep</a> </li>
								<li><a href="http://sivaseski/IsMakTalep.aspx" target="_blank">�� Makinesi Talep</a> </li>
								<li><a href="MalzemeTalep.xls">Malzeme Talep Formu</a> </li>                    
								<li><a href="isemri.asp">�� Emri</a> </li>
								<li><a href="file:\\dsi19\makina\tasit_takip_cetveli.xlsx" target="blank">Ta��t Takip Cetveli</a> </li>                    
								<li><a href="file:\\dsi19\makina\is_makinalari_takip_cetveli.xlsx" target="blank">�� Makinas� Takip Cetveli</a> </li>
							</ul>
					    </li>  						

					    <li><a href="#">Destek Hizmetleri �b. Md. <i style="float:right; margin-top:7px;" class="fa fa-angle-right" aria-hidden="true"></i></a>
							<ul>
									<li><a href="http://sivaseski/Gziyaret.aspx" target="_blank">Ziyaret�iler</a></li>
									<li><a href="http://sivaseski/LojmanXml.aspx" target="_blank">Lojmanlar</a> </li>
									<li><a href="http://sivaseski/OtelGor.aspx" target="_blank" target="_blank">Misafirhane Rezervasyon</a> </li>
									<li><a href="http://sivaseski/MishaneUcretleri.aspx" target="_blank">Misafirhane �cretleri</a> </li>
									<li><a href="http://sivaseski/Kutuphane.aspx" target="_blank">K�t�phane</a> </li>
							</ul>
					    </li>
						
					    <li><a href="#">Havza Y�netimi �b. Md. <i style="float:right; margin-top:7px;" class="fa fa-angle-right" aria-hidden="true"></i></a>
                            <ul>
                                <li><a href="http://sivaseski/Agi.aspx" target="_blank">Ak�m G�zlem �stasyonlar�</a></li>
                                <li><a href="http://sivaseski/Pafta_Index.aspx" target="_blank">Harita Pafta Fihristi</a> </li>
                                <li><a href="http://sivaseski/UTM.aspx" target="_blank">UTM den Google Map</a> </li>
                            </ul>
                        </li>
						<li><a href="#">Emlak Kamula�t�rma �b. Md. <i style="float:right; margin-top:7px;" class="fa fa-angle-right" aria-hidden="true"></i></a>
					        <ul>
                                <li><a href="http://sivaseski/EmlakArsiv.aspx" target="_blank">Ar�iv</a></li>
					        </ul>
					    </li> 
						<li><a href="#">Strateji �b. Md. <i style="float:right;" class="fa fa-angle-right" aria-hidden="true"></i></a>
					        <ul>
                                <li><a href="file:\\dsi19\19.B�lge tan�t�m\TAKD�M 2016 SON (ftp ye at�lan)" target="_blank">2016 Takdim Sunumlari</a></li>
					        </ul>
					    </li> 
                                        
                </ul>
            </li>
<% 	
	sorgum="Select * from sayfa where goster=true and turu=0 and askodu=1 order by adi asc"
	rv.Open Sorgum, Baglantim, 1, 3  
	if rv.eof or rv.bof then 
	else%>
	
		<li><a href="/sayfayeni.asp?id=1&hakkimizda.html" title="Hakk�m�zda">Hakk�m�zda</a></li>
    <% do while not rv.eof
	   if rv.eof then exit do
	%>
		<li><a href="/sayfayeni.asp?id=<%= rv("id") %>&hakkimizda_<%=cevir(rv("adi"))%>.html" title="<%=rv("adi")%>"><%=rv("adi")%></a></li>
	<% rv.movenext
	loop%>
	
	<%end if
	rv.close%> 
	
	</ul>
</li>
<li><a href="#"><span><i class="fa fa-building"></i> GENEL M�D�RL�K</a>
	<ul>				
		<li><a href="http://www.dsi.gov.tr" target="_blank"><i class="fa fa-globe" aria-hidden="true"></i> DS� Web Sitesi</a></li>
		<li><a href="http://emlakenvanter" target="_blank"><i class="fa fa-map-o" aria-hidden="true"></i> Emlak Envanter</a></li>
		<li><a href="http://kuyulog/" target="_blank"><i class="fa fa-download" aria-hidden="true"></i> Kuyu Loglar�</a></li>    	
		<li><a href="dsitelefon.asp"><i class="fa fa-phone" aria-hidden="true"></i> Telefon Rehberi</a></li>
		<li><a href="http://yazilimnet" target="_blank"><i class="fa fa-tint" aria-hidden="true"></i> Su Kalitesi</a></li>
		<li><a href="http://dsisvt/" target="_blank"><i class="fa fa-database" aria-hidden="true"></i> Su Veri Taban�</a></li>
		<li><a href="http://dsilab/" target="_blank"><i class="fa fa-flask" aria-hidden="true"></i> DS� Lab</a></li>
	</ul>
</li> 
<li><a href="/haberyeni.asp?shf=1&tum_haberler.html"><span><i class="fa fa-newspaper-o"></i> <%=klm(5)%></span></a></li>
<li><a href="defteroku.asp?shf=1&tum_mesajlar.html" title="Ziyaret�i Defteri"><span><i class="fa fa-book"></i> <%=klm(8)%></span></a>
<ul>
  <li><a href="defteroku.asp?shf=1&tum_mesajlar.html"><i class="fa fa-book"></i> <%=klm(24)%></a></li>
  <li><a href="/deftereyaz.asp"><i class="fa fa-pencil-square-o"></i> <%=klm(25)%></a></li>
</ul>
</li>
<%if mn15=1 then%>
<li><a href="#"><span><i class="fa fa-play-circle"></i> <%=klm(7)%></span></a>
	<ul>
		<li><a href="resimgalerisiyeni.asp"><span><i class="fa fa-picture-o"></i> <%=klm(22)%></span></a></li>
		<li><a href="videogalerisiyeni.asp"><span><i class="fa fa-youtube-play"></i> <%=klm(23)%></span></a></li>
	</ul>
</li>
<%end if%>

<li><a href="#"><span><i class="fa fa-hand-pointer-o"></i> <%=klm(74)%></span></a>
	<ul>
		<li><a href="rezervasyon"><i class="fa fa-cutlery" aria-hidden="true"></i> Yemekhane Rezervasyon</a></li>
		<li><a href="/sayfayeni.asp?id=16&Servis_Saateleri.html"><i class="fa fa-bus" aria-hidden="true"></i> Servis Saatleri</a></li>
		<li><a href="ftp://10.119.3.14/tempstore/scan/" target="_blank"><i class="fa fa-qrcode" aria-hidden="true"></i> OCE (TDS600) Tarananlar</a></li>
		<li><a href="/sayfayeni.asp?id=11&2._El_E%FEya_Pazar%FD_Al%FDm_%DDlanlar%FD.html"><i class="fa fa-cart-arrow-down" aria-hidden="true"></i> Al�m �lanlar�</a></li>
		<li><a href="/sayfayeni.asp?id=12&2._El_E%FEya_Pazar%FD_Sat%FDm_%DDlanlar%FD.html"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Sat�m �lanlar�</a></li>
	</ul>
</li>
<li><a href="#"><span><i class="fa fa-star"></i> <%=klm(73)%></span></a>
	<ul>
		<li><a href="Ilc/tarihcemiz.html"><i class="fa fa-history" aria-hidden="true"></i> Tarih�emiz</a></li>
		<li><a href="Ilc/gezilecek-yerler.html"><i class="fa fa-location-arrow" aria-hidden="true"></i> Gezilecek Yerler</a></li>
		<li><a href="Ilc/cografyasi.html"><i class="fa fa-map-o" aria-hidden="true"></i> Co�rafyas�</a></li>
		<li><a href="Ilc/kultur-turizm.html"><i class="fa fa-cubes" aria-hidden="true"></i> K�lt�r & Turizm</a></li>
		<li><a href="http://www.sivasspor.com.tr" target="_blank"><i class="fa fa-futbol-o" aria-hidden="true"></i> Sivasspor'umuz</a></li>
	</ul>
</li>
<li><a href="iletisim.asp" title="�leti�im Bilgilerimiz"><span><i class="fa fa-phone"></i> <%=klm(9)%></span></a>
<ul>
	<li><a href="iletisim.asp" title="�leti�im Bilgilerimiz"><span><i class="fa fa-phone"></i> �leti�im Bilgilerimiz</span></a></li>
	<li><a href="https://www.facebook.com/dsi19blgmd/" target="_blank" title="Facebook Hesab�m�z"><span><i class="fa fa-facebook-square"></i> Resmi Facebook Sayfam�z</span></a></li>
	<li><a href="https://twitter.com/dsi_19_blgmd" target="_blank" title="Twitter'da Takip Et"><span><i class="fa fa-twitter"></i> Resmi Twitter Sayfam�z</span></a></li>
</ul>
</li>
</ul>
</div>