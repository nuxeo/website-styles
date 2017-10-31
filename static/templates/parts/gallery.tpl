{* Gallery - part template *}
{def
	$children = fetch( 'content', 'list', hash( 'parent_node_id', $object.main_node_id,
												'class_filter_type', 'include',
												'class_filter_array', array( 'image' ),
												'sort_by', $object.main_node.sort_array
												) )
	$children_count = $children|count
	$image_view_class = 'gallery_full_view'
	$image_thumb_class = 'gallery_full_thumb'
	$thumbs_per_slide = 6
	$caption = ''
}

{if is_unset( $size )}
	{def $size='full'}
{/if}

{switch match=$size}
	{case match='full'}
		{set $image_view_class='gallery_full_view'}
		{set $image_thumb_class='gallery_full_thumb'}
	{/case}
{/switch}

{if $children_count|gt(0)}
	<div class="part-gallery cycle-gallery{if is_set( $size )} cycle-gallery-size-{$size}{/if}">
		<div class="cycle-view{if $size|ne('main')} adjustheight{/if}">
			{foreach $children as $index => $child}
				{set $caption = cond($child.data_map.caption.has_content, $child.data_map.caption.content.output.output_text|striptags(), $child.name)}
				<div class="cycle-slide cycle-slide-index-{$index}">
					<div class="attribute-image fancybox">
						{if or($child.data_map.image.content['original'].width|gt(0), $child.data_map.image.content['original'].height|gt(0))}
							{attribute_view_gui attribute=$child.data_map.image image_class=$image_view_class magnify_title='Click to open full size' link_to_image=true() link_to_image_image_alias='NGFancyBoxMax' fancybox=concat($size, $object.main_node_id) rel=concat('fancybox', $object.main_node_id) link_title=$caption magnify link_class='fancybox'}
						{else}
							{attribute_view_gui attribute=$child.data_map.image image_class=$image_view_class magnify_title='Click to open full size' rel=concat('fancybox', $object.main_node_id) link_title=$caption magnify link_to_image_image_alias='NGFancyBoxMax' rel=concat('fancybox', $object.main_node_id) magnify link_class='fancybox'}
						{/if}
						<div class="attribute-caption-position"><div class="attribute-caption"><div class="attribute-caption-background"></div><span>{$caption}</span></div></div>
					</div>
				</div>
			{/foreach}
		</div>

		<div class="content-view-children cycle-thumbs-wrap">
			<div class="cycle-thumbs">
				<div class="cycle-slide cycle-slide-index-0 float-break">
					{foreach $children as $index => $child}
						{set $caption = cond($child.data_map.caption.has_content, $child.data_map.caption.content.output.output_text|striptags(), $child.name)}
						<div class="image{if $index|inc|mod( $thumbs_per_slide )|eq( 0 )} last{/if} cycle-slide-item">
							<div class="attribute-image">
								{attribute_view_gui attribute=$child.data_map.image image_class=$image_thumb_class}
							</div>
							<div class="attribute-caption-position"><div class="attribute-caption"><span>{$caption}</span></div></div>
						</div>
						{if and( $index|inc|mod( $thumbs_per_slide )|eq( 0 ), $index|inc|ne( $children_count ) )}
				</div>
				<div class="cycle-slide">
						{/if}
					{/foreach}
				</div>
			</div>
		</div>

		{if $children|count|gt( $thumbs_per_slide )}
			<div class="cycle-nav cycle-prev"><a href="#" onclick="return false;"><span>previous</span></a></div>
			<div class="cycle-nav cycle-next"><a href="#" onclick="return false;"><span>next</span></a></div>
		{/if}
	</div>
{/if}
{undef}