/* Copyright © 2005 - 2009 Annpoint, s.r.o.
   Use of this software is subject to license terms. 
   http://www.daypilot.org/

   If you have purchased a DayPilot Pro license, you are allowed to use this 
   code under the conditions of DayPilot Pro License Agreement:

   http://www.daypilot.org/files/LicenseAgreement.pdf

   Otherwise, you are allowed to use it for evaluation purposes only under 
   the conditions of DayPilot Pro Trial License Agreement:
   
   http://www.daypilot.org/files/LicenseAgreementTrial.pdf
   
*/

if (typeof(DayPilot2) === 'undefined') {
    DayPilot2 = {};
}

DayPilot2.ModalStatic = {};

DayPilot2.Modal = function() {

    // default values
    this.width = 300;
    this.height = 460;
    this.top = 20;
    this.opacity = 30;
    this.border = "1px solid black";

    // internal
    var This = this;

    this.id = '_' + new Date().getTime() + 'n' + (Math.random()*10); 
    this.closed = null;

    this.showHtml = function(html) {

	    if (!this.div) {
		    this.create();
	    }
	    else {
		    this.div.style.display = '';
	    }

	    var delayed = function(p, innerHTML) {
    	    return function() {
        	    p.setInnerHTML(p.id + "iframe", innerHTML);
            }
        };
            
	    window.setTimeout(delayed(this, html), 0);

    };

    this.showUrl = function(url) {

	    if (!this.div) {
		    this.create();
	    }
	    else {
		    this.div.style.display = '';
		    this.hideDiv.style.display = '';
	    }
	    DayPilot2.ModalStatic = this;
    	
	    this.iframe.src = url;

    };

    this.create = function() {
	    var hide = document.createElement("div");
	    hide.id = this.id + "hide";
	    hide.style.position = 'absolute';
	    hide.style.left = "0px";
	    hide.style.top = "0px";
	    hide.style.width = "100%";
	    hide.style.height = "100%";
	    hide.style.filter = "alpha(opacity=" + this.opacity + ")";
	    hide.style.opacity = "0." + this.opacity;
	    hide.style.backgroundColor = "black";
	    hide.onclick = function() { This.hide() };

	    document.body.style.height = '100%';

	    document.body.appendChild(hide);

	    var iframe = document.createElement("iframe");
	    iframe.id = this.id + "iframe";
	    iframe.name = this.id + "iframe";
	    iframe.frameBorder = '0';
	    iframe.style.width = '100%';
	    iframe.style.height = (this.height) + 'px';

	    var div = document.createElement("div");
	    div.id = this.id + 'popup';
	    div.style.border = this.border;
	    div.style.position = 'absolute';
	    div.style.left = '50%';
	    div.style.marginLeft = '-' + Math.floor(this.width/2) + "px";  // '-45%'
	    div.style.top = this.top + 'px';
	    div.style.width = this.width + 'px';  // '90%'
	    div.style.height = this.height + 'px';
	    div.style.backgroundColor = 'white';

	    div.appendChild(iframe);

	    document.body.appendChild(div);

	    this.div = div;
	    this.iframe = iframe;
	    this.hideDiv = hide;
    };

    this.setInnerHTML = function(id, innerHTML) {
	    var frame = window.frames[id];

	    var doc = frame.contentWindow || frame.document || frame.contentDocument;
	    //alert(id + ' ' + frame);
	    if (doc.document) {
		    doc = doc.document;
	    }

	    doc.body.innerHTML = innerHTML;
    };

    this.hide = function() {
	    if (this.div) {
		    this.div.style.display = 'none';
		    this.hideDiv.style.display = 'none';
	    }
	    if (this.closed) {
	        this.closed();
	    }
    };

};


