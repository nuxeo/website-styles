{def $lightbox_object = fetch(content, object, hash(object_id, $object_id))}

<div style="display:none"><div id="{$content_id}">
	{if and(is_set($lightbox_object.data_map.lightbox_content), $lightbox_object.data_map.lightbox_content.has_content)}
		{attribute_view_gui attribute=$lightbox_object.data_map.lightbox_content}
	{/if}
</div></div>

<script type="text/javascript">
	{literal}
	var fancyboxIframeSrc="";
	jQuery(document).ready(function($){
		$("a#{/literal}{$link_id}{literal}").fancybox({
			'hideOnContentClick': false,
			'type': 'inline',
			'autoDimensions': true,
			'onComplete': function() {fancyboxIframeSrc = $('#{/literal}{$content_id}{literal} iframe').attr('src');},
			'onClosed': function() {$('#{/literal}{$content_id}{literal} iframe').attr('src', fancyboxIframeSrc);}
		});
	});
	{/literal}
</script>