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

<div id="try-download-link">

{def $download_node = fetch( 'content', 'node', hash( 'node_id', 3908))}
  
    <a href={$download_node.url_alias|ezurl}><span>{"Try & Download"|i18n("nuxeo/topbar")}</span></a>
  
</div>