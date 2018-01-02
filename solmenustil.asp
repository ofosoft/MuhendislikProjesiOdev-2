<style type="text/css">
.sidebarmenu ul{
margin: 1;
padding: 0;
list-style-type: none;
font:14px;
font-family:"Century Gothic";
font-weight:bold;
width: 98%; /* Main Menu Item widths */

}
 
.sidebarmenu ul li{
position: relative;
height:30px;
padding-bottom:2px;
}

/* Top level menu links style */
.sidebarmenu ul li a{
display: block;
overflow: auto; /*force hasLayout in IE7 */
text-decoration: none;
color: #198bd4;
padding: 7px;
background:url(ofosoft_img/menubgbosS.png);
border-bottom: 1px dashed #198bd4;
}

.sidebarmenu ul li a:link, .sidebarmenu ul li a:visited, .sidebarmenu ul li a:active{
/*background-color: #515151; background of tabs (default state)*/
/*background-image:url(ofosoft_img/menubg.png);*/
}
.sidebarmenu ul li a:hover{
background:#198bd4 url(ofosoft_img/menubgicustT.png);
/*background-color: #ab0000;*/
color:#FFFFFF;
border-radius:3px;
/* border-radius:5px;*/
}
/*Sub level menu items */
.sidebarmenu ul li ul{
position: absolute;
width: 230px; /*Sub Menu Items width */
top: 0;
visibility: hidden;
color: #671464;
background:#f8f8f8 url(ofosoft_img/menubgG.png);
border-radius:3px;
}
.sidebarmenu a.subfolderstyle{
background: url(right.png) no-repeat 97% 50%;
background-image:url(ofosoft_img/menubgic1.png);
border-radius:0px;
}

/* Holly Hack for IE \*/
* html .sidebarmenu ul li { float: left; height: 1%; }
* html .sidebarmenu ul li a { height: 1%; }
/* End */

</style>

<script language="JavaScript" type="text/javascript">
var menuids=["sidebarmenu1"]
function initsidebarmenu(){
for (var i=0; i<menuids.length; i++){
  var ultags=document.getElementById(menuids[i]).getElementsByTagName("ul")
    for (var t=0; t<ultags.length; t++){
    ultags[t].parentNode.getElementsByTagName("a")[0].className+=" subfolderstyle"
  if (ultags[t].parentNode.parentNode.id==menuids[i]) //if this is a first level submenu
   ultags[t].style.left=ultags[t].parentNode.offsetWidth+"px" //dynamically position first level submenus to be width of main menu item
  else //else if this is a sub level submenu (ul)
    ultags[t].style.left=ultags[t-1].getElementsByTagName("a")[0].offsetWidth+"px" //position menu to the right of menu item that activated it
    ultags[t].parentNode.onmouseover=function(){
    this.getElementsByTagName("ul")[0].style.display="block"
    }
    ultags[t].parentNode.onmouseout=function(){
    this.getElementsByTagName("ul")[0].style.display="none"
    }
    }
  for (var t=ultags.length-1; t>-1; t--){ //loop through all sub menus again, and use "display:none" to hide menus (to prevent possible page scrollbars
  ultags[t].style.visibility="visible"
  ultags[t].style.display="none"
  }
  }
}
if (window.addEventListener)
window.addEventListener("load", initsidebarmenu, false)
else if (window.attachEvent)
window.attachEvent("onload", initsidebarmenu)
</script>