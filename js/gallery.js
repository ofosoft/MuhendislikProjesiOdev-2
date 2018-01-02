var req;
var imgs;
var slide;
var nr;
var Album = new Array();
//AJAX based function to retrive list of images from server using callback
function GetSlides()
{
req=false;

//if (window.XMLHttpRequest)
//{
	try
	{
		
		req = new ActiveXObject("Microsoft.XMLHTTP");
	}
	catch(e)
	{
		try
		{
			req = new ActiveXObject("Msxml2.XMLHTTP");
		}
		catch(e1)
		{
		req = false;
		}
	}
//}
	if(req)
	{
	var path=''+document.location;
	
	path=path.substring((path.indexOf('?'))+3);
	if (path=="")
	path="Cars"; //first folder available, please correct for your case.
	//alert(path);
	req.onreadystatechange = ProcessResponse;
	req.open("GET", "http://localhost/Pdks/ThumbGen.ashx?Dir="+path, true);
//document.getElementById("DropDownList1").value,  true);
	req.send("");         
	}
}

////////////////////////
function ProcessResponse()
{
	if(req.readyState == 4)
	{
	if(req.status == 200)  //analog "OK", 
		{
		//here we are processing result,////////////////////////
		//
		var p=req.responseXML.documentElement;
		
		///alert(req.responseXML);  -testing purpose
		var ddlTest = document.getElementById("test");
		//var limg=document.getElementById("listImg");
		
		for (var count = ddlTest.options.length-1;count >-1; count--)
		{
			ddlTest.options[count] = null;
		}
	var photos = p.getElementsByTagName('photos');
	var text; 
	//here we are trying to create array in memory
	
	//this example just to show how we can fill selection box from callback result.
	//After callback we got XMl document-table and we can use it to fill table/select/list etc.
	var listItem;
	var l=photos.length;
	for (var count = 0; count < photos.length; count++)
		{
	text = (photos[count].textContent || 
	photos[count].innerText || photos[count].text);
	listItem = new Option(text, text,  false, false);
	ddlTest.options[ddlTest.length] = listItem;
		}
		}
	else
		{
		alert("Error retrieving data!" );
		}
	
	////// this script responsible to fill Album array by data returned from client in our case 
	// it is a images pathes. 
	
	for (i = 0; i<l; i++)
	{
	text2 = (photos[i].textContent || 
	photos[i].innerText || photos[i].text);
	Album[i]= new Image();
	Album[i].src = text2;
	}
	//now we have array with images. call slide show
	slide=0;
	//call slide show and show menu on top of image
	AjaxSlideShow();
	SlideMenu();

}
	//
	
	
}

///////////////////SLIDESHOW SCRIPT////////////////////
////////////////// OPTION1  ///////////////////////////
var i=1;
var oInterval;
function StartSlideShow()
{
SlideMenu();
//fixed interval, but possible set through list box.
var tm=document.getElementById("slidetime").value*1000
oInterval=window.setInterval("SlideShow()",tm);
//if needed hide slideshow menu after click
//document.getElementById('idSlide').style.display='none';
}

////////////////
//start slideshow, using list of images from list box
function SlideShow()
{

document.imgLarge.filters[0].Duration=2.5;
document.imgLarge.filters[0].Apply();
//alert(document.getElementById("listImg").options[i].text);
document.getElementById('hdr').innerText=document.getElementById("listImg").options[i].text;
document.imgLarge.src=document.getElementById("listImg").options[i].text;
document.imgLarge.filters[0].Play();
if (i>=((document.getElementById("listImg").length)-1))
	{i=0;}
else
	{
	i=i+1;
	}

}
//stop/pause slide show.
function StopSlide()
{
if (oInterval==null)
return;
if(oInterval!="")
	{
		window.clearInterval(oInterval);
		oInterval="";
	}
	else
	{
	return;
	}
	//if we want we can hide slide control
//document.getElementById('idSlide').style.display='none';
window.clearInterval("AjaxSlideShow()");

}

//just to show/hide slide  options on top of image.
function SlideMenu()
{
document.getElementById('idSlide').style.top=document.getElementById('slideBox').style.pixelTop+10;//'195px';
document.getElementById('idSlide').style.left=document.getElementById('slideBox').style.pixelLeft+1;//'235px';
document.getElementById('idSlide').style.display='';
}

//////To SHOW A FULL SCREEN/SIZE SLIDE SHOW  ////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
function FullSize()
{
//check if  already fullsize, move slide frame up, depending from screen size do calculation
//for slide size: use 
//hide everything
//move explorer window to the corner and mximize for slide show
//
if (document.getElementById('idControlBar').style.top=="0px")
return;
//if everyhting is OK, then proceed
window.moveTo(0,0);
window.resizeTo(screen.availWidth,screen.availHeight-5);
document.getElementById('idCatalog').style.display="none";
document.getElementById('divThumb').style.display="none";
document.getElementById('divInfo').style.display='none';

document.getElementById('idControlBar').style.top="0"; //navigation bar ontop-left
document.getElementById('idControlBar').style.left="2";
document.getElementById('idControlBar').style.width="100%";
document.getElementById('hdr').style.width="100%";
//reposition slide
document.getElementById('slideBox').style.top="58"; //fixed leave space for navbar
//change size for slide and put image at center
document.imgLarge.style.pixelWidth=document.imgLarge.style.pixelWidth*1.4;
document.imgLarge.style.pixelHeight=document.imgLarge.style.pixelHeight*1.4;
document.getElementById('slideBox').style.left=((screen.availWidth-document.imgLarge.style.pixelWidth)/2);
//document.imgLarge.style.Width='';
document.getElementById('idSlide').style.left=document.getElementById('slideBox').style.left;//'235px';
document.getElementById('idSlide').style.top=document.getElementById('slideBox').style.top;//'195px';
//change background for page, for better view
document.bgColor="Black";

}

function PrevSlide()
{
//change one slide back
if (i==0)
{i=((document.getElementById("listImg").length)-1);}
else
{
i=i-1;
}
document.imgLarge.src=document.getElementById("listImg").options[i].text;
}

function NextSlide()
{
//change one slide back
if (i>=((document.getElementById("listImg").length)-1))
{i=0;}
else
{
i=i+1;
}
document.imgLarge.src=document.getElementById("listImg").options[i].text;
}


/////////////////////////////////////////////////////////////////////////
function AjaxSlideShow()
{
StopSlide();
if (slide>=Album.length)
{
slide=0;
}
document.imgLarge.filters[0].Duration=2.5;
document.imgLarge.filters[0].Apply();
document.imgLarge.src=Album[slide].src;
document.imgLarge.filters[0].Play();
var tm=document.getElementById("slidetime").value*1000
oInterval=window.setTimeout("AjaxSlideShow()",tm);
//nr=nr+1;
slide++;
}

