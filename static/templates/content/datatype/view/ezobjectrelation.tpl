{if $attribute.content}

{section show=$attribute.content}
   {content_view_gui view=text_linked content_object=$attribute.content}
{section-else}

   {'No relation'|i18n( 'design/standard/content/datatype' )}
   
{/section}

{/if}