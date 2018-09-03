/* eslint-env jquery */

// Collapsing cards
$(function() {
  $('.c-collapsing').click(function(e) {
    e.preventDefault();
    $('.r-collapsing__panel[data-tab ="' + $(this).data('tab') + '"]')
      .show('slow')
      .css({
        display: 'flex',
        'z-index': '1000'
      });
    // console.log($(this).children());
  });
  $('.icon-minus, .c-title').click(function(e) {
    e.preventDefault();
    $('.r-collapsing__panel')
      .hide('slow')
      .css('z-index', '0');
  });
});

// Integrations menu
$(function() {
  $('.integrations.with-arrow > .integrations__item:last-child').after(
    '<li class="integrations-arrow">➡</li>'
  );
  $('.integrations__item:nth-of-type(n+8)').hide();
  $('.integrations-arrow').click(function() {
    $(this)
      .siblings()
      .toggle('slide');
    $(this).toggleClass('flip');
    return false;
  });
});
