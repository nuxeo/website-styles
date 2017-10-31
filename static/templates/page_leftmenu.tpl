    <div id="sidemenu-position">
      <div id="sidemenu">
        {if is_array( $pagedata.left_menu )}
            {foreach $pagedata.left_menu as $left_menu}
                {include uri=concat('design:menu/', $left_menu, '.tpl')}
                {delimiter}<div class="hr"></div>{/delimiter}
            {/foreach}
        {else}
            {include uri=concat('design:menu/', $pagedata.left_menu, '.tpl')}
        {/if}
       </div>
       
       <div id="links_in_column">
         {include uri='design:page_leftmenu_links.tpl'}
       </div>
       
    </div>