{def $topmenuitem_submenulist=array()}
{def $topmenuitem_widgetlist=array()}
{if is_set($current_user)|not}
  {def $current_user=fetch( 'user', 'current_user' ) }
{else}
  {set $current_user=fetch( 'user', 'current_user' ) }
{/if}
{def $aux = 0}
<div class="topmenu-design"> 
    
    <!-- Top menu content: START -->
    <ul id="topmenu-firstlevel">
    {def $root_node=fetch( 'content', 'node', hash( 'node_id', $pagedata.root_node) )
         $top_menu_items=fetch( 'content', 'list', hash( 'parent_node_id', $root_node.node_id,
                                                          'sort_by', $root_node.sort_array,
                                                          'extended_attribute_filter', hash(
                                                              'id','InMenuFilter', 
                                                              'params', hash('menu', 'top', 'classes', ezini( 'MenuContentSettings', 'TopIdentifierList', 'menu.ini' ))) ))
         $top_menu_items_count = $top_menu_items|count()
         $item_class = array()
         $current_node_in_path = first_set($pagedata.path_array[1].node_id, 0  )}
    {if $top_menu_items_count}
       {foreach $top_menu_items as $key => $item}
            {set $item_class = cond($current_node_in_path|eq($item.node_id), array("selected"), array())}
            {if $key|eq(0)}
                {set $item_class = $item_class|append("firstli")}
            {/if}
            {if $top_menu_items_count|eq( $key|inc )}
                {set $item_class = $item_class|append("lastli")}
            {/if}
            {if $item.node_id|eq( $current_node_id )}
                {set $item_class = $item_class|append("current")}
            {/if}

            {set $topmenuitem_widgetlist=fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
            																'class_filter_type', 'include',
            																'sort_by', array( 'published', true() ),
            																'class_filter_array', array('menu_widget'),
            																'offset', 0, 'limit', 1))}

			{if $topmenuitem_widgetlist|count|not}
	            {set $topmenuitem_submenulist=fetch( 'content', 'list', hash( 'parent_node_id', $item.node_id,
	                                                                          'sort_by', $item.sort_array,
	                                                                          'extended_attribute_filter', hash(
	                                                                              'id','InMenuFilter', 
	                                                                              'params', hash('menu', 'top', 'classes', ezini( 'MenuContentSettings', 'SubTopIdentifierList', 'menu.ini' ))) ))}
			{else}
				{set $topmenuitem_submenulist=array()}
			{/if}

            {if eq( $item.class_identifier, 'link')}
                <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if}><div><a {if eq( $ui_context, 'browse' )}href={concat("content/browse/", $item.node_id)|ezurl}{else}href={$item.data_map.location.content|ezurl} target="_blank"{/if}{if $pagedata.is_edit} onclick="return false;"{/if} title="{$item.data_map.location.data_text|wash}"><span>{$item.name|wash()}</span></a></div></li>
            {else}
		{if not(eq($item.node_id,850))}
                <li id="node_id_{$item.node_id}"{if $item_class} class="{$item_class|implode(" ")}"{/if} >
                    <a href={if eq( $ui_context, 'browse' )}{concat("content/browse/", $item.node_id)|ezurl}{else}{$item.url_alias|ezurl}{/if}{if $pagedata.is_edit} onclick="return false;"{/if}>
                        <span>
                            {$item.name|wash()}
                        </span>
                    </a>
                    {if or( $topmenuitem_widgetlist|count(), $topmenuitem_submenulist|count(), and(is_set($item.data_map.menu_highlight), $item.data_map.menu_highlight.has_content) )}
                        <div id="topmenudropdown_{$item.node_id}" class="topmenudropdawn">
                          <div class="up-triangle">  </div>
                            {*<div class="arrow_style_class">*}
                            {if $topmenuitem_widgetlist|count()}
                            	<div class="menuList">
                            		{node_view_gui view=line content_node=$topmenuitem_widgetlist[0]}
                            	</div>
                            {elseif $topmenuitem_submenulist|count()}
                                <div class="menuList">
                                  <ul>
                                  {set $aux = $topmenuitem_submenulist|count}
                                  {foreach $topmenuitem_submenulist as $key => $submenuitem}
                                      <li{if $key|inc|eq( $aux )} class="last"{/if}><a class="listItem" href={$submenuitem.url_alias|ezurl} title="">{$submenuitem.name|wash()}</a></li>
                                  {/foreach}
                                  </ul>
                                </div>
                            {/if}
                            {if and(is_set($item.data_map.menu_highlight), $item.data_map.menu_highlight.has_content)}
                                {$item.data_map.menu_highlight.content}
                            {/if}
                            {*if $topmenuitem_submenulist|count()}
                              <div class="menuList">
                                {foreach $topmenuitem_submenulist as $key => $submenuitem}
                                    <a class="listItem" href={$submenuitem.url_alias|ezurl} title="">{$submenuitem.name|wash()}</a>
                                {/foreach}
                              </div>
                            {/if*}
                            <div style="clear:both;"></div>
                            {*</div>*}
                            
                        </div>
                    {/if}
                </li>
		{/if}
            {/if}
          {/foreach}
    {/if}
    {undef $root_node $top_menu_items $item_class $top_menu_items_count $current_node_in_path}
    </ul>
    <!-- Top menu content: END -->
</div>
