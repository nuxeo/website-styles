{def $currentlocale = ezini( 'RegionalSettings', 'Locale', 'site.ini' )}
{def $translationslist=fetch( 'content', 'translation_list' )
     $langsitcs = ''
     $flag_path=''
     $translation_languge_name=array()
     $langpath=''}

<div id="language" class="language_selection">
    {foreach $translationslist as $translation}
        {if eq($translation.locale_full_code, $currentlocale)}
            <div class="language_selected_bloc">
                {set $flag_path=concat('flags/',$translation.locale_full_code,'.png')}

                <div class="flag {$currentlocale}"></div>
                <div class="flag flagarrow float-break"></div>

                <div id="languages_list_id" class="language_list_bloc" style="top: 35px;">
                    {foreach $pagedesign.data_map.language_settings.content.rows.sequential as $language}
                        {foreach $translationslist as $translation}
                            {set $langpath=''}
                            {if eq($translation.locale_full_code, $language.columns.2)}
                                {if $module_result.node_id}
                                    {set $langpath=fetch_url_alias($module_result.node_id, $language.columns.2)}
                                    {set $langpath=concat($language.columns.0, '/',$langpath)}
                                {else}
                                    {set $langpath=$language.columns.0}
                                {/if}

                                <a class="language_name float-break" href="{$langpath}" title="{$translation.language_name}" onmouseover="setlanguagelink(this);">
                                    {set $flag_path=concat('flags/',$translation.locale_full_code,'.png')}
                                    {*<div class="flag {$translation.locale_full_code}"></div>*}
                                    {set $translation_languge_name=$translation.language_name|explode(' ')}
                                    <span>{$translation_languge_name[0]}</span>
                                </a>
                            {/if}
                        {/foreach}
                    {/foreach}
                </div>
            </div>
        {/if}
    {/foreach}
</div>
