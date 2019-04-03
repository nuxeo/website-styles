<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
    <head>
        {def  $pagedata         = ezpagedata()
              $current_node_id  = $pagedata.node_id}

        {if and(is_set($current_node_id), $current_node_id|gt(0))}
            {def $current_node = fetch(content, node, hash(node_id, $current_node_id))}
        {/if}

        <title>{if is_set($current_node)}{$current_node.name}{else}Nuxeo{/if}</title>

        {literal}
            <style type="text/css">
            <!--

                #debug {
                  display:none;
                }
                h1 {
                  color: #333;
                  font: bold 15px "Lucida Grande", sans-serif;
                  padding: 0 0 10px;
                  margin: 0 0 0 0;
                }

                h2 {
                  color: #343434;
                  font: bold 14px "Lucida Grande", sans-serif;
                  padding: 0;
                  padding-bottom:5px;
                  margin: 2px 0 15px 0;
                  border-bottom: 2px solid #f1f2f3;
                }

                #page {
                  padding: 5px 10px;
                }

                .news_block, .blogs_block, .webinars_block, #free-html {
                  padding: 5px 10px;
                }

                #free-html p {
                 line-height:185%;
                }

                .news, .blog, .webinar {
                  color: #494949;
                  font: normal 11px "Lucida Grande", sans-serif;
                  margin: 5px 0;
                }

                p {
                  color: #494949;
                  font: normal 11px "Lucida Grande", sans-serif;
                  margin: 5px 0;
                }

                ul {
                  margin: 0;
                  padding: 0;
                  list-style: none;
                }

                li {
                  padding: 3px 0 0;
                }

                a {
                  font: normal 11px "Lucida Grande", sans-serif;
                  text-decoration: none;
                  color: #0063C6;
                }

                a:hover {
                  text-decoration: underline;
                }

                .google-dfp {
                background-color: #F2FAFD;
                border-left: 7px solid #BDE4F5;
                color: #000000;
                font-size: 12px;
                line-height: 150%;
                margin: 1em 0;
                padding: 5px 2px 2px 15px;
                }

                .google-dfp h2 {
                margin:0;
                border-bottom:0;
                }

                .button {
                  display:block;
                 }
            -->
            </style>

            <script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
            <script language="javascript" src="/var/storage/login/dm-login_data/jgfeed.js" type="text/javascript"></script>
            <script type="text/javascript">
                var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
                document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
            </script>

            <script type="text/javascript">
                try {
                    var pageTracker = _gat._getTracker("UA-81135-11");
                    pageTracker._trackPageview();
                    } catch(err) {
                    }
            </script>
        {/literal}

        {$current_node.data_map.html.content}

    </head>
    <body>
        <div id="page">
            {attribute_view_gui attribute=$current_node.data_map.body}
        </div>

        {* NETGEN 2013-06-11 PLACEHOLDER FOR LATEST BLOGS LIST *}
        {cache-block expiry=3600}
        <div class="blogs_block" id="blogs-block"></div>
        {/cache-block}

        {* NETGEN 2013-06-11 LATEST 5 UPCOMING WEBINARS *}
        {def $webinars_node_id = ezini('ResourceCenterNode', 'WebinarsNodeID', 'nuxeo.ini')
             $curdate = currentdate()
             $webinar_events = fetch( 'content', 'tree', hash( 'parent_node_id', $webinars_node_id,
                                                               'limit', 5,
                                                               'class_filter_type', 'include',
                                                               'class_filter_array', array('webinar_event'),
                                                               'attribute_filter', array( array( 'webinar_event/date_begin', '>=', $curdate ) ),
                                                               'sort_by', array( 'attribute', true(), 'webinar_event/date_begin' ) ) ) }
        {if $webinar_events|count|gt(0)}
            <div class="webinars_block">
                <h2>Upcoming webinars</h2>
                {foreach $webinar_events as $event}
                    <div class="webinar">
                        {def $curr_lang = ezini('RegionalSettings', 'ContentObjectLocale')}
                        <span>
                        {if eq($curr_lang, 'eng-US')}
                            {$event.data_map.date_begin.content.timestamp|timezone_update('result_type','embed')}
                        {else}
                            {$event.data_map.date_begin.content.timestamp|datetime( 'custom', '%n/%j/%Y' )} {$event.data_map.date_begin.content.timestamp|datetime( 'custom', '%H:%i %T' )}
                        {/if}
                        </span>
                        {undef $curr_lang}

                        <span> &#149; </span>
                        <span><a href={$event.parent.url_alias|ezurl} onclick="window.open(this.href); return false;">{$event.parent.name}</a></span>
                    </div>
                {/foreach}
            </div>
        {/if}

        {* NETGEN 2013-06-11 BODY HTML BLOCK *}
        <div id="free-html">
        {$current_node.data_map.body_html.content}
        </div>

    {literal}
      <script type="text/javascript" src="https://munchkin.marketo.net/munchkin.js"></script>
      <script>Munchkin.init('498-JDO-611');</script>
    {/literal}
  </body>
</html>

{* NETGEN 2013-06-11 LATEST BLOGS LIST SCRIPT *}
{ezscript_load( array( 'ezjsc::jquery', 'ezjsc::jqueryio', 'jquery.xml2json.min.js' ) )}

<script type="text/javascript">
    {def
      $start_ts = 1296000
      $month_seconds = 2592000
    }

    {literal}
    jQuery(document).ready(function($){
      $.ez('ezjscBlogs::fetchFeed', {}, function(data) {
        var entries = $.xml2json(data.content).channel.item,
          months = [{/literal}{for 0 to 11 as $month_index}"{$month_seconds|mul( $month_index )|sum( $start_ts )|datetime( 'custom', '%n' )|downcase}"{delimiter},{/delimiter}{/for}{literal}],
          date,
          limit = 5;
        $( '#blogs-block' ).append('<h2>Latest blogs</h2>');
        for ( i in entries ) {
          if (limit == 0) break;
          limit -= 1;
          date = new Date( entries[i].pubDate );
          $( '#blogs-block' ).append( '<div class="blog"><span> ' + months[date.getMonth()] + '/' + date.getDate() + '/' + date.getFullYear() + '</span><span> &#149; </span><span><a href="' + entries[i].link + '" onclick="window.open(this.href); return false;">' + entries[i].title + '</a></span></div>' );
        }
      });
    });
    {/literal}
</script>
{* END LATEST BLOGS LIST SCRIPT *}
