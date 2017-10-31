
    {include uri='design:page_header_languages.tpl'}
    
<div id="metanav">
 
 {def $contact_node = fetch( 'content', 'node', hash( 'node_id', 104))}

 <ul>
   <li><a href={$contact_node.url_alias|ezurl}>{"Contact us"|i18n("nuxeo/topbar")}</a></li>
   <li><a href="http://blogs.nuxeo.com/" onclick="window.open(this.href); return false;">Blogs</a></li>
   <li><a href="http://marketplace.nuxeo.com/" onclick="window.open(this.href); return false;">Marketplace</a></li>
   <li><a href="http://connect.nuxeo.com/" onclick="window.open(this.href); return false;">Nuxeo Connect</a></li>
   <li><a href="http://answers.nuxeo.com/" onclick="window.open(this.href); return false;">Answers</a></li>
   <li><a href="http://doc.nuxeo.com/" onclick="window.open(this.href); return false;">Doc</a></li>
   <li class="metaicon first">
   
   <a href="http://twitter.com/nuxeo" class="twitter-follow-button" data-show-count="false" data-width="115px" show_screen_name="false" data-lang={"en"|i18n("nuxeo/topbar")}>Suivre</a>
<script src="http://platform.twitter.com/widgets.js" type="text/javascript"></script>
   
   {* <a class="icon-twitter" href="http://twitter.com/nuxeo/"><span>Twitter</span></a> *}
   
   </li>
   <li class="metaicon"><a class="icon-linkedin" target="_blank" href="http://www.linkedin.com/groupRegistration?gid=43314"><span>LinkedIn</span></a></li>
   <li class="metaicon last"><a class="icon-feed" href={'nxc/rssfeed/news'|ezurl}><span>RSS Feed</span></a></li>
    
 
 </ul>

</div>

