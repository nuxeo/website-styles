{* Old one

<div id="call_to_call">
  <a href="mailto:contact@nuxeo.com">
  <span class="contactUs">contact@nuxeo.com</span>
  </a>

  {def $contact_node = fetch( 'content', 'node', hash( 'node_id', 104))}

  <a href={$contact_node.url_alias|ezurl}>
  <span class="usCallUs">+1-617-682-3705</span>
  <span class="euCallUs">+33 1 40 33 79 87</span>
  </a>
</div>
*}

<div id="try-download-link" class="whynuxeo-link">

{def $why_node = fetch( 'content', 'node', hash( 'node_id', 2538))}


   <a href={$why_node.url_alias|ezurl}><span>{"Why Nuxeo ?"|i18n("nuxeo/topbar")}</span></a>

</div>