<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
<head>

{* A/B Testing with Optimizely *}
{literal}
<script src="//cdn.optimizely.com/js/540333129.js"></script>
{/literal}

{* Moved Marketo script to the bottom *}

{include uri='design:aplgwo_header.tpl'}

{def $basket_is_empty   = cond( $current_user.is_logged_in, fetch( shop, basket ).is_empty, 1 )
     $user_hash         = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri, $basket_is_empty, $current_user.contentobject_id, $extra_cache_key,
                         cond( ezhttp_hasvariable('dlURL','session'),ezhttp('dlURL','session'), 0 ) )}


{def $pagedata              = ezpagedata()
     $column_right_class    = false()
     $extramenu_sticky      = false()
     $pagestyle             = $pagedata.css_classes
     $locales               = fetch( 'content', 'translation_list' )
     $pagedesign            = $pagedata.template_look
     $current_node_id       = $pagedata.node_id}

{include uri='design:page_head.tpl'}
{include uri='design:page_head_style.tpl'}
{include uri='design:page_head_script.tpl'}

<link type="application/rss+xml" rel="alternate" href={'/nxc/rssfeed/news'|ezurl} title="News Nuxeo" />
<link type="application/rss+xml" rel="alternate" href={'/rss/feed/events'|ezurl} title="Events Nuxeo" />
{cache-block ignore_content_expiry expiry=0}
    {xajax_javascript()}
{/cache-block}

{if is_set($module_result.content_info.persistent_variable.head_javascript)}
    {$module_result.content_info.persistent_variable.head_javascript}
{/if}

