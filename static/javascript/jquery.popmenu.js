(function($) {
	$.fn.popmenu = function(options) {
		var opts = $.extend({}, $.fn.popmenu.defaults, options);
		this.each(function() {
			var $this = $(this);
			var timeout		= 750;
			var closetimer = null;
			var position = 'below';

			$this.find('.menu-select').bind('click', popmenu_open);
			$this.bind('mouseover', popmenu_canceltimer);
			$this.bind('mouseout', function(e) {closetimer = window.setTimeout(popmenu_close, timeout);});
		
			function popmenu_open() {
				popmenu_canceltimer();
				if ($this.find('div').css('display') != 'block') {
					var vpp = AUX.coordinates.relative($this.get(0));
					$this.find('div').slideDown(300);
				}
        else $this.find('div').slideDown(500);
				$this.find('.menu-select').toggleClass('menu-select-active');
				return false;
			}
			
			function popmenu_close() {
				$this.find('div').fadeOut(200);
				$this.find('.menu-select').removeClass('menu-select-active');
			}
			
			function popmenu_canceltimer() {
				if (closetimer) {
					window.clearTimeout(closetimer);
					closetimer = null;
				}
			}
			
			function popmenu_reposition() {
				if (position == 'below') $this.find('ul li').each(function() {$(this).prependTo($(this).parent());});
			}
		});
		return this;
	};
	$.fn.popmenu.defaults = {};
})(jQuery);