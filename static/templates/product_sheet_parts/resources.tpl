{def $video_attribute_id = ezini('ProductSheetResources','BlipVideoAttributeID','nuxeo.ini')
     $gallery_attribute_id = ezini('ProductSheetResources','FlickrGalleryAttributeID','nuxeo.ini')
     $resources_attribute_id = ezini('ProductSheetResources','ResourcesAttributeID','nuxeo.ini')
     $slideshow_attribute_id = ezini('ProductSheetResources','SlideshowAttributeAtArticle','nuxeo.ini')
     $videos_array = array()
     $screenshots_array = array()
     $screenshotrelated_object = array()
     $features = fetch( 'content', 'list', hash( 'parent_node_id', $product_sheet_overview_node.node_id,
                                                 'class_filter_type', include,
                                                 'class_filter_array', array('product_sheet_feature'),
                                                 'sort_by', $product_sheet_overview_node.sort_array,
                                                 'depth', 3
                                                ) ) }

{foreach $features as $feature}
    {def $related_objects = fetch( 'content', 'related_objects', hash( 'object_id', $feature.contentobject_id,
                                                                       'all_relations', true(),
                                                                       'group_by_attribute',   true() ) )}
    {if is_set($related_objects.$video_attribute_id)}
        {set $videos_array = $videos_array|merge(array($related_objects)) }
    {elseif is_set($related_objects.$gallery_attribute_id) }
        {set $screenshots_array = $screenshots_array|merge(array($related_objects)) }
    {/if}
    {undef $related_objects}
{/foreach}


<div style="clear:both;"></div>
{*
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.pack.js"></script>
<script type="text/javascript" src={'javascript/jquery.popin.js'|ezdesign}></script>
<script type="text/javascript" src={'javascript/pop_up_in.js'|ezdesign}></script>
*}
{def $resorces_related_objects = fetch( 'content', 'related_objects', hash( 'object_id', $current_node.contentobject_id,
                                                                   'all_relations', true(),
                                                                   'group_by_attribute',   true() ) )}

{if $resorces_related_objects.$resources_attribute_id|count()}
    <h3 id="screencasts">{'Video related to the resource'|i18n('nuxeo_design/products/resources')}</h3>
    {foreach $resorces_related_objects.$resources_attribute_id as $videoobject}
        <div class="resource_item">
            <h4>{$videoobject.name|wash}</h4>
            <div class="item">
                <a class="popin-open-05" href={$videoobject.main_node.url_alias|ezurl}>
                    {attribute_view_gui attribute=$videoobject.data_map.image image_class='resource'}
                </a>
            </div>
        </div>
    {/foreach}
{/if}
<div style="clear:both;"></div>

{if $resorces_related_objects.766|count()}
    <h3 id="screencasts">Related Screenshots galleries</h3>
    {foreach $resorces_related_objects.766 as $flickrobject}
        <div class="resource_item">
            <h4>{$flickrobject.name|wash}</h4>
            <div class="item">
                <a class="popin-open-05" href={$flickrobject.main_node.url_alias|ezurl}>
                    {attribute_view_gui attribute=$flickrobject.data_map.image image_class='resource'}
                </a>
            </div>
        </div>
    {/foreach}
    <div style="clear:both;"></div>
{/if}


