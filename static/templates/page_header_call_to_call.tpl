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

<div id="call_to_action">

{def $contact_node = fetch( 'content', 'node', hash( 'node_id', 104))}

{def $why_node = fetch( 'content', 'node', hash( 'node_id', 2538))}

  <p class="contact-us">
    <a href={$contact_node.url_alias|ezurl}>{"Contact us"|i18n("nuxeo/topbar")}</a>
  </p>
  
      <img src="/extension/nuxeo_design/design/nuxeo/images/download-link-bar.png" width="1" height="33" class="bar"/>
  
  <p class="whynuxeo"><a href={$why_node.url_alias|ezurl}>{"Why Nuxeo ?"|i18n("nuxeo/topbar")}</a></p>
  
</div>