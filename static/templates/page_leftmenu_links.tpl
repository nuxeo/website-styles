<!-- links in column: START -->

{* https://jira.nuxeo.com/browse/EZNX-39
 {if eq( $pagedata.node_id, 810 )|not} 
    
      {def $side_image = fetch( 'content', 'node', hash( 'node_id', 1287))}
  {def $side_node = fetch( 'content', 'node', hash( 'node_id', 875))}

         <p class="side_link">
          <a href={$side_node.url_alias|ezurl}>
        {attribute_view_gui attribute=$side_image.data_map.image image_class=original}
          </a>
        </p>
     
*}

 
  {* {def $side_image = fetch( 'content', 'node', hash( 'node_id', 1287))}
  {def $side_node = fetch( 'content', 'node', hash( 'node_id', 875))}

  {def $alternative_side_image = fetch( 'content', 'node', hash( 'node_id', 1728))}
  {def $alternative_side_node = fetch( 'content', 'node', hash( 'node_id', 745))}

   <p class="side_link">

{if $pagedata.path_arr ay.1.node_id|eq(60) }

  <a href={$alternative_side_node.url_alias|ezurl}>
   {attribute_view_gui attribute=$alternative_side_image.data_map.image image_class=original}
  </a>
  
  {else}
  
    <a href={$side_node.url_alias|ezurl}>
        {attribute_view_gui attribute=$side_image.data_map.image image_class=original}
   </a>

 {/if} 

  </p>  *}

   <!-- links in column area: END -->