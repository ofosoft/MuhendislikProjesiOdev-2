<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript" src="jquery.autocomplete.pack.js"></script>
<link rel="stylesheet" type="text/css" href="jquery.autocomplete.css" />
<script type="text/javascript">
$().ready(function() {
	function formatItem(row) {
		return row[0] + " (<strong>id: " + row[1] + "</strong>)";
	}
	function formatResult(row) {
		return row[0].replace(/(<.+?>)/gi, '');
	}
	$("#input").autocomplete("isimbul.asp", {
		width: 260,
		selectFirst: false
	});
	$("#input").result(function(event, data, formatted) {
		if (data)
			$(this).parent().next().find("input").val(data[1]);
	});
});
</script>
    <link href="ofosoft_js/prettyPhoto.css" rel="stylesheet" type="text/css" />
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