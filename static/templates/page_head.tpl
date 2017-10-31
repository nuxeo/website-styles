{default enable_help=true() enable_link=true()}
{def $pathcount=0
     $pathlength=$module_result.path|count()
     $site_title=""}

{if is_set($module_result.content_info.persistent_variable.site_title)}
    {set scope=root site_title=$module_result.content_info.persistent_variable.site_title}
{else}
    {let name=Path
         path=$module_result.path
         reverse_path=array()}
      {if is_set($pagedata.path_array)}
        {set path=$pagedata.path_array}
      {elseif is_set($module_result.title_path)}
        {set path=$module_result.title_path}
      {/if}
      {section loop=$:path}
        {set reverse_path=$:reverse_path|array_prepend($:item)}
      {/section}

    {set-block scope=root variable=site_title}{section loop=$Path:reverse_path}{set scope=root $pathcount=$pathcount|inc()}{if lt( $pathcount, $pathlength )}{$:item.text|wash}{/if}{if lt( $pathcount, $pathlength )} - {/if}{/section}{$site.title|wash}{/set-block}

    {/let}
{/if}
{if and($module_result.path[0].text|eq('Error'), $module_result.path[1].text|eq('kernel (20)'))}
    {set site_title='Page not found (404)'|i18n('design/standard/error')}
{/if}
    <title>{$site_title}</title>

    {if and(is_set($#Header:extra_data),is_array($#Header:extra_data))}
      {section name=ExtraData loop=$#Header:extra_data}
      {$:item}
      {/section}
    {/if}

    {if $module_result.content_info}
        {if eq($module_result.content_info.class_identifier, 'lending_page' )}
            {if ezhttp_hasvariable('dlURL','session')}
                {def $dlURL = ezhttp(  'dlURL', 'session'  )}
                {if ne( $dlURL, '' )}
                    <meta http-equiv="Refresh" content="1; URL={$dlURL}" />
                    <!--Test-->
                {/if}
            {/if}
        {/if}
    {/if}

    {* check if we need a http-equiv refresh *}
    {if $site.redirect}
    <meta http-equiv="Refresh" content="{$site.redirect.timer}; URL={$site.redirect.location}" />

    {/if}

{*------ meta tag with description ----*}

{def $array_node_id_from_path = array() }
{foreach $module_result.path as $pathitem}
    {if $pathitem.node_id}
        {set $array_node_id_from_path = $array_node_id_from_path|prepend($pathitem.node_id)}
    {/if}
{/foreach}

{def $currentnode=array()}
{foreach $array_node_id_from_path as $objnodeid}
    {set $currentnode = fetch('content', 'node', hash( 'node_id', $objnodeid ))}
    {if and(is_set($currentnode.data_map.description_for_seo),$currentnode.data_map.description_for_seo.has_content)}
        <meta name="description" content="{$currentnode.data_map.description_for_seo.content}"/>
        {break}
    {/if}
{/foreach}

{*---- end of code for meta with description ----*}

{*----Meta tag with keyword----*}

{foreach $array_node_id_from_path as $objnodeid}
    {set $currentnode = fetch('content', 'node', hash( 'node_id', $objnodeid ))}
    {if and(is_set($currentnode.data_map.keywords_for_seo), $currentnode.data_map.keywords_for_seo.has_content)}
        <meta name="keywords" content="{$currentnode.data_map.keywords_for_seo.content}"/>
        {break}
    {/if}
{/foreach}

{*----End of code for meta tag with keyword----*}

    {foreach $site.http_equiv as $key => $item}
            <meta name="{$key|wash}" content="{$item|wash}" />
    {/foreach}
    {foreach $site.meta as $key => $item}
        {if or( eq($key, 'description'), eq($key, 'keywords') )}
            {skip}
        {/if}
        {if is_set( $module_result.content_info.persistent_variable[$key] )}
            <meta name="{$key|wash}" content="{$module_result.content_info.persistent_variable[$key]|wash}" />
        {else}
            {if and($module_result.ui_component|eq('error'),$key|eq('robots'))}
                <meta name="{$key|wash}" content="{$item|wash},NOINDEX,NOFOLLOW" />
            {else}
                <meta name="{$key|wash}" content="{$item|wash}" />
            {/if}
        {/if}
    {/foreach}

    <meta name="viewport" content="width=device-width" />

    <meta name="MSSmartTagsPreventParsing" content="TRUE" />

    <meta property="twitter:account_id" content="18466576" />

    <meta name="google-site-verification" content="NsO0_Y7sfUiuSwZ9cea4AyfNmVnwEiMijFJkMXvHlII" />

{if is_set($module_result.content_info.persistent_variable['canonical_url'])}
    <link rel="canonical" href="{$module_result.content_info.persistent_variable['canonical_url']|ezurl('no','full')}" />
{/if}

{if $enable_link}
    {include uri="design:links.tpl" enable_help=$enable_help enable_link=$enable_link}
{/if}

{/default}
