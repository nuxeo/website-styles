/* eslint-env browser, jquery */
/* global Handlebars Clipboard*/
'use strict';

$.getJSON("config.json", function(config) {
  $(document).ready(function () {
    var templates_config = [
      {
        key     : 'standard',
        template: 'email_signature_standard.hbs'
      },
      {
        key     : 'plain',
        template: 'email_signature_plain.hbs'
      }
    ];
    var templates = {};
    var templates_loaded = false;

    /* Normal loops don't create a new scope */
    $(templates_config).each(function () {
      var key = this.key;
      var template = this.template;
      $.get(template, function (data) {
        templates[key] = Handlebars.compile(data);
        if (Object.keys(templates).length === templates_config.length) {
          templates_loaded = true;
        }
      });
    });

    var $input_div = $('#inputs');
    var $code = $('#code');
    var $html = $('#html');
    var $signature_link = $('.signature-source');
    var $inputs = $input_div.find('input');
    var $type_selector = $('#email-types');
    var $type_content = $('.email-type');
    var $result = $('.result');

    $input_div.on('keyup change', 'input', function () {
      var data = {};
      var required_satisfied = true;
      var compiled;
      var signature_style;
      var flare;

      $inputs.each(function () {
        /* eslint no-invalid-this: 0 */
        var $this = $(this);
        if ($this.prop('required') && !this.value) {
          required_satisfied = false;
        }
        data[this.id] = this.value || '';
      });
      flare = $input_div.find('input[name="flare"]:checked').val();
      data.flare = flare;
      if (data.flare) {
        data.flare_info = config.flare[data.flare];
      }

      if (required_satisfied && templates_loaded) {
        signature_style = $input_div.find('input[name="signature_style"]:checked').val();
        compiled = templates[signature_style](data);
        $code.text(compiled);
        $html.html(compiled);
        $signature_link.attr('href', 'source.html?' + $inputs.serialize());
        $result.show();
      }
      else {
        $result.hide();
      }
    });

    $type_selector.on('click', '.is-email-type', function () {
      var $this = $(this);
      var id = $this.attr('id');
      $type_content.hide().filter('#' + id.slice(3)).show();
    });

    /* eslint no-new:0 */
    new Clipboard('.copy-html');
  });
});
