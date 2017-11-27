<div style="clear:both;"></div>


{def $capabilities = fetch( 'content', 'list', hash( 'parent_node_id', $current_node.node_id,
                                                     'class_filter_type', include,
                                                     'class_filter_array', array('product_sheet_capability'),
                                                     'sort_by', $current_node.sort_array,
                                                    ))}

{*
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.pack.js"></script>
<script type="text/javascript" src={'javascript/jquery.popin.js'|ezdesign}></script>
<script type="text/javascript" src={'javascript/pop_up_in.js'|ezdesign}></script>
*}

{foreach $capabilities as $key => $capability}

{def $features = fetch( 'content', 'list', hash( 'parent_node_id', $capability.node_id,
                                                 'class_filter_type', include,
                                                 'class_filter_array', array('product_sheet_feature'),
                                                 'sort_by', $capability.sort_array,
                                                ))}

<h2 id="{$capability.data_map.short_name.content}">
  {if $capability.data_map.icon.has_content}
    {attribute_view_gui attribute=$capability.data_map.icon image_class=original}
  {/if}
  {$capability.name}</h2>

{if ne($key, 0)}
    <a href="#top" title="">{'Back to top'|i18n('nuxeo_design/product_parts/capabilities')}</a>
{/if}

{foreach $features as $feature}

    <div class="nxbox feature">
        <h3> {$feature.name|wash} </h3>
        <div class="body">

            {if $feature.data_map.illustration.has_content}
                <div class="feature_illustration">
                    {attribute_view_gui attribute=$feature.data_map.illustration image_class=partners}
                </div>
            {/if}

            {attribute_view_gui attribute=$feature.data_map.description}
            
            {if $feature.data_map.illustration.has_content}
              <div style="clear:both;"></div>
            {/if} 
            
        </div>
        
        

        <div class="bottom">
            {if $feature.data_map.related_video.has_content}
            <div class="links">
                <ul>
                    <li>
                        <a href={$feature.data_map.related_video.content.main_node.url_alias|ezurl} class="popin-open-05">
                            {'Screencast'|i18n('nuxeo_design/product_sheet_parts/capabilities')}
                        </a>
                        {if $feature.data_map.related_gallery.has_content}
                            /
                        {/if}
                    </li>
            {if $feature.data_map.related_gallery.has_content|not}
                </ul>
            </div>
            <div style="clear:both;"></div>
            {/if}
            {/if}

            {if $feature.data_map.related_gallery.has_content}
                {if $feature.data_map.related_video.has_content|not}
                    <div class="links">
                        <ul>
                {/if}
                            <li>
                                <a href={$feature.data_map.related_gallery.content.main_node.url_alias|ezurl} class="popin-open-05">
                                    {'Screenshots'|i18n('nuxeo_design/product_sheet_parts/capabilities')}
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div style="clear:both;"></div>
            {/if}

            {if $feature.data_map.related_gallery.has_content|not}
                {if $feature.data_map.related_video.has_content|not}
                    <div class="empty_bottom">
                    </div>
                {/if}
            {/if}
        </div>
    </div>
{/foreach}




{/foreach}