<div class="content-view-line">
    <div class="class-article float-break">
        {if eq( $node.class_identifier, 'product_sheet_feature' )}
            {def $url= $node.parent.url_alias|ezurl}
            <div class="attribute-title">
                <h2><a href={$url}>{$node.name|wash}</a></h2>
            </div>
            <div class="attribute-contentclass-name">
                {$node.class_name}
            </div>
            {if is_set( $node.data_map.image )}
                {if $node.data_map.image.has_content}
                    <div class="attribute-image">
                        {attribute_view_gui image_class=small href=$url attribute=$node.data_map.image}
                    </div>
                {/if}
            {/if}
            <div class="attribute-short">
                {$node.highlight}
            </div>
            <div class="attribute-short">
                <i>{$node.score_percent|wash}% - <a href={$url}>{$url|shorten(70, '...', 'middle')|wash}</a> - {$node.object.published|l10n(shortdatetime)}</i>
            </div>
        {else}
            <div class="attribute-title">
                {*<h2 style="margin-top: 0.5em; margin-bottom: 0.25em"><a href="{$node.global_url_alias}">{$node.name|wash}</a></h2>*}
                <h2><a href={$node.url_alias|ezurl}>{$node.name|wash}</a></h2>
            </div>
            <div class="attribute-contentclass-name">
                {$node.class_name}
            </div>

            {if is_set( $node.data_map.image )}
                {if $node.data_map.image.has_content}
                    <div class="attribute-image">
                        {attribute_view_gui image_class=small href=$node.url_alias|ezurl attribute=$node.data_map.image}
                        {*attribute_view_gui image_class=small href=concat( '"', $node.global_url_alias, '"' ) attribute=$node.data_map.image*}
                    </div>
                {/if}
            {/if}

            <div class="attribute-short">
                {$node.highlight}
            </div>

            <div class="attribute-short">
                <i>{$node.score_percent|wash}% - 
                <a href={$node.url_alias|ezurl}{*"{$node.global_url_alias}"*}>
                    {*$node.global_url_alias|shorten(70, '...', 'middle')|wash*}
                    {$node.url_alias|shorten(70, '...', 'middle')|wash}
                </a> - {$node.object.published|l10n(shortdatetime)}</i>
            </div>
        {/if}
    </div>
</div>
