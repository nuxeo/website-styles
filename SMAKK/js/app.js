$(document).foundation();

//INCLUDES



//COLLAPSING CARDS
$(function() {
    $(".c-collapsing").click(function (e) {
        e.preventDefault();
        $('.r-collapsing__panel[data-tab ="' + $(this).children().data('tab') + '"]').show('slow').css({
            'display': 'flex',
            'z-index': '1000'
        });
    });
    $('.icon-minus, .c-title').click(function (e) {
        e.preventDefault();
        $(".r-collapsing__panel").hide('slow').css('z-index', '0');
    });
});




