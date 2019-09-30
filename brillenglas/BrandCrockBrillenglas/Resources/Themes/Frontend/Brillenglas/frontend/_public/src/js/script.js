function funAddContainer() {
	$("section.content-main").addClass("container");
	$("section.content-main .content-main--inner").removeClass("container");
}
function funRemoveContainer() {
	$("section.content-main").removeClass("container");
	$("section.content-main .content-main--inner").addClass("container");
}
$(document).ready(function(){
   setTimeout(function(){
		$("div.gls-offer-bg").closest('.emotion--row').addClass("drawblackbg");
		$("div.gls-two-text").closest('.emotion--row').addClass("drawbg");
		$("div.gls-four-accord").closest('.emotion--row').addClass("drawfourbg");  
		$("div.gls-three-text").closest('.emotion--row').addClass("setspace");
		$("div.gls-four-text").closest('.emotion--row').addClass("drawborder");
		$("div.accord-bfr-price-head").closest('.emotion--row').addClass("drawabovebg");
		$("div.gls-many-accords").closest('.emotion--row').addClass("drawmanyaccordsbg");
		if($('.drawblackbg .wrap-gls-two-textbg').length == 0) {
			var plicateblack = $('.drawblackbg').html();
			$('.drawblackbg').html('');
			$('.drawblackbg').html('<div class="wrap-gls-two-textbg">'+plicateblack+'</div>');
		}
		if($('.drawbg .wrap-gls-two-text').length == 0) {
			var plicate = $('.drawbg').html();
			$('.drawbg').html('');
			$('.drawbg').html('<div class="wrap-gls-two-text">'+plicate+'</div>');
		}
		$('div.gls-two-text > div.emotion--html').first().after("<div class='kaase'><span>35&euro;</span></div>"); 
		$('div.second-gls > div.emotion--html').after("<div class='kaase'><span>75&euro;</span></div>");
	},600);
	
	/* Below code for STICKY Navigation bar*/
	if(($('body').hasClass('is--ctl-register')) || ($('body').hasClass('is--ctl-checkout'))) {
	} else {
		var stickyNavTop = $('.navigation-main').offset().top;
		var appendonce = 0;
		var stickyNav = function(){
			var scrollTop = $(window).scrollTop();
			if (scrollTop > stickyNavTop) {
				$('.navigation-main').addClass('sticky');
				appendonce++;
				if(appendonce == 1) {
					$('.navigation--list-wrapper ul').append($('nav.shop--navigation ul li.with-slt').clone()).html();
					$('.navigation--list-wrapper ul').append($('nav.shop--navigation ul li.entry--cart').clone()).html();
				}			
			} else {
				$('.navigation-main').removeClass('sticky');
				appendonce = 0;
				if(appendonce == 0) {
					$('.navigation--list-wrapper ul li.with-slt').remove();
					$('.navigation--list-wrapper ul li.entry--cart').remove();
				}
			}
		};
	
		stickyNav();	
	
		$(window).scroll(function() {
			stickyNav();
		});
	}
	
	//~ if(($("body").is(".is--ctl-detail")) || ($("body").hasClass("is--ctl-listing")) || ($("body").hasClass("is--ctl-newsletter")) || ($("body").hasClass("is--ctl-custom"))|| ($("body").hasClass("is--ctl-note"))|| ($("body").hasClass("is--ctl-forms"))|| ($("body").hasClass("is--ctl-address")) || ($("body").hasClass("is--ctl-checkout")))   
	
	if($("body").is(".is--ctl-detail, .is--ctl-listing, .is--ctl-newsletter, .is--ctl-custom, .is--ctl-note, .is--ctl-forms, .is--ctl-address, .is--ctl-checkout"))	{
		
		if(($('body').hasClass("is--act-finish")) && ($('body').hasClass("is--ctl-checkout"))) {			
			funAddContainer();
		} else if(!($('body').hasClass("is--act-finish")) && ($('body').hasClass("is--ctl-checkout"))) {			
			funRemoveContainer();	
		} else {
			funAddContainer();
		}
	} else {		
		funRemoveContainer();
	}

});

 $(window).resize(function () {
	  setTimeout(function(){
		$("div.gls-offer-bg").closest('.emotion--row').addClass("drawblackbg");
		$("div.gls-two-text").closest('.emotion--row').addClass("drawbg");
		$("div.gls-four-accord").closest('.emotion--row').addClass("drawfourbg");  
		$("div.gls-three-text").closest('.emotion--row').addClass("setspace");
		$("div.gls-four-text").closest('.emotion--row').addClass("drawborder");
		$("div.accord-bfr-price-head").closest('.emotion--row').addClass("drawabovebg");
		$("div.gls-many-accords").closest('.emotion--row').addClass("drawmanyaccordsbg");
		
		if($('.drawblackbg .wrap-gls-two-textbg').length == 0) {
			var plicateblack = $('.drawblackbg').html();
			$('.drawblackbg').html('');
			$('.drawblackbg').html('<div class="wrap-gls-two-textbg">'+plicateblack+'</div>');
		}		
		if($('.drawbg .wrap-gls-two-text').length == 0) {
			var plicate = $('.drawbg').html();
			$('.drawbg').html('');
			$('.drawbg').html('<div class="wrap-gls-two-text">'+plicate+'</div>');
		}		
		$('div.gls-two-text > div.emotion--html').first().after("<div class='kaase'><span>35&euro;</span></div>");
		$('div.second-gls > div.emotion--html').after("<div class='kaase'><span>65&euro;</span></div>");
	},100);
});
$(window).ready(function(){
  setInterval(function(){ 
		$("div.gls-offer-bg").closest('.emotion--row').addClass("drawblackbg");
		$("div.gls-two-text").closest('.emotion--row').addClass("drawbg");
		$("div.gls-four-accord").closest('.emotion--row').addClass("drawfourbg");	
		$("div.gls-three-text").closest('.emotion--row').addClass("setspace");
		$("div.gls-four-text").closest('.emotion--row').addClass("drawborder");
		$("div.accord-bfr-price-head").closest('.emotion--row').addClass("drawabovebg");
		$("div.gls-many-accords").closest('.emotion--row').addClass("drawmanyaccordsbg");
	}, 100);

}); 



//for fixed navigation
$('#goTop').hide();
$(window).scroll(function() {
	var scroll = $(window).scrollTop();
	if($(this).scrollTop()>= 600) {
		$('#goTop').removeClass('hinge animated');
		$('#goTop').addClass('rollIn animated');
		$('#goTop').show();
		
	} else {		
		$('#goTop').removeClass('rollIn animated');
		$('#goTop').addClass('hinge animated');
	}
});

//for scroll
var basicScrollTop = function (window) {
var sports_back_to_top = $('#brillengglas_back_to_top').val();
 if(sports_back_to_top == undefined && sports_back_to_top != 1 )
	return false;
  // Reveal the button
  var btnReveal = function () {
    if (window.scrollY >= 300) {
      btnTop.classList.add('is-visible');
    } else {
      btnTop.classList.remove('is-visible');
    }
  }
  $(document).delegate('#goTop', 'click', function () {
		$('html, body').animate({
			scrollTop: 0
		}, 800);
		return false;
  });  
  var btnTop = document.querySelector('#goTop');  
  try {
	 btnTop.addEventListener('click', TopscrollTo);  
  } 
  catch (e) {}
};
basicScrollTop(window);
