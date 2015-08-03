//Global Variables
var headerFrame;
var treeFrame;
var mainFrame;
var statusFrame;
var treeAppletObject;
var sessionTimeout = 1800 * 6; //30 Minutes
var minJreVersion = "1.6";
//Window Handlers used for closing when needed
var downloadWindow;
var userWindow = null;

var wpbsMainFrame;

/** FYI
 * HomePage ~ WpbsHomeFrame
 * WpbsContentFrame ~ WpbsMainFrame
 * HdrFrame ~ WpbsHdrFrame
 * WpbsStatusFrame ~ WpbsStatusFrame
 * WpbsTreeFrame ~ WpbsTreeFrame
 * WpbsTreeApplet ~ WpbsTreeApplet
 */

var cdfFrame;
var dmsFrame;
var docsreportFrame;
var kittingFrame;
var onsitesupportFrame;
var sanityFrame;

function initGlobalVariables() {
	
	cdfFrame = top.HdrFrame.HeaderLeftFrame;
	treeFrame = top.HomePage.WpbsTreeFrame;
	mainFrame = top.HomePage.WpbsContentFrame;
	statusFrame = top.HomePage.WpbsStatusFrame;
	treeAppletObject = top.HomePage.WpbsTreeFrame.document.WpbsMainApplet;
}

function enterNumber() {

	var e = document.getElementById('activityCount');

	if (!/^[0-9]+$/.test(e.value)) {
		
		alert("Please enter only number.");
		
		e.value = e.value.substring(0, e.value.length - 1);
	}
}

function checkCapsLock(e) {
    var myKeyCode = 0;
    var myShiftKey = false;
    var myMsg = 'Caps Lock is on please turn it off to login correcly.';

    // Internet Explorer 4+
    if (document.all) {
        myKeyCode = e.keyCode;
        myShiftKey = e.shiftKey;
        // Netscape 4
    }
    else if (document.layers) {
        myKeyCode = e.which;
        myShiftKey = ( myKeyCode == 16 ) ? true : false;
        // Netscape 6
    }
    else if (document.getElementById) {
        myKeyCode = e.which;
        myShiftKey = ( myKeyCode == 16 ) ? true : false;
    }

   // Upper case letters are seen without depressing the Shift key, therefore Caps Lock is on
    if (( myKeyCode >= 65 && myKeyCode <= 90 ) && !myShiftKey) {
        alert(myMsg);
        // Lower case letters are seen while depressing the Shift key, therefore Caps Lock is on
    }
    else if (( myKeyCode >= 97 && myKeyCode <= 122 ) && myShiftKey) {
        alert(myMsg);
    }
}

function ignoreBackspaceButtonEvent() {
	try {
		var k = window.event.keyCode;
		if (k == 8 || k == 18) {
			event.keyCode = 0;
		}
	}
	catch(err) {
	}
	return event.keyCode;
}

function disableLoginButton() {
    document.getElementById('loginform:submitBtn').disabled = true;
}

function enableLoginButton()
{
    document.getElementById('loginform:submitBtn').disabled = false;
}

window.onload = function() {
	
    document.getElementById("popup").onclick = function() {
    	
        return !window.open(this.href, "pop", "width=200,height=200");
    }
}
