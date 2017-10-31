var AUX = {}
AUX.array = {
	contains: function(haystack, needle) {if (haystack.length) for (var idx = 0; idx < haystack.length; idx++) if (haystack[idx] == needle) return true; return false;}
}
AUX.coordinates = {
	absolute: function(el) {var left = 0, top = 0; if (el.offsetParent) do {left += el.offsetLeft; top += el.offsetTop;} while (el = el.offsetParent); return {left:left,top:top};},
	relative: function(el) {var offset = this.absolute(el); return {left:offset.left - jQuery(window).scrollLeft(),top:offset.top - jQuery(window).scrollTop()}}
}

jQuery(function($){

///

// FROM nxc_lib.js and jsall.js

$('a.lightbox-fullsize').lightBox({imageLoading:'/extension/nuxeo_design/design/nuxeo/images/new_waiter.gif'});

//---------------Random selection of tab on frontpage

/*var randomtab = Math.floor( Math.random() * (0 - 4 + 1) ) + 3;*/
if($('#webinarblock').find('.content-view-children').hasClass('no-children')){ var randomtab = 1; }
else { var randomtab = 0; }

$('.deskCalendar ul:first li').each(function(ind){
    if( ind == randomtab )
    {
        $(this).click();
    }
});

//-------------------------------------------

$('ul#topmenu-firstlevel li').hover(
    function() {
        $(this).find('div.topmenudropdawn').stop(true, true);
        $(this).stopTime('stoplink');
        $(this).oneTime(200, 'stopcurrentshow' ,function() {
            $(this).find('div.topmenudropdawn').animate({height: "show"}, 'fast');
            /*$(this).find('div.topmenudropdawn').css('display','block');*/
        });
    },
    function() {
        $(this).stopTime('stopcurrentshow');
        $(this).oneTime(200, 'stoplink' ,function() {
            $(this).find('div.topmenudropdawn').animate({height: "hide"}, 'fast');
        });
    }
);

$('div.language_selected_bloc').hover(
    function() {
        $(this).find('div#languages_list_id').stop(true, true);
        $(this).stopTime('stoplink');
        $(this).oneTime(200, 'stopcurrentshow' ,function() {
            $(this).find('div#languages_list_id').stop(true, true);
            //$(this).find('div#languages_list_id').animate({height: "show"}, 'fast');
            $(this).find('div#languages_list_id').css('display','block');
        });
    },
    function() {
        $(this).stopTime('stopcurrentshow');
        $(this).oneTime(200, 'stoplink' ,function() {
            $(this).find('div#languages_list_id').hide();
        });
    }
);

$('#jqlogos_to_the_right').click(
    function() {
        $("#customers_logo_list").find("table:first").remove().appendTo("#customers_logo_list");
    }

);

$('#jqlogos_to_the_left').click(
    function() {
        $("#customers_logo_list").find("table:last").remove().prependTo("#customers_logo_list");
    }

);

$('#jqlogos_to_the_right2').click(
    function() {
        $("#partners_logo_list").find("table:first").remove().appendTo("#partners_logo_list");
    }

);

$('#jqlogos_to_the_left2').click(
    function() {
        $("#partners_logo_list").find("table:last").remove().prependTo("#partners_logo_list");
    }

);

// END  FROM nxc_lib.js and jsall.js

///

$('.popmenu').popmenu();

$('select.ezfilter').eZFilter();

$('ul.ezfilter > li').click(function(){
	$('select[name="' + $(this).parent().attr('id').replace('ezf-', '') + '"]').val($(this).attr('class').replace('ezf-', '')).change();
});

$('a.ezfilter-remove').click(function(){
	if ($('select[name="' + $(this).attr('id').replace('ezf-', '') + '"]').hasClass('ezfilter-master')) {
		console.log('clear');
		$('select.ezfilter').eZFilterClear();
	}
	else {
		console.log('filter');
		$('select[name="' + $(this).attr('id').replace('ezf-', '') + '"]').val('-1').change();
	}
	return false;
});

$('#resource-center-search').keypress(function(event) {
    if (event.which == 13) {
        var base = (window.location.protocol + '//' + window.location.hostname + window.location.pathname).split('/(', 1)[0];
        var match = '';
        var value = $(this).val();
        var name = $(this).attr('name');
        var inUrl = false;
        var pattern = /(?:.*?\((.+?)\)\/(.+?)(?:\/|\?|$))/g;
        while (match = pattern.exec(window.location.pathname)) {
            if (name == match[1]) {
                inUrl = true;
                if (value == '') continue;
            }
            base += '/(' + match[1] + ')/' + (name == match[1] ? value : match[2]);
        }
        if (!inUrl) base += '/(' + name + ')/' + value;
        base += window.location.search + window.location.hash;
        window.location.href = base;
    }
});

$('#customers_logo_list').cycle({
	fx:			'scrollHorz',
	next:		'#jqlogos_to_the_right',
	prev:		'#jqlogos_to_the_left',
	timeout:	30000
});

$('td.pricing-column .tooltip-trigger').tipsy({
	"title":	function(){return $(this).siblings('.tooltip-content:first').html();},
	"html":		true,
	"gravity":	"s",
	"offset":	10,
	"delayOut":	3500,
	"opacity":	1});

$('.stickyfloat').each(function(){$(this).stickyfloat({duration:100});});

$('.cycle-gallery').each(function(){
	var rand = Math.floor(Math.random() * 10000).toString();
	$(this).addClass( 'cycle-' + rand );
	$('.cycle-view', this).cycle({
		fx:					'fade',
		speedIn:			500,
		speedOut:			500,
		timeout:			0,
		pause:				0,
		pauseOnPagerHover:	0,
		delay:				-1000,
		sync:				true,
		height:				'auto',
		cleartype:			true,
		cleartypeNoBg:		true,
		slideExpr:			'.cycle-slide',
		before:				function(currSlideElement, nextSlideElement, options, forwardFlag) {
			if($(nextSlideElement).width() < 750){
				var cycle_offset = (750 - $(nextSlideElement).width())/2;
				$(nextSlideElement).parent().animate({marginLeft: cycle_offset},50);
			}
			if ($(this).parent().hasClass('adjustheight')) $(this).parent().animate({height: $(nextSlideElement).height()},300);
		},
		pagerAnchorBuilder:	function(idx, slide) {return '.cycle-' + rand + ' .cycle-thumbs > div > div:eq(' + idx + ')';}
	});
	$('.cycle-thumbs', this).cycle({
		fx:					'scrollHorz',
		speedIn:			500,
		speedOut:			500,
		timeout:			0,
		pause:				true,
		pauseOnPagerHover:	true,
		delay:				-1000,
		sync:				true,
		cleartype:			true,
		cleartypeNoBg:		true,
		slideExpr:			'.cycle-slide',
		next:				'.cycle-' + rand + ' .cycle-next',
		prev:				'.cycle-' + rand + ' .cycle-prev'
	});
});

$('a.fancybox').fancybox({
	titlePosition: 'inside',
	titleShow: true,
	titleFormat: function(title, currentArray, currentIndex, currentOpts) {
		return $(currentArray[currentIndex]).next('.attribute-caption-position').find('span').html();
	}
});

// NETGEN 2013-06-03 (EZNX-230) BEGIN
calculateWidth();
setBodyClass();
$(window).resize(function(){
    calculateWidth();
    setBodyClass();
});

$('body.mobile-viewport ul.facetList li strong').bind('touchstart mousedown', function(e){
    $('body.mobile-viewport ul.facetList li ul').hide();
    e.stopPropagation();
    $(this).closest('li').find('ul').addClass('opened').show();
    return false;
});

$("body.mobile-viewport").bind('touchstart mousedown', function(e){
    if( $(e.target).closest("ul.facetList").length ){
        return true;
    }else{
        $('body.mobile-viewport ul.facetList li').find('ul').removeClass('opened').hide();
    }
});
// NETGEN 2013-06-03 (EZNX-230) END

//$.ajax({
//	url: 'http://blogs.nuxeo.com/atom.xml',
//	dataType: 'jsonp',
//	context: $('#blogblock').get(0),
//	success: function(data, textStatus, jqXHR) {
//		console.log(data);
//	},
//	error: function(jqXHR, textStatus, errorThrown) {
//		console.log(textStatus, errorThrown);
//	}
//});

});

// NETGEN 2013-06-03 (EZNX-230) BEGIN
var globalWidth = 0;
function calculateWidth(){
  globalWidth = window.innerWidth || document.documentElement.clientWidth;
};
function setBodyClass(){
  if(globalWidth < 640){
    $('body').addClass('mobile-viewport');
  }else{
    $('body').removeClass('mobile-viewport');
  }
};
// NETGEN 2013-06-03 (EZNX-230) END

function setDownloadForm( countrycode ) {
//    alert(countrycode);
countrycode='US';
	if (countrycode == 'FR') {
		jQuery('#download_form').addClass('download-france');
	} else {
		jQuery('#download_form').addClass('download-world');
	}

    jQuery("[class^='cc-']").hide();
    jQuery("[class^='cc-no-']").show();
	jQuery('.cc-'+countrycode).show();
    jQuery('.cc-no-'+countrycode).hide();

	jQuery('#country_code').val(countrycode);
//	jQuery('#download_form').show();
}
