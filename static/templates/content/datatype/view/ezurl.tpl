{def $onclick = "" }

{if  $attribute.content|extract(0, 7)|eq('http://') }
	{set $onclick = ' onClick="window.open(this.href); return false;"' }
{/if}

{if $attribute.data_text}
<a href="{$attribute.content}"{$onclick}>{$attribute.data_text|wash( xhtml )}</a>
{else}
<a href="{$attribute.content}"{$onclick}>{$attribute.content|wash( xhtml )}</a>
{/if}
