$(document).ready(function(){
	var url = window.location.href;
	if((url.indexOf("sPage")) > 0) {
		document.getElementById("tab2").style.maxHeight = "100%";
		document.getElementById("tab2").style.padding = "1em";
	}else if(document.getElementById("chck2").checked === 'false'){
		document.getElementById("tab2").style.maxHeight = "0";
		document.getElementById("tab2").style.padding = "0";
	}

});
