{if or( and( is_set($node.data_map.header), $node.data_map.header.has_content ),
	    and( is_set($node.data_map.image), $node.data_map.image.has_content ),
	    and( is_set($node.data_map.content), $node.data_map.content.has_content ),
	    and( is_set($node.data_map.url), $node.data_map.url.has_content) )}

	{if and(is_set($node.data_map.header), $node.data_map.header.has_content)}
		<div class="infobox-header">
			<h2>{attribute_view_gui attribute=$node.data_map.header}</h2>
		</div>
	{/if}

	<div class="infobox">
		{if and( is_set($node.data_map.image), $node.data_map.image.has_content )}
		    <div class="attribute-image">
		        {attribute_view_gui attribute=$node.data_map.image href=$node.object.data_map.image_url.data_text image_class='infoboximage'}
		    </div>
		{/if}

		{if and(is_set($node.data_map.content),$node.data_map.content.has_content)}
		    <div class="attribute-long">
		        {attribute_view_gui attribute=$node.data_map.content}
		    </div>
		{/if}

		{if and(is_set($node.data_map.url), $node.data_map.url.has_content)}
		    <div class="attribute-link">
		        <p>{attribute_view_gui attribute=$node.data_map.url}</p>
		    </div>
		{/if}

		{if or( $node.object.can_edit, $node.object.can_remove )}
		    <div class="controls">
		        <form action={"/content/action"|ezurl} method="post">
		        {if $node.object.can_edit}
		            <input type="image" name="EditButton" src={"edit-infobox-ico.gif"|ezimage} alt="Edit" />
		            <input type="hidden" name="ContentObjectLanguageCode" value="{$node.object.current_language}" />
		        {/if}
		        {if $node.object.can_remove}
		            <input type="image" name="ActionRemove" src={"trash-infobox-ico.gif"|ezimage} alt="Remove" />
		        {/if}
		            <input type="hidden" name="ContentObjectID" value="{$node.object.id}" />
		            <input type="hidden" name="NodeID" value="{$node.node_id}" />
		            <input type="hidden" name="ContentNodeID" value="{$node.node_id}" />
		        </form>
		    </div>
		{/if}
	</div>
{/if}
