/**
 * 
 */
function orderLikes() {
	alert("orderLikes()");
}

function orderRecent() {
	alert("orderRecent()");
}

function writeCommunity() {
	alert("write()");
}


var timeOut;
function scrollToTop() {

	if (document.body.scrollTop != 0 || document.documentElement.scrollTop != 0) {
		window.scrollBy(0, -50);
		timeOut = setTimeout('scrollToTop()', 5);
	} else {
		clearTimeout(timeOut);
	}
}



