<!--#include file="sifre.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9">
<title>Video Oynat</title>
<script type="text/javascript">
function MM_CheckFlashVersion(reqVerStr,msg){
  with(navigator){
    var isIE  = (appVersion.indexOf("MSIE") != -1 && userAgent.indexOf("Opera") == -1);
    var isWin = (appVersion.toLowerCase().indexOf("win") != -1);
    if (!isIE || !isWin){  
      var flashVer = -1;
      if (plugins && plugins.length > 0){
        var desc = plugins["Shockwave Flash"] ? plugins["Shockwave Flash"].description : "";
        desc = plugins["Shockwave Flash 2.0"] ? plugins["Shockwave Flash 2.0"].description : desc;
        if (desc == "") flashVer = -1;
        else{
          var descArr = desc.split(" ");
          var tempArrMajor = descArr[2].split(".");
          var verMajor = tempArrMajor[0];
          var tempArrMinor = (descArr[3] != "") ? descArr[3].split("r") : descArr[4].split("r");
          var verMinor = (tempArrMinor[1] > 0) ? tempArrMinor[1] : 0;
          flashVer =  parseFloat(verMajor + "." + verMinor);
        }
      }
      // WebTV has Flash Player 4 or lower -- too low for video
      else if (userAgent.toLowerCase().indexOf("webtv") != -1) flashVer = 4.0;

      var verArr = reqVerStr.split(",");
      var reqVer = parseFloat(verArr[0] + "." + verArr[2]);
  
      if (flashVer < reqVer){
        if (confirm(msg))
          window.location = "http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash";
      }
    }
  } 
}
</script>
<script src="scripts/AC_RunActiveContent.js" type="text/javascript"></script>
</head>

<body onload="MM_CheckFlashVersion('8,0,0,0','Bu sayfadaki i�erik, Adobe Flash Player uygulamas�n�n daha yeni bir s�r�m�n� gerektirir. �imdi indirmek istiyor musunuz?..OfoSoft.Com');">
<div align="center">
  <%isimeski=request.QueryString("isim")
  isim=Replace(isimeski, ".flv", "")%>
    <script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0','width','550','height','500','id','FLVPlayer','src','FLVPlayer_Progressive','flashvars','&MM_ComponentVersion=1&skinName=Halo_Skin_3&streamName=<%=isim%>&autoPlay=false&autoRewind=false','quality','high','scale','noscale','name','FLVPlayer','salign','lt','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','FLVPlayer_Progressive' ); //end AC code
  </script>
  <noscript>
    <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="550" height="500" id="FLVPlayer">
      <param name="movie" value="FLVPlayer_Progressive.swf" />
      <param name="salign" value="lt" />
      <param name="quality" value="high" />
      <param name="scale" value="noscale" />
      <param name="FlashVars" value="&MM_ComponentVersion=1&skinName=Halo_Skin_3&streamName=<%=isim%>&autoPlay=false&autoRewind=false" />
      <embed src="FLVPlayer_Progressive.swf" flashvars="&MM_ComponentVersion=1&skinName=Halo_Skin_3&streamName=<%=isim%>&autoPlay=false&autoRewind=false" quality="high" scale="noscale" width="550" height="500" name="FLVPlayer" salign="LT" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" />  
  </object>
  </noscript>
</div>
</body>
</html>
