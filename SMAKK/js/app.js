$(document).foundation();

//INCLUDES



//COLLAPSING CARDS
$(function() {
    $(".c-collapsing").click(function (e) {
        e.preventDefault();
        $('.r-collapsing__panel[data-tab ="' + $(this).data('tab') + '"]').show('slow').css({
            'display': 'flex',
            'z-index': '1000'
        });
        console.log($(this).children())
    });
    $('.icon-minus, .c-title').click(function (e) {
        e.preventDefault();
        $(".r-collapsing__panel").hide('slow').css('z-index', '0');
    });
});

//PARALLAX