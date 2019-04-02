<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
  <head>
  {literal}
    <style type="text/css">
     @import url("http://static.nuxeo.com/stylesheets/login.css");
    </style>

      <script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript">
      </script>
      <script language="javascript" src="https://blogs.nuxeo.com/media/js/jgfeed.js" type="text/javascript">
      </script>

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

      <script type="text/javascript">document.write(unescape("%3Cscript src='https://munchkin.marketo.net/munchkin.js' type='text/javascript'%3E%3C/script%3E"));</script>
      <script>Munchkin.init('498-JDO-611');</script>

    {/literal}
  </head>

  <body>

    <div class="news_block">

      <!--
      <h1>Improve your experience</h1>

        <div class="news">
          To improve your user experience, you may download:
          <ul>
            <li>The <a onclick="window.open(this.href); return false;" href="http://download.nuxeo.org/desktop-integration/drag-drop/msie/">
              Internet Explorer Extension</a></li>
            <li>The <a onclick="window.open(this.href); return false;" href="https://download.nuxeo.com/browser/firefox/nuxeo-dragdrop-ff-extension.xpi">
              Firefox Extension </a></li>
          </ul>
        </div>

      <h1>User Guide</h1>

        <div class="news">
          <a href="http://doc.nuxeo.org/xwiki/bin/view/Main/QuickStart_DAM/" onclick="window.open(this.href); return false;">Latest version of the user guide for Nuxeo DAM.</a>
        </div>
    -->
   <h1>Hot News</h1>
    {*NEWS LIST*}
        {def $foldernode = fetch( 'content', 'node', hash('node_id', 66 ) )
             $curdate=currentdate()
             $children=fetch( 'content', 'list', hash( 'parent_node_id', $foldernode.node_id,
                                                       'limit', 6,
                                                       'class_filter_type', 'include',
                                                       'class_filter_array', array('news'),
                                                       'attribute_filter', array( array( 'news/publish_date', '<=', $curdate ) ),
                                                       'sort_by', array( 'attribute', false(),'news/publish_date' ) ) )
        }

        {if $children|count()}
            <div class="content-view-children">
                {foreach $children as $child}
                <div class="news">
                    <span>
                      {*$curdate|datetime( 'custom', ' %d %M %y' )*}
                      {$child.data_map.publish_date.value.timestamp|datetime( 'custom', '%n/%d/%Y' )}
                    </span>
                    <span> &#149; </span>
                    <span>
                        <a href={$child.url_alias|ezroot()} onclick="window.open(this.href); return false;">
                            {$child.name|wash}
                        </a>
                    </span>
                </div>
                {/foreach}
            </div>
        {/if}

    {*End of the news list*}
    </div>

  </body>
</html>
