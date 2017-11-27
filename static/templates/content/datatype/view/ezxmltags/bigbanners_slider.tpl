{ezscript_require(array('ezjsc::jquery', 'ezjsc::jqueryio', 'jquery.cycle.all.min.js'))}

{def
	$banner_link = false()
	$banner_target = '_self'
	$banner_relation = false()
	$banner_title = false() }

{def $unique_id = concat($object_id, '-', $relation_attribute_id)}

{*
   ( 2013/04/03 NETGEN START )
   ( 'content', 'related_objects') fetch has a bug, so it doesn't fetch list of related objects only for current translation.
   Instead, it fetches all related objects for ALL translations for specified attribute.
   To achieve correct behavior, it is necessary to fetch object first, extract list of related nodes from attribute, and then fetch related objects
*}

{def $object = fetch('content', 'object', hash('object_id', $object_id))
     $class_attribute=fetch( 'content', 'class_attribute', hash( 'attribute_id', $relation_attribute_id ))
	 $class_attribute_identifier = $class_attribute.identifier
	 $related_objects = $object.data_map.$class_attribute_identifier.content.relation_list
	 $banners = array()}

{* to fetch related nodes in correct order, they need to be fetched one by one *}
{if $related_objects|count|gt(0)}
	{foreach $related_objects as $related_object}
		{set $banners = $banners|append( fetch('content', 'node', hash('node_id', $related_object.node_id)))}
	{/foreach}
{/if}

{undef $object $class_attribute $class_attribute_identifier $related_objects}
{* (2013/04/03 NETGEN) END *}

{if $banners|count}
<div id="bigbanners-caroussel-position">
	<div id="bigbanners-slider-{$unique_id}" class="caroussel-tool">
		{foreach $banners as $index => $banner}
			<div class="caroussel-slide"{if $index|gt(0)} style="display:none"{/if}>
				{if $banner.data_map.external_url.has_content}
					{set
						$banner_link = $banner.data_map.external_url.content
						$banner_target = '_blank'
						$banner_title = $banner.data_map.external_url.data_text}
				{else}
					{set
						$banner_relation = fetch( 'content', 'related_objects', hash( 'object_id', $banner.contentobject_id, 'all_relations', array( 'common' ) ))
						$banner_link = $banner_relation.0.main_node.url_alias|ezurl
						$banner_title = $banner.data_map.image.content['original'].text}
				{/if}
				{attribute_view_gui attribute=$banner.data_map.image image_class='original' href=$banner_link target=$banner_target alt_text=$banner_title}
			</div>
			{set $banner_target = '_self'}
		{/foreach}
	</div>
</div>

<script type="text/javascript">
{literal}
var bbCookieOptions = {domain:'', path:'', hoursToLive:87600, secure:false};
var bigBannerIndex = jQuery.cookies.get('bigBannerIndex');
jQuery('#bigbanners-slider-' + '{/literal}{$unique_id}{literal}').each(function(){
		var rand = Math.floor(Math.random() * 1000000).toString();
		var startSlide = 0;
		var slideCount = $('.caroussel-slide', this).length;
		if (bigBannerIndex === 0 || bigBannerIndex) {
			startSlide = (bigBannerIndex + 1) % slideCount;
		}

		jQuery(this).addClass('cycle' + rand).after('<ul class="cycle-nav" />').cycle({
			fx:						'scrollHorz',
			timeout:				{/literal}{$timeout}{literal},
			pager:					$(this).siblings('.cycle-nav'),
			pagerAnchorBuilder:		function(idx, slide) {return '<li><a href="#"><span class="b"></span><span class="t">' + (idx + 1) + '</span></a></li>';},
			pause:					1,
			pauseOnPagerHover:		1,
			startingSlide: 			startSlide,
			before:					function(currSlideElement, nextSlideElement, options, forwardFlag) {
				if (!jQuery('.cycle' + rand).hasClass('saved')) {
					jQuery('.cycle' + rand).addClass('saved');
					jQuery.cookies.set('bigBannerIndex', String(startSlide), bbCookieOptions);
				}
			}
		});
	});
jQuery(function($){

});
{/literal}
</script>
{/if}
