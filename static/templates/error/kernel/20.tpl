{* Tsoulcie for Nuxeo march 2013  *}

<table>
<tr>
<td><img src={'blueman_404-not-found.jpg'|ezimage} class="errorimage" />
</td>
<td valign="top">


<h1 id="error_title">{"Oops! You didn't find the page you were looking for? We can help."|i18n("nuxeo/error/kernel")}

</h1>



{def $error_links = fetch( 'content', 'node', hash( 'node_id', 4870))}
<div id="error_links" class="float-break">
  {attribute_view_gui attribute=$error_links.data_map.description}
</div>
{undef $error_links}



</td>
</tr>
</table>
