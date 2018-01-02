<script type="text/javascript">
function showMe(blockId) {
			document.getElementById(blockId).style.opacity = '0.80';
			document.getElementById(blockId).style.filter = 'alpha(opacity=80)'; }
function hideMe(blockId) {
			document.getElementById(blockId).style.opacity = '0.0';
			document.getElementById(blockId).style.filter = 'alpha(opacity=0)';
		  }
</script>

	<div class="container">
		<div id="kfust">
			<div class="row" id="ust">
				<div class="col-xs-12 col-md-6 hidden-xs">
					<div class="fustlink">
						<a href="yeni.asp" title="FOTO GALERÝ"><i class="fa fa-home"></i> ANASAYFA</a>
						<a href="file://b119ftp/Bölge%20Çalýþma%20Resimleri/VÝDEOLAR" target="_blank" title="Bölge Videolarý"><i class="fa fa-youtube-play"></i> VÝDEOLAR</a>
						<a class="text-right buyukharf" href="duyurular.asp" title="Duyurular"><i class="fa fa-volume-up"></i> Duyurular</a>
						<a href="javascript:;" onclick="showMe('gizlegoster');">Göster</a> 
						<a href="javascript:;" onclick="hideMe('gizlegoster');">Gizle</a>
					</div>
				</div>
				
				<div class="col-xs-12 col-md-6 hidden-xs">
					<div class="fustlink text-right">
						<a href="etkinlikler.asp" title="ETKÝNLÝK TAKVÝMÝ"><i class="fa fa-calendar"></i> ETKÝNLÝK TAKVÝMÝ</a>
						<a style="margin-right: 0px;" class="text-right" href="telefonrehberi.asp" title="Telefon Rehberi"><i class="fa fa-book"></i> TELEFON REHBERÝ</a>
					</div>
				</div>
			</div>
			<div id="gizlegoster" style=" background: #fff; margin-top: -10px; opacity:0.80; filter:alpha(opacity=80)">
				<div class="row">
					<div id="logo" class="col-md-8" style="margin-top:10px;">
						<a href="yeni.asp"><img src="images/sivassonlogo2.png" style="height:105px;" alt="SIVAS"/></a>
					</div>
					<div class="col-md-4">
						<div class="havabg">
							<div class="havadurumu">
								<div class="row">
									<div id="havasonucC" style="padding-top:10px">
										<a href="https://www.mgm.gov.tr/tahmin2016/il-ve-ilceler.aspx?m=SIVAS" target="_blank" title="Detaylý Hava Durumu Ýçin Týklayýnýz">
											<img src="http://www.mgm.gov.tr/sunum/sondurum-show-2.aspx?m=SIVAS&rC=ffff&rZ=fff" style="width:110px;" alt="SIVAS" />
											<img src="http://www.mgm.gov.tr/sunum/tahmin-show-2.aspx?m=SIVAS&basla=1&bitir=3&rC=fff&rZ=fff" style="width:260px; padding-right:20px" alt="SIVAS" />
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="inline10"></div>
				<script type="text/javascript">
					(function($) {
						$(document).ready(function() {
							$('#cssmenu').prepend('<div id="menu-button"><i class="fa fa-bars"></i> Menü</div>');
							$('#cssmenu #menu-button').on('click', function() {
								var menu = $(this).next('ul');
								if (menu.hasClass('open')) {
									menu.removeClass('open');
								} else {
									menu.addClass('open');
								}
							});
						});
					})(jQuery);
				</script>
				<!--#include file="ustmenu.asp"-->
			</div>
		</div>
		<script src="ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				var my_cookie = $.cookie($('.modal-check').attr('name'));
				if (my_cookie && my_cookie == "true") {
					$(this).prop('checked', my_cookie);
					console.log('checked checkbox');
				} else {
					$('#actionsModal').modal('show');
					console.log('uncheck checkbox');
				}
				$(".modal-check").change(function() {
					$.cookie($(this).attr("name"), $(this).prop('checked'), {
						path: '/',
						expires: 1
					});
				});
			});
		</script>			
    </div>

<%if 1>2 then%>		
		<div class='modal fade' id='actionsModal'>
			<div class='modal-dialog'>
				<div class='modal-content'>
					<div class='modal-header'>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class='modal-body'>
						<div class="row">
							<div class="col-md-12 text-center">
								<a href="#" target="_blank" title="Profesyonel e-ticaret scripti V4">
								<img src="tema/ofosoft/uploads/acilirmesaj/eticaret_slider.jpg" class="img-responsive" alt="Profesyonel e-ticaret scripti V4" title="Profesyonel e-ticaret scripti V4" style="margin: 0 auto;"></a>
							</div>
						</div>
					</div>
					<div class='modal-footer'>
						<div class="checkbox pull-right">
							<label>
								<input class='modal-check' name='modal-check' type="checkbox">TEKRAR GÖSTERME
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>

<%end if%>
<div class="container hidden-xs" style="position:relative;z-index:-1;top:0;">
	<div class="syfgnlana">
		<div class="row">	
			<!--#include file="hizlilinkler.asp"-->
		</div>
	</div>
</div>

