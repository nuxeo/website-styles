  <!-- START --> 
  <div id="blogRollBar">
  
  {*$pagedata|attribute(show,1)*} 
  {*$site.http_equiv.Content-language*}
   
    <div class="blogRollZone">
      
      
      {if $site.http_equiv.Content-language|eq('fr-FR')}
      
       <iframe src="http://www.nuxeo.com/embedded/yellow-ribbon-fr" onload="javascript:this.style.visibility='visible';" style="visibility: visible;border:none;width:980px;height:18px;overflow:hidden;" class="yellowribbon" frameborder="0" scroll="no" marginheight="0"></iframe>    
      
      {else}
      
 <iframe src="http://www.nuxeo.com/embedded/yellow-ribbon-en" onload="javascript:this.style.visibility='visible';" style="visibility: visible;border:none;width:980px;height:18px;overflow:hidden;" class="yellowribbon" frameborder="0" scroll="no" marginheight="0"></iframe>      
      
      {/if} 
       
       
       
       
    </div>
  </div>
  <!-- END -->
