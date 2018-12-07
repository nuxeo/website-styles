/* eslint-env browser, jquery */
/* global Handlebars */
'use strict';

$.getJSON("config.json", function(config) {
  $(document).ready(function () {
    var getUrlParameter = function getUrlParameter (sParam) {
      var sPageURL = decodeURIComponent(window.location.search.substring(1));
      var sURLVariables = sPageURL.split('&');
      var sParameterName;
      var i;

      for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
          return sParameterName[1] === void 0 ? true : sParameterName[1];
        }
      }
      return void 0;
    };

    var param_names = [
      'name',
      'position',
      'phone_label',
      'phone',
      'linkedin',
      'twitter',
      'facebook',
      'gplus',
      'github',
      'flare'
    ];

    var param_data = {};
    var param_value;
    var replace_body = false;
    for (var i = 0; i < param_names.length; i++) {
      var param = param_names[i];
      param_value = getUrlParameter(param);
      // console.log('param', param, param_value);
      if (param_value) {
        replace_body = true;
      }
      param_data[param] = param_value;
    }
    if (param_data.flare) {
      param_data.flare_info = config.flare[param_data.flare];
    }

    var signature_style = getUrlParameter('signature_style');
    if (replace_body && signature_style) {
      $.get('email_signature_' + signature_style + '.hbs', function (source) {
        var template = Handlebars.compile(source);

        $('body').html(template(param_data));
      });
    }
  });
});
