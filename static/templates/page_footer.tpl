  <!-- Footer area: START -->
  
  <div id="footer">
    <address>
    {if $pagedesign.data_map.custom_footer.has_content}
        {attribute_view_gui attribute=$pagedesign.data_map.custom_footer} 
    {/if}
    {if $pagedesign.data_map.hide_powered_by.data_int|not}
    Powered by <a href="http://ez.no" title="eZ Publish Content Management System">eZ Publish&#8482;</a> Content Management System.
    {/if}
    {*$pagedesign.data_map.hide_powered_by|attribute(show,1)*}
    </address>
  </div>
  
  
  {include uri='design:page_footer_social.tpl'}
  
  <!-- Footer area: END -->
