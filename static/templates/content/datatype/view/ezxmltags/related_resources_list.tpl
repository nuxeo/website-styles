{* 2013-03-18 NETGEN - list of related resources and webinar themes in product sheet tab*}
{if $#node.data_map.product_tags.has_content }
  {def $limit = 7
       $resourceCenterNodeId = ezini('ResourceCenterNode','ResourceCenterNodeID','nuxeo.ini')
       $resourceCenterNode = fetch('content', 'node', hash('node_id', $resourceCenterNodeId ) )
       $tag_identifier = ezini( "related_resources_list_tag","Field","nuxeo.ini" )
       $tag_name = ezini( "related_resources_list_tag","Name","nuxeo.ini" ) 

       $urlSearchParameters = concat( '?SearchText=&filter[]=',$tag_identifier, ':\"',
                                      $#node.data_map.product_tags.content.tags.0.keyword|explode(' ')|implode('+'), 
                                      '\"&activeFacets[', $tag_identifier ,':', $tag_name,']=', 
                                      $#node.data_map.product_tags.content.tags.0.keyword|explode(' ')|implode('+') ) 
        
       $filterParametersUpcomingWebinars = array( 'and', 
                                                concat( 'attr_product_tags_k:\"',$#node.data_map.product_tags.content.tags.0.keyword, '\"'),
                                                array(  'and', 
                                                        'meta_class_identifier_ms:webinar_theme',
                                                        'ngindexer_event_date_attr_date_begin_dt____dt:[NOW TO *]' ) )
       
       $filterParametersOtherResources=array( 'and', 
                                              concat( 'attr_product_tags_k:\"',$#node.data_map.product_tags.content.tags.0.keyword, '\"'),
                                              array( 'or', 
                                                     'meta_class_identifier_ms:resource', 
                                                      array( 'and',
                                                             'meta_class_identifier_ms:webinar_theme',
                                                             array( 'and',
                                                                    'ngindexer_event_date_attr_date_begin_dt____dt:[* TO NOW]',
                                                                    '!ngindexer_event_date_attr_date_begin_dt____dt:[NOW TO *]' ) ) ) )
       
       $searchUpcomingWebinars = fetch( 'ezfind', 'search', hash( 'subtree_array', array( $resourceCenterNodeId ),
                                                                'class_id', array( 'webinar_theme' ),
                                                                'sort_by', hash( 'ngindexer_event_date_attr_date_begin_dt____dt', 'asc'),
                                                                'limit', $limit,
                                                                'filter', $filterParametersUpcomingWebinars ) )

       $search_result = $searchUpcomingWebinars['SearchResult']
       $search_count = $searchUpcomingWebinars['SearchCount'] 
  }

  {if $search_count|lt($limit)}
    {def $limit2 = sub($limit, $search_count)
         $searchOtherResources = fetch( 'ezfind', 'search', hash( 'subtree_array', array( $resourceCenterNodeId ),
                                                                  'class_id', array( 'resource', 'webinar_theme' ),
                                                                  'sort_by', hash( 'published', 'desc' ),
                                                                  'limit', $limit2,
                                                                  'filter', $filterParametersOtherResources ) )
         $search_result2 = $searchOtherResources['SearchResult']
         $search_count2 = $searchOtherResources['SearchCount'] 
    }
  {/if}

  <div class="class-related-resources-list">
    <h2 id="related-resources-title">{'Videos, Slides and Webinars'|i18n('nuxeo_design/full/product_sheet')}</h2>
    {foreach $search_result as $related_resource}
      {node_view_gui content_node=$related_resource view='line'}
    {/foreach}
    {if and(is_set($search_count2), $search_count2|gt(0))}
      {foreach $search_result2 as $related_resource}
        {node_view_gui content_node=$related_resource view='line'}
      {/foreach}
    {/if}
    <p class="jump_arrow paragraph" id="related-resources-link">
      <a href={concat($resourceCenterNode.url_alias, $urlSearchParameters)|ezurl()}>{'All related resources'|i18n('nuxeo_design/full/product_sheet')}</a>
    </p>
  </div> 
  {if $search_count|lt($limit)}
    {undef $search_count2 $search_result2 $searchOtherResources $limit2}
  {/if}
  {undef $search_count $search_result $searchUpcomingWebinars $filterParametersOtherResources $filterParametersUpcomingWebinars $urlSearchParameters $tag_name $tag_identifier $resourceCenterNode $resourceCenterNodeId $limit}
{/if}