{literal}
<script type="text/javascript">
window.analytics||(window.analytics=[]),window.analytics.methods=["identify","track","trackLink","trackForm","trackClick","trackSubmit","page","pageview","ab","alias","ready","group","on","once","off"],window.analytics.factory=function(t){return function(){var a=Array.prototype.slice.call(arguments);return a.unshift(t),window.analytics.push(a),window.analytics}};for(var i=0;i<window.analytics.methods.length;i++){var method=window.analytics.methods[i];window.analytics[method]=window.analytics.factory(method)}window.analytics.load=function(t){var a=document.createElement("script");a.type="text/javascript",a.async=!0,a.src=("https:"===document.location.protocol?"https://":"http://")+"d2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(a,n)},window.analytics.SNIPPET_VERSION="2.0.8",
window.analytics.load("4qquvje3fv");
window.analytics.page();
</script>
{/literal}


</head>
<body>
<!-- Complete page area: START -->
<!-- Change between "sidemenu"/"nosidemenu" and "extrainfo"/"noextrainfo" to switch display of side columns on or off  -->

{* PREVIOUS YELLOW RIBBON include uri='design:page_header_links.tpl' *}
  {include uri='design:page_header_x-nav.tpl'}

    {if is_set( $module_result.path.2 )}
        {def $thirdlevelnode=fetch( 'content', 'node', hash('node_id', $module_result.path.2.node_id) )}
        {if eq( $thirdlevelnode.class_identifier, 'product_sheet' )}
            {set $pagestyle = "nosidemenu noextrainfo"}
        {/if}
    {/if}

    {if is_set( $module_result.path.3 )}
        {def $thirdlevelnode=fetch( 'content', 'node', hash('node_id', $module_result.path.3.node_id) )}
        {if eq( $thirdlevelnode.class_identifier, 'product_sheet' )}
            {set $pagestyle = "nosidemenu noextrainfo"}
        {/if}
    {/if}


    {if and( is_set($module_result.content_info.class_identifier), $module_result.content_info.class_identifier| begins_with('download_registration_form') )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.content_info.class_identifier), eq($module_result.content_info.class_identifier, 'lending_page' ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.content_info.class_identifier), eq($module_result.content_info.class_identifier, 'mailing_page' ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.content_info.class_identifier), eq($module_result.content_info.class_identifier, 'plain_page' ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.content_info.class_identifier), eq($module_result.content_info.class_identifier, 'lending_page_without_download' ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

    {if and( is_set($module_result.content_info.class_identifier), eq($module_result.content_info.class_identifier, 'product_sheet' ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

    {if and( is_set($module_result.content_info.class_identifier), eq($module_result.content_info.class_identifier, 'search_engine_customer' ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

    {if and( is_set($module_result.content_info.class_identifier), eq($module_result.content_info.class_identifier, 'webinar_theme' ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

    <!-- hide left menu for Downloads and Analysts and for Community page -->
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 335 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 156 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 621 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 1157 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {* test/downloadz *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 1281 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {* test/downloadz 2 *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 2575 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 1902 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 1428 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 1990 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 2060 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 2481 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}
    {* Service test page on staging *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 2732 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

     {* 5.5 welcome *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 3891 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

         {*  page for education landing page *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 4026 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

      {*  page for finance landing page *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 5016 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}


    {* test page for dev *}
    {if and( is_set($module_result.node_id), eq($module_result.node_id, 4103 ) )}
        {set $pagestyle = "nosidemenu noextrainfo"}
    {/if}

    {if and(
        is_set($module_result.content_info.class_identifier),
        or(
            $module_result.content_info.class_identifier|eq( 'customer' ),
            $module_result.content_info.class_identifier|eq( 'resource' )
        )
    )}
        {set
            $column_right_class = "column-on-the-right"}
    {/if}

    {def $in_rc=false()}
    {foreach $module_result.path as $p}
        {if and( or( $p.node_id|eq( 2847 ), $p.node_id|eq( 3715 ) ), $module_result.content_info.class_identifier|eq('webinar_theme')|not)}
            {set $in_rc=true()}
        {/if}
    {/foreach}

    {if $in_rc}
        {set $column_right_class = "column-on-the-left"}
    {/if}
    {*if $module_result.content_info.class_identifier|eq('resource')}
        {set $column_right_class = "no-column-on-the-left"}
    {/if*}

    {if and( is_set($module_result.content_info.class_identifier), or(
            $module_result.content_info.class_identifier|eq( 'customer' )
        ) )}
        {set
            $extramenu_sticky = true()}
    {/if}

<div id="page" class="{$pagestyle}{if $column_right_class} {$column_right_class}{/if}{if is_set( $module_result.content_info.class_identifier )} cl-{$module_result.content_info.class_identifier}{/if}">

  {if and( is_set( $pagedata.persistent_variable.extra_template_list ),
             $pagedata.persistent_variable.extra_template_list|count() )}
    {foreach $pagedata.persistent_variable.extra_template_list as $extra_template}
        {include uri=concat('design:extra/', $extra_template)}
    {/foreach}
  {/if}

  <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->

  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}

  <!-- Top menu area: START -->
  {if $pagedata.top_menu}
      {include uri='design:page_topmenu.tpl'}
  {/if}
  <!-- Top menu area: END -->

  <!-- Path area: START -->
  {if and( eq( $pagedata.node_id, 2 )|not, $pagedata.show_path)}
      {include uri='design:page_toppath.tpl'}
  {/if}
  <!-- Path area: END -->

  <!-- Toolbar area: START -->
  {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
      {include uri='design:page_toolbar.tpl'}
  {/if}
  <!-- Toolbar area: END -->

  <!-- Columns area: START -->
  <div id="columns-position">
  <div id="columns" class="float-break">

    <!-- Side menu area wrapper in specific case: START -->
    {if $in_rc}
        <div id="sidemenu-wrapper">
    {/if}
    <!-- Side menu area wrapper in specific case: END -->

    <!-- Side menu area: START -->
    {*if and($pagedata.left_menu, $module_result.content_info.class_identifier|ne('resource'))*}
    {if $pagedata.left_menu}
        {include uri='design:page_leftmenu.tpl'}
    {/if}
    <!-- Side menu area: END -->

    <!-- Extra area loaded here in specific case: START -->
    {*if and( is_set($module_result.content_info.class_identifier), $module_result.content_info.class_identifier|eq( 'resource_center' ) )*}
    {if $in_rc}
            {include uri='design:page_extramenu.tpl' sticky=false()}
        </div>
    {/if}
    <!-- Extra area loaded here in specific case: END -->

  {/cache-block}
{/cache-block}
    <!-- Main area: START -->
    {include uri='design:page_mainarea.tpl'}
    <!-- Main area: END -->
{cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}

    {if is_unset($pagedesign)}
        {def $pagedata   = ezpagedata()
             $pagedesign = $pagedata.template_look}
    {/if}

    <!-- Extra area: START -->
    {if and( $in_rc|not, $pagedata.extra_menu)}
      {include uri='design:page_extramenu.tpl' sticky=$extramenu_sticky}
    {/if}
    <!-- Extra area: END -->

  </div>
  </div>
  <!-- Columns area: END -->
  <!-- Custom Site Map Footer area: START -->
  {*include uri='design:custom_site_map.tpl'*}
  <!-- Custom Site Map Footer area: END -->

  <!-- Footer area: START -->
  {*include uri='design:page_footer.tpl'*}
  <!-- Footer area: END -->
</div>
  {include uri='design:page_footer_x-nav.tpl'}
<!-- Complete page area: END -->

<!-- Footer script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->

{/cache-block}
{include uri='design:aplgwo_footer.tpl'}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->

<!-- Pardot, Google Analytics & Feedback widget javascripts -->

<!-- Marketo -->
<script src="http://munchkin.marketo.net/munchkin.js" type="text/javascript"></script>
<script>
{* register to marketo service *}
mktoMunchkin("498-JDO-611");

{if and( $module_result.node_id, array('lending_page','lending_page_without_download')|contains($module_result.content_info['class_identifier']))}
        fn = '{ezhttp('lpFirstName','session')}';
        ln = '{ezhttp('lpLastName','session')}';
        em = '{ezhttp('lpEmail','session')}';
    mktoMunchkinFunction('associateLead',
     {ldelim}
        Email: em,
        FirstName: fn,
        LastName: ln,
        Phone: '{ezhttp('lpPhone','session')}',
        Company: '{ezhttp('lpCompany','session')}',
      User_Message__c: '{ezhttp('lpMessage','session')}',
        Country: '{ezhttp('lpCountry','session')}'
     {rdelim}, '{ezhttp('lpHash','session')}');
{/if}
</script>
<!-- end of Marketo -->

<!-- Google Code for Visited nuxeo.com Remarketing List -->
{literal}
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1071414157;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "V-oMCJvu_gEQjffx_gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1071414157/?label=V-oMCJvu_gEQjffx_gM&guid=ON&script=0"/>
</div>
</noscript>
{/literal}

</body>
</html>
