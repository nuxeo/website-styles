<div class="headerSearchBox" id="searchbox">
  <form action={"/content/search"|ezurl}>
    <label for="searchtext" class="hide">{'Search text:'|i18n('design/ezwebin/pagelayout')}</label>
    {if $pagedata.is_edit}
    <input id="searchtext" name="SearchText" type="text" value="" size="12" disabled="disabled" />
    <input id="searchbutton" class="button-disabled" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" alt="{'Search'|i18n('design/ezwebin/pagelayout')}" disabled="disabled" />
    {else}
    <input id="searchtext" name="SearchText" type="text" size="12"  onblur="if(this.value=='')this.value=this.defaultValue;" onfocus="if(this.value==this.defaultValue)this.value='';" value="Search" />        
    
    <input id="searchbutton" class="button" type="submit" value="{'Search'|i18n('design/ezwebin/pagelayout')}" alt="{'Search'|i18n('design/ezwebin/pagelayout')}" />
        {if eq( $ui_context, 'browse' )}
         <input name="Mode" type="hidden" value="browse" />
        {/if}
    {/if}
  </form>
</div>