{def $capabilities_tabs = fetch( 'content', 'list', hash( 'parent_node_id', $product_sheet_node.node_id,
                                                          'class_filter_type', include,
                                                          'class_filter_array', array('product_sheet_capability'),
                                                          'sort_by', $product_sheet_node.sort_array,
                                ))}

{if $capabilities_tabs|count|gt(0) }
    <div id="capabilities">
        <ul>
            {foreach $capabilities_tabs as $capability_tab sequence array('odd', 'even') as $style }
                <li class="{$style}{if $capability_tab.node_id|eq($current_node.node_id) } selected{/if}">
                    <a href="#{$capability_tab.data_map.short_name.content}" title="">{attribute_view_gui attribute=$capability_tab.data_map.icon image_class=original} {$capability_tab.name|wash}</a>
                </li>
            {/foreach}
        </ul>
    </div>
{/if}