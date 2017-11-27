jQuery(document).ready(function($){
///

jQuery.ajax({
    type:'get',
    url:'http://www.nuxeo.com/nxxnav/get',
    dataType:'jsonp',
    jsonpCallback: 'xnavget'
});

///
});

// no footer needed in confluence

function xnavget(content){
    var topmenu = jQuery(content.topmenu_content);

    jQuery(topmenu).find(".selected").removeClass("selected");
    jQuery(topmenu).find("ul a").each(function(){
        if (jQuery(this).attr("href").indexOf(window.location.host) != -1){
            jQuery(this).parents("li").addClass("selected");
            return false;
        }
    });

    jQuery('head').append('<link rel="stylesheet" href="http://static.nuxeo.com/stylesheets/xnav.css" type="text/css" />');
    jQuery('body').prepend(topmenu);
}

