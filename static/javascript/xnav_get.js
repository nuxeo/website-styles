jQuery(document).ready(function($){
///

jQuery.ajax({
	type:'get',
	url:'//www.nuxeo.com/nxxnav/get',
	dataType:'jsonp',
	jsonpCallback: 'xnavget'
});

///
});

function xnavget(content){
	var topmenu = jQuery(content.topmenu_content);
	var footer = content.footer_content;

	jQuery(topmenu).find(".selected").removeClass("selected");
	jQuery(topmenu).find("ul a").each(function(){
		 var currentHref = jQuery(this).attr("href");
                 if (currentHref.indexOf(window.location.host) != -1){
                        if (currentHref.indexOf("http://www.nuxeo.com/") != -1) {
                          if (!window.location.pathname.match("^/blog/")) {
                              jQuery(this).parents("li").addClass("selected");
                              return false;
                          } else {
                             if (currentHref.match("/blog/$")) {
                               jQuery(this).parents("li").addClass("selected");
                               return false;
                             }
                          }
                        } else {
                            jQuery(this).parents("li").addClass("selected");
		            return false;
                        }
		}
	});

	jQuery('head').append('<link rel="stylesheet" href="//static.nuxeo.com/stylesheets/xnav.css" type="text/css" />');
	jQuery('body').prepend(topmenu);
	jQuery('body').append(footer);
}
