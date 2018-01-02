	var timerId = 0;
jQuery(function($){


	$("input.sfsearchSubmit").attr("value","   ");
	$("input.sfsearchSubmit").attr("title","Aramak için tıklayınız");
	
	
	/*
			var defaults = {
	  			containerID: 'moccaUItoTop', // fading element id
				containerHoverClass: 'moccaUIhover', // fading element hover class
				scrollSpeed: 1200,
				easingType: 'linear' 
	 		};
			*/
			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
	/* popup duyuru*/
	if($("div.divMesaj").length){
		if($("div.divMesaj div:first").html().length>120)
		{
		
			$("body").prepend("<div id=\"mesajArkaplan\"></div>");
			$('#mesajArkaplan').height($(document).height());
			
			$("body").prepend("<div id=\"mesajOrta\">"+$("div.divMesaj").html()+"</div>");
			$("#mesajOrta").prepend("<div id=\"mesajKapat\">Kapat</div>");
			
			var swidth = $("div.divMesaj div").width()
			
			var docWidth = $(document).width();
			var width = Math.round((docWidth-swidth)/2);
			
			$('#mesajOrta').css("left",width+"px");
			
			$('#mesajOrta').width(swidth);
		
			$('#mesajOrta').height($("div.divMesaj div").height());
			
			setTimeout(function(){ $('#mesajOrta').slideDown('slow'); }, 1200);
			
			$("#mesajArkaplan,#mesajKapat").click(function(){
				 $('#mesajOrta').slideUp('slow');
				setTimeout(function(){ $('#mesajArkaplan').fadeOut('slow'); }, 900);
				setTimeout(function(){ $('#mesajArkaplan,#mesajOrta').remove(); }, 900);
			
			});
			
		
		}
	}
	
	
	
	
	/*Açılır kapanır bölümler*/
	$('h3.liste_acilir').css("cursor","pointer").next().hide();
	$('h3.liste_acilir').click(function(e) {
		$(this).next().toggle("slow");	
	});

	$('.treeview li').click(function(e) {

		//	$("ul",this).toggle("slow").addClass("a");
			e.stopPropagation(); 
			//alert($("ul > li",this).text());
		$("ul > li",this).toggle("slow");

	});


	if($(".image_slider").length){
		$(".image_slider img").hide();
		$(".image_slider img").first().addClass("simdiki").show();
		resimDegistir();
	}
	
	$(".leftMenu").children().addClass("sf-vertical").addClass("sf-menu");
	$(".leftMenu ul").superfish( {animation: {height:'show'}});
	


	$('div.tabs a').click(function(e) {
		

		if($(this).hasClass("haberArsiv")==false)
		{
		
			e.preventDefault();
			//önce aktif tabın rengini kaldır
			$("div.tabs a.selected").removeClass("selected");

			
			$("div.tab").addClass("hidden");
			$("#"+$(this).attr("class")).removeClass("hidden");//show();
			
			//tıkladığımız tab aktif görünsün
			$(this).addClass("selected");
		}	
			
			
	});
	

if($("div.haber_slider").length)
{
	$("div.haber_slider").append('<div class="slideKutu"><div class="slide"><div class=\"slideResim\"><div></div></div><div class=\"slideIcerik\"></div></div><div class="slideResimler"></div></div>');
	
	
	
	
	var scope = $("div.haber_slider");
		
		$("div.birHaber", scope).each(function(i) {
			var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
			if($("img",this).length){
				imgPath= $("div.birHaberResim img",this).attr("src");
			}
			var linkPath = $("h3 a",this).attr("href");
			imgPath = imgPath.split("?")[0];
			var id= $(this).attr("id");
			imgPath= imgPath+'?size=64';
			$('div.slideResimler',scope).append("<div class=\"resim\"><div><a href=\""+linkPath+"\"><img src=\""+imgPath+"\" class=\""+id+"\"/></a></div></div>");
		});
		
		$('div.resim',scope).mouseenter(function() {
			$("div.slide").stop(true).fadeTo("fast", 0.1); 
			
				var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
				if($("img",this).length){
					imgPath= $("img",this).attr("src");
				}
				imgPath =imgPath.replace("size=64","size=450");
				$(' div.slideResim div').css('background','#fff url("'+imgPath+'") no-repeat center center').css("width","450px").css("height","300px");
				var id=$("img",this).attr("class");
				$(' div.slideIcerik').html( $(".birHaberMetin",$("#"+id)).html());
				$(".slide").fadeTo("fast", 1); 
		});
		$('div.resim',scope).first().trigger("mouseenter");
		
		$("div.birHaber").hide();
}
	
	

	
if($("#divVideoHaber ul.haberListesi").length)
{
	var scope = $("#divVideoHaber");
	$('div.haber',scope).html("<div class=\"haberResim\"><div></div></div>"); 
	$('div.haber',scope).append("<div class=\"haberIcerik\"></div>");
		
		$("#divVideoHaber ul.haberListesi li.haber").each(function(i) {
			var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
			if($("img",this).length){
				imgPath= $("img",this).attr("src");
			}
			var linkPath = $("h3 a",this).attr("href");
			imgPath = imgPath.split("?")[0];
			var id= $(this).attr("id");
			imgPath= imgPath+'?size=48';
			$('div.resimler',scope).append("<div class=\"resim\"><div><a href=\""+linkPath+"\"><img src=\""+imgPath+"\" class=\""+id+"\"/></a></div></div>");
		});
		
		$('div.resim',scope).mouseenter(function() {
			$("#divVideoHaber .haber").stop(true).fadeTo("fast", 0.1); 
			
				var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
				if($("img",this).length){
					imgPath= $("img",this).attr("src");
				}
				imgPath =imgPath.replace("size=48","size=300");
				$('#divVideoHaber div.haberResim div').css('background','#fff url("'+imgPath+'") no-repeat center center');
				var id=$("img",this).attr("class");
				$('#divVideoHaber div.haberIcerik').html( $("h3","#"+id).html()+$("div.haberOzet","#"+id).html());
				$("#divVideoHaber .haber").fadeTo("fast", 1); 
		});
		$('div.resim',scope).first().trigger("mouseenter");
}
	



if($("#divBasindaDSI ul.haberListesi").length)
{
	var scope = $("#divBasindaDSI");
	$('div.haber',scope).html("<div class=\"haberResim\"><div></div></div>"); 
	$('div.haber',scope).append("<div class=\"haberIcerik\"></div>");
		
		$("#divBasindaDSI ul.haberListesi li.haber").each(function(i) {
			var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
			if($("img",this).length){
				imgPath= $("img",this).attr("src");
			}
			var linkPath = $("h3 a",this).attr("href");
			imgPath = imgPath.split("?")[0];
			var id= $(this).attr("id");
			imgPath= imgPath+'?size=48';
			$('div.resimler',scope).append("<div class=\"resim\"><div><a href=\""+linkPath+"\"><img src=\""+imgPath+"\" class=\""+id+"\"/></a></div></div>");
		});
		
		$('div.resim',scope).mouseenter(function() {
			$("#divBasindaDSI .haber").stop(true).fadeTo("fast", 0.1); 
			
				var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
				if($("img",this).length){
					imgPath= $("img",this).attr("src");
				}
				imgPath =imgPath.replace("size=48","size=300");
				$('#divBasindaDSI div.haberResim div').css('background','#fff url("'+imgPath+'") no-repeat center center');
				var id=$("img",this).attr("class");
				$('#divBasindaDSI div.haberIcerik').html( $("h3","#"+id).html()+$("div.haberOzet","#"+id).html());
				$("#divBasindaDSI .haber").fadeTo("fast", 1); 
		});
		$('div.resim',scope).first().trigger("mouseenter");
}


if($("#divGuncelHaber ul.haberListesi").length){
		var scope = $("#divGuncelHaber ");
		$('div.haber',scope).html("<div class=\"haberResim\"><div></div></div>"); 
		$('div.haber',scope).append("<div class=\"haberIcerik\"></div>");
		
		$("#divGuncelHaber ul.haberListesi li.haber").each(function(i) {
			var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
			if($("img",this).length){
				imgPath= $("img",this).attr("src");
			}
			var linkPath = $("h3 a",this).attr("href");
			imgPath = imgPath.split("?")[0];
			var id= $(this).attr("id");
			imgPath= imgPath+'?size=48';
			$('div.resimler',scope).append("<div class=\"resim\"><div><a href=\""+linkPath+"\"><img src=\""+imgPath+"\" class=\""+id+"\"/></a></div></div>");
		});
		
		$('div.resim',scope).mouseenter(function() {
			$("#divGuncelHaber .haber").stop(true).fadeTo("fast", 0.1); 
				var imgPath ="/images/kurumsal/dsi-genel-mudurlugu.jpg";
				if($("img",this).length){
					imgPath= $("img",this).attr("src");
				}
				imgPath =imgPath.replace("size=48","size=300");
				$('#divGuncelHaber div.haberResim div').css('background','#fff url("'+imgPath+'") no-repeat center center');
				var id=$("img",this).attr("class");
				$('#divGuncelHaber div.haberIcerik').html( $("h3","#"+id).html()+$("div.haberOzet","#"+id).html());
				$("#divGuncelHaber .haber").fadeTo("fast", 1); 
		});
		$('div.resim',scope).first().trigger("mouseenter");
}

	
if($(".bakan").length){
	$(".bakan ul li a[title],.mudur ul li a[title]").tooltip({ offset : [0, -32],position:"top right",  opacity: 0.9,effect:"fade"});
}
			
			$(".anaSayfaDuyurular ul").hide();
			$(".anaSayfaDuyurular ul li").first().addClass("current");
			$(".anaSayfaDuyurular").prepend("<div>"+$(".anaSayfaDuyurular ul li.current").html()+"</div>");
			timerId = setTimeout('duyuruDegistir()', 5000);
			
			$(".haberKontrol .prev").after("<span id=\"duyuruSayi\">1</span>");
			
			$(".haberKontrol .next").click(function(e){
				e.preventDefault();
				duyuruDegistir();
				clearTimeout(timerId);
			});
			
			$(".haberKontrol .prev").click(function(e){
				e.preventDefault();
				clearTimeout(timerId);
				$(".anaSayfaDuyurular div").fadeTo("fast", 0,function() {
				  	if(($(".anaSayfaDuyurular ul li.current").is($(".anaSayfaDuyurular ul li:first")))){
						$(".anaSayfaDuyurular ul li.current").removeClass("current");
						$(".anaSayfaDuyurular div").html($(".anaSayfaDuyurular ul li:last").addClass("current").html());
					}
					else{
					$(".anaSayfaDuyurular div").html($(".anaSayfaDuyurular ul li.current").removeClass("current").prev().addClass("current").html());
					}
					$(".anaSayfaDuyurular div").fadeTo("fast", 1.0); 
					var index = $(".anaSayfaDuyurular ul li.current").index();
					index+=1;
					$("#duyuruSayi").html(index);
					  
				});
				
			});
			
			
			
			//fare üzerindeyken dönmesin
			$(".anaSayfaDuyurular").mouseover(function(){clearTimeout(timerId);});
			$(".anaSayfaDuyurular").mouseout(function(){
				timerId = setTimeout('duyuruDegistir()', 5000);
			});
			

			$('.anaSayfaDuyurular')
				.bind('mousewheel', function(event, delta) {
					if(delta > 0){
						$(".haberKontrol .prev").trigger("click");
					}
					else
					{
						$(".haberKontrol .next").trigger("click");
					}
					clearTimeout(timerId);
					return false;
				});
	
			
			
			
		
		
		//anaSayfaDuyurular
		
		

		$('#footer .totop').bind('click', function(){
			var link = $(this);
			$.scrollTo('#header', 1000, { onAfter: function(){
				window.location.hash = "#header";
			} 
			});
			return false;
		});
	
	
	$(window).load(function() {
		$('.slider img').attr("title","");
		$('.slider').nivoSlider({ pauseTime: 4000,  effect: 'fade'});
	});
	
	$("#mainContent a[href^='/images']").colorbox();
	
	
	

	
	function mycarousel_initCallback(carousel)
{
    // Disable autoscrolling if the user clicks the prev or next button.
    carousel.buttonNext.bind('click', function() {
        carousel.startAuto(0);
    });

    carousel.buttonPrev.bind('click', function() {
        carousel.startAuto(0);
    });

    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};
	
	$('#buttomSlider ul').jcarousel({
    	wrap: 'circular',
		auto: 4,
		//easing: 'BounceEaseOut',
        animation: 1000,
		scroll:1,
        initCallback: mycarousel_initCallback
    });
	
		

		
 });

	
