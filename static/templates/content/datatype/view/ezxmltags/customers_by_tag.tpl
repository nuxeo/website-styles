{if and( is_set( $tag_id ), $tag_id|gt( 0 ) )}
    {def $lang = ezini('RegionalSettings','ContentObjectLocale', 'site.ini.append.php')
         $customersNode = ezini('CustomersNode','CustomersNodeID', 'nuxeo.ini.append.php') }

    {def $customers_with_tag = fetch( 'content', 'tree', hash( 'parent_node_id', $customersNode,
                                                               'extended_attribute_filter', hash( 'id', 'TagsAttributeFilter',
                                                                                                  'params', hash( 'tag_id', $tag_id ) ),
                                                               'language', $lang,
                                                               'class_filter_type', 'include',
                                                               'class_filter_array', array( 'customer' ),
                                                               'sort_by', array( 'priority', false(), 'published', false() )
                                                            )
                                                        )}

    {if $customers_with_tag|count|gt(0)}
        <div class="customerlogoshow">
            {foreach $customers_with_tag as $customer sequence array( 'bglight', 'bgdark' ) as $style}
                <div class="logoshow {$style}">
                    <a href={$customer.url_alias|ezurl}>
                        {attribute_view_gui attribute=$customer.data_map.logo image_class='customerlogoshow'}
                    </a>
                </div>
            {/foreach}
        </div>
    {/if}
    {undef $customers_with_tag $customersNode $lang}
{/if}




