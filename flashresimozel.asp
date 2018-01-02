<%if 1<2 then%>
<script type="text/javascript" src="swfobject.js"></script>
    <script type="text/javascript">
			
			// JAVASCRIPT VARS
			// cache buster
			var cacheBuster = "?t=" + Date.parse(new Date());
			// stage dimensions		
			var stageW = "530";//"100%";
			var stageH = "330";//"100%";
			
			
			// ATTRIBUTES
			var attributes = {};
			attributes.id = 'FlabellComponent';
			attributes.name = 'FlabellComponent';
 
			// PARAMS
			var params = {};
			params.bgcolor = "#ffffff";
		    params.menu = "false";
		    params.scale = 'noScale';
		    params.wmode = "opaque";
		    params.allowfullscreen = "true";
		    params.allowScriptAccess = "always";			
			
			
			/* FLASH VARS */
			var flashvars = {};
			
			/// if commented / delete these lines, the component will take the stage dimensions defined 
			/// above in "JAVASCRIPT SECTIONS" section or those defined in the settings xml
		    flashvars.componentWidth = stageW;
			flashvars.componentHeight = stageH;
			
			/// path to the content folder(where the xml files, images or video are nested)
			/// if you want to use absolute paths(like "http://domain.com/images/....") then leave it empty("")			
			flashvars.pathToFiles = "";
			
			// path to content XML
			flashvars.contentXMLPath = "ofosoftkareflash.asp";
			
			
			/** EMBED THE SWF**/
			swfobject.embedSWF("ofosoftkareflash.swf"+cacheBuster, attributes.id, stageW, stageH, "9.0.124", "js/expressInstall.swf", flashvars, params, attributes);
			
		</script>
		<div id="FlabellComponent">
					        <p>In order to view this object you need Flash Player 9+ support!</p>
					        <a href="http://www.adobe.com/go/getflashplayer">
						    <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player"/></a>
		    </div>

<%else%>
<script type="text/javascript" src="flash.js"></script>
<script type="text/javascript">strFlash('923', '336', "ofosoft.swf?xml_path=flashresimkaynak.asp")</script>
<%end if%>