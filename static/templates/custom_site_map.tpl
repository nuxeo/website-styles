<div id="siteMap">
  {attribute_view_gui attribute=$pagedesign.data_map.custom_site_map}
  <div style="clear:both;"></div>
  
  {def $custommap = fetch( 'content', 'node', hash( 'node_id', 2464))}
{attribute_view_gui attribute=$custommap.data_map.intro}
  
</div>

{*$pagedesign.data_map.custom_site_map.value.output|attribute(show,1)*}
