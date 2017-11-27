/* eslint-env browser, jquery */
/* global Handlebars Clipboard*/
'use strict';

$(document).ready(function () {
    $.get('email_signature.hbs', function (source) {
        var template = Handlebars.compile(source);

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
            $inputs.each(function () {
                /* eslint no-invalid-this: 0 */
                var $this = $(this);
                if ($this.prop('required') && !this.value) {
                    required_satisfied = false;
                }
                data[this.id] = this.value || '';
            });

            if (required_satisfied) {
                compiled = template(data);
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
    });

    /* eslint no-new:0 */
    new Clipboard('.copy-html');
});