{if $videos_array|count()|gt(0) }

    {* Get all objects id from array and remove duplicate *}
    {def $relatedobjects_id_list=array()
         $related_object=array()
         $videoid_screenid=''
         $exploded_videoid_screenid=array()
         $duplicate_state=0}
    {foreach $videos_array as $video}
        {set $duplicate_state=0}
        {if is_set($video.$gallery_attribute_id)}
            {set $videoid_screenid=concat($video.$video_attribute_id.0.main_node_id,'_',$video.$gallery_attribute_id.0.main_node_id)}
        {else}
            {set $videoid_screenid=$video.$video_attribute_id.0.main_node_id}
        {/if}
        {foreach $relatedobjects_id_list as $relatedobjects_id}
            {if eq( $relatedobjects_id[0], $video.$video_attribute_id.0.main_node_id )}
                {set $duplicate_state=1}
            {/if}
        {/foreach}
        {if ne( $duplicate_state, 1 )}
            {set $relatedobjects_id_list=$relatedobjects_id_list|append($videoid_screenid|explode('_'))}
        {/if}
    {/foreach}
    {*  END of the duplicate remove*}

    <h3 id="screencasts">{'Screencasts'|i18n('product_sheet_parts/resources')}</h3>
    {foreach $relatedobjects_id_list as $related_objectid}
        {set $related_object=fetch('content', 'node', hash( 'node_id', $related_objectid[0] ))}
        <div class="resource_item">
            <h4>{$related_object.name|wash}</h4>
            <div class="item">
                <a class="popin-open-05" href={$related_object.url_alias|ezurl}>
                    {attribute_view_gui attribute=$related_object.data_map.image image_class='resource'}
                </a>
            </div>
            {if is_set($related_objectid[1])}
                {set $related_object=fetch('content', 'node', hash( 'node_id', $related_objectid[1] ))}
                <div class="item linked">
                    <a class="popin-open-05" href={$related_object.url_alias|ezurl}>
                        {'See screenshots'|i18n('product_sheet_parts/resources')}
                    </a>
                    {'for this feature.'|i18n('product_sheet_parts/resources')}
                </div>
            {/if}
        </div>
    {/foreach}

    {*foreach $videos_array as $related_objects}
        <div class="resource_item">
            <h4>{$related_objects.$video_attribute_id.0.name|wash}</h4>
            <div class="item">
                <a class="popin-open-05" href={$related_objects.$video_attribute_id.0.main_node.url_alias|ezurl}>
                    {attribute_view_gui attribute=$related_objects.$video_attribute_id.0.data_map.image image_class='resource'}
                </a>
            </div>
            {if is_set($related_objects.$gallery_attribute_id)}
                <div class="item linked">
                    <a class="popin-open-05" href={$related_objects.$gallery_attribute_id.0.main_node.url_alias|ezurl}>
                        {'See screenshots'|i18n('product_sheet_parts/resources')}
                    </a> 
                    {'for this feature.'|i18n('product_sheet_parts/resources')}
                </div>
            {/if}
        </div>
    {/foreach*}
    <div style="clear:both;"></div>

{/if}

{if $screenshots_array|count() }
    {* Get all id of screenshots objects and remove duplicate*}
    {def $screenshotsrelatedobjects_id_list=array()}
    {foreach $screenshots_array as $screenshot}
            {set $screenshotsrelatedobjects_id_list=$screenshotsrelatedobjects_id_list|append($screenshot.$gallery_attribute_id.0.main_node_id)}
    {/foreach}
    {set $screenshotsrelatedobjects_id_list=$screenshotsrelatedobjects_id_list|unique}
    {* End of the duplicate remove *}

    <h3 id="screenshots">{'Screenshots'|i18n('product_sheet_parts/resources')}</h3>
    {foreach $screenshotsrelatedobjects_id_list as $related_objectid}
        {set $screenshotrelated_object=fetch('content', 'node', hash( 'node_id', $related_objectid ))}
        <div class="resource_item">
            <h4>{$screenshotrelated_object.name|wash}</h4>
            <div class="item">
                <a class="popin-open-05" href={$screenshotrelated_object.url_alias|ezurl}>
                    {attribute_view_gui attribute=$screenshotrelated_object.data_map.image image_class='resource'}
                </a>
            </div>
        </div>
    {/foreach}
    {*foreach $screenshots_array as $related_objects}
        <div class="resource_item">
            <h4>{$related_objects.$gallery_attribute_id.0.name|wash}</h4>
            <div class="item">
                <a class="popin-open-05" href={$related_objects.$gallery_attribute_id.0.main_node.url_alias|ezurl}>
                    {attribute_view_gui attribute=$related_objects.$gallery_attribute_id.0.data_map.image image_class='resource'}
                </a>
            </div>
        </div>
    {/foreach*}
    <div style="clear:both;"></div>
{/if}


{if $resorces_related_objects.$slideshow_attribute_id|count()}
    <h3 id="screencasts">Related slideshows</h3>
    {foreach $resorces_related_objects.$slideshow_attribute_id as $videoobject}
        <div class="resource_item">
            <h4>{$videoobject.name|wash}</h4>
            <div class="item">
                <a class="popin-open-05" href={$videoobject.main_node.url_alias|ezurl}>
                    {attribute_view_gui attribute=$videoobject.data_map.image image_class='resource'}
                </a>
            </div>
        </div>
    {/foreach}
    <div style="clear:both;"></div>
{/if}
