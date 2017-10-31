{* WARNING! do not move this comment above first line or add newline at the end of this file, it will be rendered as a blank space before/after link in HTML output *}<a href={$href|ezurl}{if $id} id="{$id}"{/if}
    {if $title} title="{$title}"{/if}
    {if $target} target="{$target}"{/if}
    {if $classification} class="{$classification|wash}"{/if}
    {if and(is_set( $hreflang ), $hreflang)} hreflang="{$hreflang|wash}"{/if}
    {if and(is_set( $onclickaction ), $onclickaction)}onClick="{$onclickaction}"{/if}>{$content}</a>