    <link href="ofosoft_js/prettyPhoto.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
    <script type="text/javascript" src="ofosoft_js/jquery.prettyPhoto.js"></script>
    <script>
      $(document).ready(function(){
		    $("a[rel^='slayt']").prettyPhoto({
			    animationSpeed: 'normal',
			    padding: 40,
			    opacity: 0.5, 
			    showTitle: false,
			    allowresize: true,
			    counter_separator_label: '-'
		    });
	    });
    </script>