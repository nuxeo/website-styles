{def $event_type_map = hash( 'event', 1, 'training', 2, 'webinar', 3  )}
<div class="content-view-embed">
    <div class="class-folder">
        {def $foldernode = fetch( 'content', 'node', hash('node_id', $object.main_node_id ) )}
        {def $curdate=currentdate()
             $compdate = sub($curdate, 86400)
             $begindateofevent=0
             $sortedarray = array()
             $attribute_filter = array()
        }
        {if is_set( $event_type )}
            {set $attribute_filter = array( 'and',
                array( 'event/date_end', '>=', $compdate ),
                array( 'event/type_event', '=', $event_type_map[$event_type] ) )}
        {else}
            {set $attribute_filter = array( array( 'event/date_end', '>=', $compdate ) )}
        {/if}

        {def $children=fetch( 'content', 'list', hash( 'parent_node_id', $object.main_node_id,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', array('event'),
                                                       'attribute_filter', $attribute_filter,
                                                       'sort_by', array( 'attribute', true(), 'event/date_end' )
                                                     ) )}


        {*-Select events wich begin today-*}
        {foreach $children as $key => $child}
            {if eq($sortedarray|count(), 6)}
                {break}
            {/if}
            {set $begindateofevent = sum( $child.data_map.date_begin.value.timestamp, 86400 ) }
            {if and( gt( $curdate, $child.data_map.date_begin.value.timestamp ), lt($curdate, $begindateofevent) )}
                {set $sortedarray = $sortedarray|append($child)}
            {/if}
        {/foreach}

        {*-Fill in events array if there are not 6 items-*}
        {foreach $children as $child}
            {if eq($sortedarray|count(), 6)}
                {break}
            {else}
                {set $begindateofevent = sum( $child.data_map.date_begin.value.timestamp, 86400 ) }
                {if and( gt( $curdate, $child.data_map.date_begin.value.timestamp ), lt($curdate, $begindateofevent) )}
                    {skip}
                {else}
                    {set $sortedarray = $sortedarray|append($child)}
                {/if}
            {/if}
        {/foreach}
        <div class="content-view-children">
            {if $sortedarray|count|eq(0)}
                <p>{'No forthcoming session planned for this course yet. Please contact us if you would be interested in the next session.'|i18n('nuxeo_design/full/folder_events')}</p>
            {else}
                {def
                    $event_type_label_map = hash( 'label1', 'Event', 'label2', 'Training', 'label3', 'Webinar' )
                    $event_type_label = ''}
                {foreach $sortedarray as $child}
                    <div class="events_in_list float-break">
                        {* insert my calendar sheet here *}
                        {if and( $child.data_map.date_begin.has_content, $child.data_map.date_end.has_content )}
                            <div class="calendar_sheet">
                                <div class="calendar_month">
                                    {if eq( $child.data_map.date_begin.value.month, $child.data_map.date_end.value.month )}
                                        {$child.data_map.date_begin.value.timestamp|datetime( 'custom', '%M' )|upcase()}
                                    {else}
                                        {$child.data_map.date_begin.value.timestamp|datetime( 'custom', '%M' )|upcase()}-{$child.data_map.date_end.value.timestamp|datetime( 'custom', '%M' )|upcase()}
                                    {/if}
                                </div>
                                <div class="calendar_day">
                                    {if eq( $child.data_map.date_begin.value.timestamp, $child.data_map.date_end.value.timestamp )}
                                        {$child.data_map.date_begin.value.day}
                                    {else}
                                        {$child.data_map.date_begin.value.day}-{$child.data_map.date_end.value.day}
                                    {/if}
                                </div>
                            </div>
                            <div class="event-details">
                                <p class="event-location">{$child.data_map.location.content|wash}</p>
                                <p class="event-time">{$child.data_map.date_begin.value.timestamp|datetime( 'custom', '%F %d, %Y' )} - {$child.data_map.date_end.value.timestamp|datetime( 'custom', '%F %d, %Y' )}</p>
                            </div>
                        {/if}

                        {if and( is_unset( $event_type ), $child.data_map.type_event.content.0|is_numeric )}
                            {set $event_type_label = $event_type_label_map[concat( 'label', $child.data_map.type_event.content.0 )]}
                        {/if}

                        {* Remove this date *}
                        {*
                        <div class="event_date">
                            {if and($child.data_map.date_begin.has_content, $child.data_map.date_end.has_content)}

                            {if eq($child.data_map.date_begin.value.timestamp,$child.data_map.date_end.value.timestamp)}
                                {$child.data_map.date_begin.value.timestamp|datetime('custom','%d %M %Y')}
                                {else}
                                {$child.data_map.date_begin.value.day}
                                {if eq($child.data_map.date_begin.value.month,$child.data_map.date_end.value.month)}
                                    - {$child.data_map.date_end.value.day}
                                    {$child.data_map.date_begin.value.timestamp|datetime( 'custom', '%M' )|upcase()}
                                    {$child.data_map.date_begin.value.year}
                                {else}
                                    {$child.data_map.date_begin.value.timestamp|datetime( 'custom', '%M' )|upcase()}
                                    - {$child.data_map.date_end.value.day}
                                    {$child.data_map.date_end.value.timestamp|datetime( 'custom', '%M' )|upcase()}
                                    {$child.data_map.date_begin.value.year}
                                    {/if}
                            {/if}

                            {/if}
                        </div>
                        *}
                    </div>
                {/foreach}
            {/if}
        </div>
    </div>
</div>
