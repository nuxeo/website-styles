<div id="logo">
{if $pagedesign.data_map.image.content.is_valid|not()}
    <h1><a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}">{ezini('SiteSettings','SiteName')}</a></h1>
{else}
{* Test if node is homepage, then logo in h1 *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 2 ) )}
        <h1>
    {/if}
    <a href={"/"|ezurl} title="{ezini('SiteSettings','SiteName')}"><img src={$pagedesign.data_map.image.content[original].full_path|ezroot} alt="{$pagedesign.data_map.image.content[original].text}" width="{$pagedesign.data_map.image.content[original].width}" height="{$pagedesign.data_map.image.content[original].height}" /></a>
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 2 ) )}
        </h1>
    {/if}
{/if}

</div>


    {include uri='design:page_header_languages.tpl'}
          
    {include uri='design:page_header_searchbox.tpl'}
