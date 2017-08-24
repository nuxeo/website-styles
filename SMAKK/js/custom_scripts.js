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

//INTEGRATIONS MENU

$(function(){
    $('.integrations__item:last-child').after("<li class=\"integrations-arrow\">➡</li>");
        $(".integrations__item:nth-of-type(n+8)").hide();
        $('.integrations-arrow').click(function(e) {
            $(".integrations__item").toggle("slide");
            $(this).css({
                'transform': 'rotate(180deg)'
            });
            return false;
        });
});