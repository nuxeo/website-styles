{def $selected_main_category_node = false()}

<ul class="facetList resource-type-selector float-break">
	{if is_unset( $view_parameters.resource_type )}
		<li><span><strong>{"Resource Type"|i18n("nuxeo_design/full/search_engine_customer")}</strong></span>
			<ul class="ezfilter" id="ezf-resource_type">
				{foreach $main_categories as $main_category}
					<li class="ezf-{$main_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase}">{$main_category.name|wash( xhtml )}</li>
				{/foreach}
			</ul>
		</li>
	{else}
		<li class="selectedFacet"><a id="ezf-resource_type" href="#" class="ezfilter-remove">[x]&nbsp;</a><strong>{"Resource Type"|i18n("nuxeo_design/full/search_engine_customer")}</strong>:&nbsp;
			{foreach $main_categories as $main_category}
				{if $view_parameters.resource_type|eq( $main_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase )}
					{$main_category.name|wash( xhtml )}
					{set $selected_main_category_node = $main_category}
					{break}
				{/if}
			{/foreach}
		</li>
		{if $selected_main_category_node.node_id|eq( 2848 )}
			{def $video_categories = fetch( 'content', 'list',
				hash(
					'parent_node_id', $selected_main_category_node.node_id,
					'class_filter_type', 'include',
					'class_filter_array', array( 'resource_category' ),
					'sort_by', $selected_main_category_node.sort_array,
					'depth', 1 ) )}
			{if is_unset( $view_parameters.resource_category )}
				<li><span><strong>{"Video category"|i18n("nuxeo_design/full/search_engine_customer")}</strong></span>
					<ul class="ezfilter" id="ezf-resource_category">
						{foreach $video_categories as $video_category}
							<li class="ezf-{$video_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase}">{$video_category.name|wash( xhtml )}</li>
						{/foreach}
					</ul>
				</li>
			{else}
				<li class="selectedFacet"><a id="ezf-resource_category" href="#" class="ezfilter-remove">[x]&nbsp;</a><strong>{"Video Category"|i18n("nuxeo_design/full/search_engine_customer")}</strong>:&nbsp;
					{foreach $video_categories as $video_category}
						{if $view_parameters.resource_category|eq( $video_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase )}
							{$video_category.name|wash( xhtml )}
							{break}
						{/if}
					{/foreach}
				</li>
			{/if}
			<select name="resource_category" class="ezfilter" style="display:none">
				<option value="-1"{cond( or( is_unset( $view_parameters.resource_category ), $view_parameters.resource_category|eq( -1 ) ), ' selected="selected"', '' )}>{"Video Category"|i18n("nuxeo_design/full/search_engine_customer")}</option>
				{foreach $video_categories as $video_category}
					<option value="{$video_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase}"{cond( and( is_set( $view_parameters.resource_category ), $view_parameters.resource_category|eq( $video_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase ) ), ' selected="selected"', '' )}>{$video_category.name|wash( xhtml )}</option>
				{/foreach}
			</select>
		{/if}
	{/if}
</ul>

{*TODO cache block*}

<select name="resource_type" class="ezfilter ezfilter-master" style="display:none">
	<option value="-1"{cond( or( is_unset( $view_parameters.resource_type ), $view_parameters.resource_type|eq( -1 ) ), ' selected="selected"', '' )}>{"Resource Type"|i18n("nuxeo_design/full/search_engine_customer")}</option>
	{foreach $main_categories as $main_category}
		<option value="{$main_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase}"{cond( and( is_set( $view_parameters.resource_type ), $view_parameters.resource_type|eq( $main_category.url_alias|explode( '/' )|extract_right( 1 )[0]|downcase ) ), ' selected="selected"', '' )}>{$main_category.name|wash( xhtml )}</option>
	{/foreach}
</select> 

{*/TODO cache block*}
