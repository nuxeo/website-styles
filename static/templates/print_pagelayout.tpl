{*?template charset=utf8?*}
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">

<head>
{section name=JavaScript loop=ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ) }
    <script language="JavaScript" type="text/javascript" src={concat( 'javascript/',$:item )|ezdesign}></script>
{/section}
    <link rel="stylesheet" type="text/css" href={"stylesheets/core.css"|ezdesign} />

<style type="text/css">
  @import url({"stylesheets/nuxeo_style.css"|ezdesign(no)});
  @import url({"stylesheets/nuxeo_brochure_style.css"|ezdesign(no)});
</style>
{include uri="design:page_head.tpl" enable_print=false()}
</head>

<body>
<table width="100%"  border="0" cellpadding="0" cellspacing="0" class="brochure_sheet">
<tr>
<td colspan="2" align="right" valign="top" class="brochure_header">
<img src="/extension/nuxeo_design/design/nuxeo/images/nuxeo_logo__.png" width="173" height="60" alt="Nuxeo logo"/>
</td>
</tr><tr>
<td width="70%" valign="top" class="brochure_content">
{* Main area START *}
{include uri="design:page_mainarea.tpl"}
{* Main area END *}
</td>  

<td width="30%" valign="top" class="brochure_column">

{def $about_us = fetch( 'content', 'node', hash( 'node_id', 61))}

 <div class="brochure_box">
   <h5>{attribute_view_gui attribute=$about_us.data_map.name}</h5>
   <div>
   <p>
         {$about_us.data_map.description.content.output.output_text|striptags|shorten(821)}
   </p>
   </div>
 </div>

{def $products = fetch( 'content', 'node', hash( 'node_id', 62))}

  <div class="brochure_box">
   <h5>{attribute_view_gui attribute=$products.data_map.name}</h5>
   <div>
   <p>
         {$products.data_map.short_description.content.output.output_text|striptags|shorten(536)}
   </p>
   </div>
 </div>

{def $contact_us = fetch( 'content', 'node', hash( 'node_id', 151))}

  <div class="brochure_box">
   <h5>Contact</h5>
   <h6>{attribute_view_gui attribute=$contact_us.data_map.nuxeo_office_name_identifier}</h6>
     <div>
     <ul>
    {if $node.data_map.phone_number.has_content}
    <li>{'By phone:'|i18n('nuxeo_design/listitem/office')} {attribute_view_gui attribute=$contact_us.data_map.phone_number}</li>
    {/if}
   {if $node.data_map.fax_address.has_content}
    <li>{'By fax:'|i18n('nuxeo_design/listitem/office')} {attribute_view_gui attribute=$contact_us.data_map.fax_address}</li>
   {/if} 
    <li>{'By email:'|i18n('nuxeo_design/listitem/office')} <a href="mailto:{attribute_view_gui attribute=$contact_us.data_map.email_adress}">{attribute_view_gui attribute=$contact_us.data_map.email_adress}</a></li>
    <li>{'Visit us:'|i18n('nuxeo_design/listitem/office')} {attribute_view_gui attribute=$contact_us.data_map.location_adress}</li>
  </ul>
  
  {def $contact_fr = fetch( 'content', 'node', hash( 'node_id', 118))}
  
  </div>
  <h6>{attribute_view_gui attribute=$contact_fr.data_map.nuxeo_office_name_identifier}</h6>
     <div>
     <ul>
    {if $node.data_map.phone_number.has_content}
    <li>{'By phone:'|i18n('nuxeo_design/listitem/office')} {attribute_view_gui attribute=$contact_fr.data_map.phone_number}</li>
    {/if}
   {if $node.data_map.fax_address.has_content}
    <li>{'By fax:'|i18n('nuxeo_design/listitem/office')} {attribute_view_gui attribute=$contact_fr.data_map.fax_address}</li>
   {/if} 
    <li>{'By email:'|i18n('nuxeo_design/listitem/office')} <a href="mailto:{attribute_view_gui attribute=$contact_fr.data_map.email_adress}">{attribute_view_gui attribute=$contact_fr.data_map.email_adress}</a></li>
    <li>{'Visit us:'|i18n('nuxeo_design/listitem/office')} {attribute_view_gui attribute=$contact_fr.data_map.location_adress}</li>
  </ul>
  </div>
 </div>
 
</td>
 </tr>
</table>

<!--DEBUG_REPORT-->

</body>
</html>
