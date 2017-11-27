
<div id="xnav" style="display:none;">
<div class="xnav-set">

 <ul>
   <li class="selected"><a href="http://www.nuxeo.com/">www.nuxeo.com</a></li>
   <li><a href="http://www.nuxeo.com/blog/">Blogs</a></li>
   <li><a href="http://answers.nuxeo.com/">Answers</a></li>
   <li><a href="http://doc.nuxeo.com/">Doc</a></li>
   <li><a href="http://connect.nuxeo.com/" target="_blank">My Connect Account</a></li>
   <li><a href="http://www.nuxeo.com/en/about/contact">Contact us</a></li>
 </ul>

 {def $lang=ezini( 'RegionalSettings', 'ContentObjectLocale', 'site.ini' )}
 <div id="tabby-button">
  <a href={if $lang|eq('fre-FR')}"http://www.nuxeo.com/fr/telechargez-nuxeo"{else}"http://www.nuxeo.com/en/downloads"{/if} class={'en'|i18n('nuxeo/topbar')} title="Download the Nuxeo Platform"><span id="arrow">{'Download'|i18n('nuxeo/topbar')}</span>
  <span id="more">{'The Nuxeo Platform'|i18n('nuxeo/topbar')}</span>
  </a>
 </div>
 {undef $lang}

 <div style="clear:both;"></div>

</div>
</div>