function duyuruDegistir(){
		clearTimeout(timerId);
		$(".anaSayfaDuyurular div").fadeTo("fast", 0,function() {
				if(($(".anaSayfaDuyurular ul li.current").is($(".anaSayfaDuyurular ul li:last")))){
					$(".anaSayfaDuyurular ul li.current").removeClass("current");
					$(".anaSayfaDuyurular div").html($(".anaSayfaDuyurular ul li:first").addClass("current").html());
				}
				else{
				
				$(".anaSayfaDuyurular div").html($(".anaSayfaDuyurular ul li.current").removeClass("current").next().addClass("current").html());
				}
				$(".anaSayfaDuyurular div").fadeTo("fast", 1.0); 
				
				var index = $(".anaSayfaDuyurular ul li.current").index();
				index+=1;
				$("#duyuruSayi").html(index);
				timerId = setTimeout('duyuruDegistir()', 5000);
			});

}


function resimDegistir(){
		
		clearTimeout(timerId);
		$(".image_slider img.simdiki").fadeTo("fast", 0.5,function() {
				if(($(".image_slider img.simdiki").is($(".image_slider img:last")))){
					$(".image_slider img.simdiki").removeClass("simdiki").hide();
					$(".image_slider img:first").addClass("simdiki").show();
				}
				else{
					$(".image_slider img.simdiki").removeClass("simdiki").hide().next().addClass("simdiki").show();
				}
				$(".image_slider img.simdiki").fadeTo("fast", 1.0); 
			});
			
			timerId = setTimeout('resimDegistir()', 5000);
}
	
	