    <div style="clear: both;"></div>
    <div class="content-view-embed">
        <div class="theyTrustUsContainer">
            <script language="JavaScript" type="text/javascript">
            <!--
                var leftactivearrow = {'customers_arrow/left_arrow.jpg'|ezimage}
                var leftunactivearrow = {'customers_arrow/left_arrow_gray.jpg'|ezimage}
                var rightactivearrow = {'customers_arrow/right_arrow.jpg'|ezimage}
                var rightunactivearrow = {'customers_arrow/right_arrow_gray.jpg'|ezimage}
            -->
            </script>
            <img class="arrowsliders" id="jqlogos_to_the_left" src={'pixel.png'|ezimage} alt='Move left' width="23" height="250" />
            <div id="customers_logo_container" class="attribute-short" style="width: 530px; height: 250px; float: left; overflow: hidden;">
                {def $customers_list = array()}
                {foreach $#node.data_map.customer_relations.content.relation_list as $item}
                    {set $customers_list = $customers_list|append(fetch('content', 'node', hash('node_id', $item.node_id)))}
                {/foreach}

                {if $customers_list|count()}
                    <div id="customers_logo_list" style="height: 250px;" >
                        {foreach $customers_list as $key => $customer}
                            {*set $customerscount = inc($customerscount)*}
                                <div class="customer-quote" style="height: 218px;">
                            
                            <h4><a href={$customer.url_alias|ezurl} title="Customer">{attribute_view_gui attribute=$customer.data_map.name}</a></h4>
                            
                              <div class="customer-logo">
                                <a href={$customer.url_alias|ezurl} title="Customer">
                                {attribute_view_gui attribute=$customer.data_map.logo image_class=customerlogo180}
                                </a>
                                </div>
                                    {if $customer.data_map.quote.has_content}
                                    <blockquote>
                                    <p>
                                    {attribute_view_gui attribute=$customer.data_map.quote}
                                    </p>
                                    <p>
                                    {attribute_view_gui attribute=$customer.data_map.quote_author}
                                    </p>
                                    </blockquote>    
                                    {/if}
                                    <div class="customer-link-case-study">
                                        <a href={$customer.url_alias|ezurl} title="Read the case study">{"» Read the case study"|i18n('nuxeo_design/customer_slider')}</a>
                                    </div>
                                </div>
                        {/foreach}
                    </div>
                {/if}
            </div>
            <img class="arrowsliders" id="jqlogos_to_the_right" src={'pixel.png'|ezimage} alt="Move right" width="23" height="250" />
            <div style="clear: both;"></div>
        </div>
    </div>
