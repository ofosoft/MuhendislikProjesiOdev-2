    <div class="footbga hidden-xs">
        <div class="container-head">
            <div class="row">
                <div class="col-md-12">
                    <div class="fooute"><a href="index-2.html" title="Ana Sayfa"><i class="fa fa-home"></i> ANA SAYFA</a></div>
                    <div class="fooutee"><a href="iletisim.html" title="BÝZE ULAÞIN"><i class="fa fa-envelope"></i> BÝZE ULAÞIN</a></div>
                    <div class="fooutee"><a class="buyukharf" href="Kategori/duyurular.html" title="Duyurular"><i class="fa fa-volume-up"></i> DUYURULAR</a></div>
                    <div class="fooutee"><a href="etkinlikler.html" title="ETKÝNLÝK TAKVÝMÝ"><i class="fa fa-calendar"></i> ETKÝNLÝK TAKVÝMÝ</a></div>
                    <div class="fooutee"><a href="videolar.html" title="VÝDEOLAR"><i class="fa fa-youtube-play"></i> VÝDEOLAR</a></div>
                    <div class="fooutee"><a href="fotogaleri.html" title="FOTO GALERÝ"><i class="fa fa-camera"></i> FOTO GALERÝ</a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="footbgb bottom20 hidden-xs">
        <div class="container-head">
            <div class="row">
                <div class="col-md-5">
                    <div class="fooute hidden-xs"><i class="fa fa-phone-square"></i> 0346 227 09 05</div>
                    <div class="fooute hidden-xs"><i class="fa fa-envelope"></i> <a href="mailto:dsi19@dsi.gov.tr" title="Bize Yazýn">dsi19@dsi.gov.tr</a></div>
                </div>
                <div class="col-md-2">
                    <div class="text-center">
						<a href="yeni.asp"><img src="images/sivassonlogo2.png" style="height:90px;" alt="SIVAS"/></a>
					</div>
                </div>
                <div class="col-md-5">
                    <div class="text-right">
                        <a href="https://www.facebook.com/dsi19blgmd/" target="_blank" rel="external nofollow" title="Facebook'ta Takip Et" class="btn azm-social azm-size-48 azm-circle azm-facebook"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/dsi_19_blgmd" target="_blank" title="Twitter'da Takip Et" rel="external nofollow" class="btn azm-social azm-size-48 azm-circle azm-twitter"><i class="fa fa-twitter"></i></a>
                        <a href="https://plus.google.com/" target="_blank" rel="external nofollow" title="Gplus'da Takip Et" class="btn azm-social azm-size-48 azm-circle azm-google-plus" style="display:none"><i class="fa fa-google-plus"></i></a>
                        <a href="https://instagram.com/" target="_blank" rel="external nofollow" title="Instagram'da Takip Et" class="btn azm-social azm-size-48 azm-circle azm-instagram" style="display:none"><i class="fa fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="foot-copy"><%=copyright%></div>
	<div class="foot-copy"><b>Developers :</b> Yusuf KAYA & Sehlan CAMCI & Ömer Faruk ÖZTÜRK</div>
    <script src="tema/ofosoft/src/magnific/jquery.magnific-popupe209e209e209.js?v=1.0.0"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('.image-popup-vertical-fit').magnificPopup({
                type: 'image',
                closeOnContentClick: true,
                mainClass: 'mfp-img-mobile',
                image: {
                    verticalFit: true
                }
            });
        });
    </script>
    <script src="tema/ofosoft/src/ticker/scripts/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function() {
            $(".demo2").bootstrapNews({
                newsPerPage: 1,
                autoplay: true,
                pauseOnHover: true,
                navigation: false,
                direction: 'up',
                newsTickerInterval: 2500,
                onToDo: function() {
                    //console.log(this);
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(function() {
            $('[data-toggle="tooltip"]').tooltip()
        })
    </script>
    <script src="tema/ofosoft/src/owl-carousel/owl.carousel.js"></script>
    <script>
        $(document).ready(function() {
            var time = 5;
            var mnsslider = $('#mnsslider');
            var $progressBar,
                $bar,
                $elem,
                isPause,
                tick,
                percentTime;
            mnsslider.owlCarousel({
                loop: true,
                items: 1,
                onInitialized: progressBar,
                onTranslated: moved,
                onDrag: pauseOnDragging
            });

            function progressBar() {
                buildProgressBar();
                start();
            }

            function buildProgressBar() {
                $progressBar = $("<div>", {
                    id: "progressBar"
                });
                $bar = $("<div>", {
                    id: "bar"
                });
                $progressBar.append($bar).prependTo(mnsslider);
            }

            function start() {
                percentTime = 0;
                isPause = false;
                tick = setInterval(interval, 10);
            };
            function interval() {
                if (isPause === false) {
                    percentTime += 1 / time;

                    $bar.css({
                        width: percentTime + "%"
                    });
                    if (percentTime >= 100) {
                        mnsslider.trigger("next.owl.carousel");
                        percentTime = 0;
                    }
                }
            }
            function pauseOnDragging() {
                isPause = true;
            }
            function moved() {
                clearTimeout(tick);
                start();
            }
            mnsslider.on('mouseover', function() {
                isPause = true;
            })
            mnsslider.on('mouseout', function() {
                isPause = false;
            })
            var i = 1;
            mnsslider.find('.owl-dot').each(function() {
                $(this).text(i);
                i++;
            });
        });
    </script>
	<script type="text/javascript">
	$('.timeline-panel').click(function() {
	$('.timeline-body', this).toggle(); // p00f
	});
	</script>