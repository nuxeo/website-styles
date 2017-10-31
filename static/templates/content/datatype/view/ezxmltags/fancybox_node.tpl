{def $lightbox_node = fetch(content, node, hash(node_id, $node_id))}

<div style="display:none"><div id="{$content_id}" style="width:960px;">
	{node_view_gui view=$view content_node=$lightbox_node}
</div></div>

<script type="text/javascript">
	{literal}
	var fancyboxIframeSrc{/literal}{$node_id}{literal}="";
	jQuery(document).ready(function($){
		$("a#{/literal}{$link_id}{literal}").fancybox({
			'hideOnContentClick': false,
			'type': 'inline',
			'autoDimensions': true,
			'onComplete': function() {fancyboxIframeSrc{/literal}{$node_id}{literal} = $('#{/literal}{$content_id}{literal} iframe').attr('src');},
			'onClosed': function() {$('#{/literal}{$content_id}{literal} iframe').attr('src', fancyboxIframeSrc{/literal}{$node_id}{literal});}
		});
	});
	{/literal}
</script>