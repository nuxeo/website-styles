<table>
<tr>
<td><img src={'blueman_access-denied-nuxeo.com-.jpg'|ezimage} class="errorimage" />
</td>
<td valign="top">




<h1 id="error_title">
{"This page isn't available, but we can help you find what you're looking for."|i18n("nuxeo/error/kernel")}
</h1>




{def $error_links = fetch( 'content', 'node', hash( 'node_id', 4870))}
<div id="error_links" class="float-break">
  {attribute_view_gui attribute=$error_links.data_map.description}
</div>
{undef $error_links}



<div class="error_login">

{section show=eq($current_user.contentobject_id,$anonymous_user_id)}

    {section show=$embed_content}

    {$embed_content}
    {section-else}

        <form method="post" action={"/user/login/"|ezurl}>

        <p>{"Click the Login button to login."|i18n("design/standard/error/kernel")}</p>
        <div class="buttonblock">
        <input class="button" type="submit" name="LoginButton" value="{'Login'|i18n('design/standard/error/kernel','Button')}" />
        </div>

        <input type="hidden" name="Login" value="" /><input type="hidden" name="Password" value="" /><input type="hidden" name="RedirectURI" value="{$redirect_uri}" />
        </form>

    {/section}

{/section}

</div>

</td>
</tr>
</table>

