<div id="turuncukenar"><b><center>Yeni <em>"�� Emri Haz�rlama"</em> Formumuz Kullan�ma A��lm��t�r. <br>�lgili Form <em>"Makine �kmal"</em> Men�s� Alt�ndad�r.</center></b></div>
<div class="blokkenar"><div class="menubaslik">B�lgemizden Haberler | <a href="haber.asp?shf=1&tum_haberler.html">T�m� �</a><%for i=1 to 30%>&nbsp;<%next%><img src="images/yeni3.gif">&nbsp;<a href="\\b119ftp\B�lge �al��ma Resimleri\V�DEOLAR" target="_blank">Videolar</a></div>
<!--#include file="haberana2.asp"--></div>
<%if 1>2 then%><div class="blokkenar">!--#include file="iftarsayaci.asp"--><iframe border="0" src="iftarsayac.asp" width="100%" height="75px" scrolling="auto"></iframe></div><%end if%>
<div class="blokkenar" style="background-color:#198bd4;padding-bottom:6px; display:none;"><div class="menubaslik" style="margin-bottom:0px">Resim Galerimize Son Eklenen Resimler |  <a href="resimgalerisi.asp">T�m� �</a></div><!--#include file="anasayfaresim.asp"--><!--#include file="flashresimyeni2.asp"--></div>
<div class="blokkenar"><div class="menubaslik">G�ncel Sivas Haberleri</div>
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
  <a class="dock-item" href ="file://sivas/BolgeSunumlari" onmouseover="this.style.cursor='hand'; "><img src="images/dock-sunu.png" alt="Sunum" /><span>B�lge Sunumlar�</span></a>               
  <a class="dock-item" style="display:none" href="EmekliTayin.aspx" onclick="window.open(this.href, 'child', 'left=120,top=50,scrollbars=yes,width=650,height=620'); return false"><img src="images/dock-anilar.png" alt="an�lar" /><span>An�lar</span></a> 
  <a class="dock-item" href="http://10.119.1.13/VideoPlayer.aspx" target="_blank"><img src="images/dock-video.png" alt="video" /><span>Videolar</span></a>
  <a class="dock-item" href="http://10.119.1.13/FotoAlbum.aspx" target="_blank"><img src="images/dock-FotoIphone.png" alt="foto" /><span>Foto�raf Ar�ivi</span></a> 
  <a class="dock-item" href="http://10.119.1.13/Egitim_Word.aspx" target="_blank"><img src="images/dock-word.png" alt="word" /><span>Word E�itimi</span></a> 
  <a class="dock-item" href="http://10.119.1.13/Egitim_Excel.aspx" target="_blank"><img src="images/dock-excel.png" alt="excel" /><span>Excel E�itimi</span></a>  
  <a class="dock-item" href="http://10.119.1.13/UTM.aspx" target="_blank"><img src="images/dock-google.png" alt="Google" /><span>UTM den Google Earth</span></a>  
  <a class="dock-item" href="http://10.119.1.13/GorevYollugu.aspx" target="_blank"><img src="images/dock-gy.png" alt="GY" /><span>G�rev Yollu�u</span></a>
  <a class="dock-item" href="ftp://10.119.3.14/tempstore/scan/" target="_blank"><img src="images/dock-scan.png" alt="scan" /><span>B�lge Tarama</span></a>
  </div>
</div>
</div>
<%end if%>
<div class="blokkenar"><div class="menubaslik">Ulusal Haberler</div>
<div style="margin-top:00px">
<iframe border="0" src="http://www.ensonhaber.com/sondakika/index2.php" width="100%" height="705" scrolling="auto"></iframe></div>
</div>