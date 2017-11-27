(function($) {
	$.fn.eZFilter = function() {
		this.each(function() {
			$(this).bind('change', function(){applyFilter(this);});
		});
		return this;
	};
	$.fn.eZFilterClear = function() {
		var base = (window.location.protocol + '//' + window.location.hostname + window.location.pathname).split('/(', 1)[0];
		var pattern = /(?:.*?\((.+?)\)\/(.+?)(?:\/|\?|$))/g;
		while (match = pattern.exec(window.location.pathname)) {
			var inFilters = false;
			$('option', this).each(function(){
				if ($(this).parent().attr('name') != match[1]) {
					return true;
				}
				if ($(this).attr('value') == match[2]) {
					inFilters = true;
					return false;
				}
			});
			if (!inFilters) base += '/(' + match[1] + ')/' + match[2];
		}
		window.location.href = base;
		return this;
	};
	function applyFilter(select) {
		var base = (window.location.protocol + '//' + window.location.hostname + window.location.pathname).split('/(', 1)[0];
		var match = '';
		var value = $(select).val();
		var name = $(select).attr('name');
		var inUrl = false;
		var pattern = /(?:.*?\((.+?)\)\/(.+?)(?:\/|\?|$))/g;
		while (match = pattern.exec(window.location.pathname)) {
			if (name == match[1]) {
				inUrl = true;
				if (value == -1) continue;
			}
			base += '/(' + match[1] + ')/' + (name == match[1] ? value : match[2]);
		}
		if (!inUrl) base += '/(' + name + ')/' + value;
		base += window.location.search + window.location.hash;
		window.location.href = base;
	}
})(jQuery);