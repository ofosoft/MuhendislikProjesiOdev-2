<div id="turuncukenar"><b><center>Yeni <em>"Ýþ Emri Hazýrlama"</em> Formumuz Kullanýma Açýlmýþtýr. <br>Ýlgili Form <em>"Makine Ýkmal"</em> Menüsü Altýndadýr.</center></b></div>
<div class="blokkenar"><div class="menubaslik">Bölgemizden Haberler | <a href="haber.asp?shf=1&tum_haberler.html">Tümü »</a><%for i=1 to 30%>&nbsp;<%next%><img src="images/yeni3.gif">&nbsp;<a href="\\b119ftp\Bölge Çalýþma Resimleri\VÝDEOLAR" target="_blank">Videolar</a></div>
<!--#include file="haberana2.asp"--></div>
<%if 1>2 then%><div class="blokkenar">!--#include file="iftarsayaci.asp"--><iframe border="0" src="iftarsayac.asp" width="100%" height="75px" scrolling="auto"></iframe></div><%end if%>
<div class="blokkenar" style="background-color:#198bd4;padding-bottom:6px; display:none;"><div class="menubaslik" style="margin-bottom:0px">Resim Galerimize Son Eklenen Resimler |  <a href="resimgalerisi.asp">Tümü »</a></div><!--#include file="anasayfaresim.asp"--><!--#include file="flashresimyeni2.asp"--></div>
<div class="blokkenar"><div class="menubaslik">Güncel Sivas Haberleri</div>
<iframe border="0" frameborder="0" src="http://www.sivasrehberim.net/siteneeklenen.asp?yer=haber&sayi=20&genislik=536&yukseklik=170&kenar=blue&kayma=1&yon=left&sekil=resimad&zemin=white&yazi=black&kalinlik=0&ryukseklik=90&rgenislik=115&pozisyon=yatay&hiz=1&font=5&font2=2" width="536" scrolling=no height="170" marginwidth="0" marginheight="0"></iframe>
</div>
<%if 1>23 then%>
<div class="blokkenar" style="height:100px"><%'reklam_goster(3)
%>
    <script src="js/jquery.js"  type="text/javascript"></script>
    <script src="js/interface.js" type="text/javascript"></script>
    <link href="css/dock-style.css" rel="stylesheet" type="text/css" />
    <!--dock menu JS options -->
<script type="text/javascript">	
	$(document).ready
	(
		function()
		{
			$('#dock').Fisheye
			(
				{
					maxWidth: 50,
					items: 'a',
					itemsText: 'span',
					container: '.dock-container',
					itemWidth: 40,
					proximity: 90,
					halign : 'center'
				}
			)
		}
	);
</script>
<div class="dock" id="dock">
  <div class="dock-container">
  <a class="dock-item" href ="file://sivas/BolgeSunumlari" onmouseover="this.style.cursor='hand'; "><img src="images/dock-sunu.png" alt="Sunum" /><span>Bölge Sunumlarý</span></a>               
  <a class="dock-item" style="display:none" href="EmekliTayin.aspx" onclick="window.open(this.href, 'child', 'left=120,top=50,scrollbars=yes,width=650,height=620'); return false"><img src="images/dock-anilar.png" alt="anýlar" /><span>Anýlar</span></a> 
  <a class="dock-item" href="http://10.119.1.13/VideoPlayer.aspx" target="_blank"><img src="images/dock-video.png" alt="video" /><span>Videolar</span></a>
  <a class="dock-item" href="http://10.119.1.13/FotoAlbum.aspx" target="_blank"><img src="images/dock-FotoIphone.png" alt="foto" /><span>Fotoðraf Arþivi</span></a> 
  <a class="dock-item" href="http://10.119.1.13/Egitim_Word.aspx" target="_blank"><img src="images/dock-word.png" alt="word" /><span>Word Eðitimi</span></a> 
  <a class="dock-item" href="http://10.119.1.13/Egitim_Excel.aspx" target="_blank"><img src="images/dock-excel.png" alt="excel" /><span>Excel Eðitimi</span></a>  
  <a class="dock-item" href="http://10.119.1.13/UTM.aspx" target="_blank"><img src="images/dock-google.png" alt="Google" /><span>UTM den Google Earth</span></a>  
  <a class="dock-item" href="http://10.119.1.13/GorevYollugu.aspx" target="_blank"><img src="images/dock-gy.png" alt="GY" /><span>Görev Yolluðu</span></a>
  <a class="dock-item" href="ftp://10.119.3.14/tempstore/scan/" target="_blank"><img src="images/dock-scan.png" alt="scan" /><span>Bölge Tarama</span></a>
  </div>
</div>
</div>
<%end if%>
<div class="blokkenar"><div class="menubaslik">Ulusal Haberler</div>
<div style="margin-top:00px">
<iframe border="0" src="http://www.ensonhaber.com/sondakika/index2.php" width="100%" height="705" scrolling="auto"></iframe></div>
</div>