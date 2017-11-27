{ezscript_require(array('ezjsc::jquery', 'ezjsc::jqueryio', 'jquery.cycle.all.min.js'))}

{def $screencasts = fetch(content, related_objects, hash(object_id, $object_id,
															attribute_identifier, $relation_attribute_id,
															sort_by, array(published, false())))}

{def $unique_id = concat($object_id, '-', $relation_attribute_id)}

{if $screencasts|count}
	<div id="caroussel">
		<h3>Nuxeo Video</h3>
		<div id="caroussel-show">
			<div id="screencast-prev-{$unique_id}" class="caroussel-tool"><img class="arrowsliders" src={'caroussel-left-key.png'|ezimage} alt="Move left" height="145" width="20"></div>
			<div id="screencast-slider-{$unique_id}" class="caroussel-tool">
				{foreach $screencasts as $index => $screencast}
					<div class="object-right embed-blip-video"{if $index|gt(0)} style="display:none"{/if}>
						<a class="popin-open-05" href={$screencast.main_node.url_alias|ezurl}>
							{attribute_view_gui attribute=$screencast.data_map.image image_class='videocaroussel'}
							<div class="video-title">{$screencast.data_map.title.content|wash}</div>
						</a>
					</div>
				{/foreach}
			</div>
			<div id="screencast-next-{$unique_id}" class="caroussel-tool"><img class="arrowsliders" src={'caroussel-right-key.png'|ezimage} alt="Move left" height="145" width="20"></div>
			
			<div style="clear:both">
			
		</div>
	</div>
{/if}

<script type="text/javascript">
{literal}
jQuery(document).ready(function() {
jQuery('#screencast-slider-' + '{/literal}{$unique_id}{literal}').cycle({
		fx:			'scrollHorz',
		next:		'#screencast-next-' + '{/literal}{$unique_id}{literal}',
		prev:		'#screencast-prev-' + '{/literal}{$unique_id}{literal}',
		timeout:	{/literal}{$timeout}{literal}
	});
});
{/literal}
</script>