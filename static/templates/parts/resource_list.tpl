{default $category='' $product='' $maxItems=10 $renderType='text' $gridSize=3}

{* Fetch resource list *}
{def $resource_item_list__=array()}
{if $product|is_object}
    {set $resource_item_list__=fetch('content','reverse_related_objects',
                hash( 'object_id', $product.contentobject_id,
                      'sort_by', array('published',false()),
                      'attribute_identifier', 'resource_item/product'))}
    {if $category}
        {if $category|is_array|not}
            {set $category=array($category)}
        {/if}
        {def $temp_item_list__=array()}
        {foreach $resource_item_list__ as $resource_item__}
            {foreach $resource_item__.assigned_nodes as $resource_item_node__}
                {if $category|contains($resource_item_node__.parent.node_id)}
                    {set $temp_item_list__=$temp_item_list__|append($resource_item_node__)}
                    {break}
                {/if}
            {/foreach}
        {/foreach}
        {set $resource_item_list__=$temp_item_list__}
        {undef $temp_item_list__}
    {/if}
    {if $resource_item_list__|gt($maxItems)}
        {set $resource_item_list__=$resource_item_list__|extract_left($maxItems)}
    {/if}
{else}
    {def $parent_node_id__=ezini('ResourceList','DefaultCenterNodeID','nuxeo.ini')
         $depth__=2}
    {if $category}
        {set $parent_node_id__=$category}
        {set $depth__=1}
    {/if}
    {set $resource_item_list__=fetch('content','list',
                hash('parent_node_id',$parent_node_id__,
                     'depth',$depth__,
                     'class_filter_type', 'include',
                     'class_filter_array', array('resource_item'),
                     'sort_by', array('published',false()),
                     'limit', $maxItems))}
    {undef $parent_node_id__ $depth__}
{/if}

{* Render resource list *}
{if $resource_item_list__|count}
    <div class="resource-list">
        {if $renderType|eq('thumbnail')}
            <table>
                {def $elem_counter__=0}
                {while $resource_item_list__[$elem_counter__]}
                    <tr>
                    {for 1 to $gridSize}
                        <td>
                            {if $resource_item_list__[$elem_counter__]}
                                {node_view_gui content_node=$resource_item_list__[$elem_counter__] view=thumb}
                            {else}
                                &nbsp;
                            {/if}
                        </td>
                        {set $elem_counter__=inc($elem_counter__)}
                    {/for}
                    </tr>
                {/while}
                {undef $elem_counter__}
            </table>
        {else}
            <ul>
                {foreach $resource_item_list__ as $resource_item__}
                    {node_view_gui content_node=$resource_item__ view=li}
                {/foreach}
            </ul>
        {/if}
    </div>
{undef $resource_item_list__}
