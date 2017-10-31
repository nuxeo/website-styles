<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
  <head>
  {literal}
    <style type="text/css">
        <!--
        H1 {
          color: #343434;
          font: bold 14px "Lucida Grande", sans-serif;
          padding: 0;
          margin: 2px 0 15px 0;
          border-bottom: 1px dotted #8B8B8B;
        }
    
        H2 {
          color: #999;
          font: bold 11px "Lucida Grande", sans-serif;
          padding: 0;
          margin: 0 0 0 0;
        }
        
        h6 {
          color: #333;
          font: bold 11px "Lucida Grande", sans-serif;
          padding: 0 0 10px;
          margin: 0 0 0 0;
        }
    
        .news_container {
          width: 100px;
          color: #343434;
        }
    
        .news_block {
          background: transparent url(/nuxeo/img/theme_galaxy/news_bg.png) 0 repeat-x;
          padding: 5px 10px;
        }
    
        .news {
          font: normal 11px "Lucida Grande", sans-serif;
          padding-bottom: 15px;
          color: #494949;
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
          color: #000;
        }
    
        a:hover {
          text-decoration: underline;
        }
        
        .button, .button:visited {
          -moz-border-radius:6px 6px 6px 6px;
          -moz-box-shadow:0 1px 3px rgba(0, 0, 0, 0.6);
          background:url("http://static.nuxeo.com/images/overlay.png") repeat-x scroll 0 0 #ededed;
          border-bottom:1px solid rgba(0, 0, 0, 0.4);
          color:#333;
          cursor:pointer;
          display:inline-block;
          padding:3px 7px 4px;
          margin:0 0 3px;
          position:relative;
          text-decoration:none;
          width:300px;
          text-align:center;
          text-shadow:0 1px 1px rgba(0, 0, 0, 0.10);
          }
          
          .button:hover {
            background-color:#e6e6e6; 
          }
          
          .button span {
            font-weight:bold;
            }
            
           .small {
            width:110px;
            }
            
           .links span {
            display:block;
            float:left;
            width:180px;
            }
            
            .links .small {
              float:right;
              margin:0 0 8px;
              }
              
            .links p {
              width:310px;
              }
    
        -->
      </style>
  
      <script language="javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript">
      </script>
      <script language="javascript" src="http://blogs.nuxeo.com/media/js/jgfeed.js" type="text/javascript">
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

      <script type="text/javascript">
          var piProtocol = (("https:" == document.location.protocol) ? "https://" : "http://");
          document.write(unescape("%3Cscript src='" + piProtocol + "pi.pardot.com/pi.js' type='text/javascript'%3E%3C/script%3E"));
      </script>
      <script type="text/javascript">
        <!--
          piAId = "2304";
          piCId = "31974";
          piHostname = "pi.pardot.com";
          piIncludeInActivities = true;
          piTracker();
        -->
      </script>
    {/literal}
  </head>

  <body>
    
    <div class="news_block">
      
      <h6>Welcome to Nuxeo DM</h6>
    
      <h1>Next Steps</h1>
    
        <div class="news links">
          <p><span>Customization & configuration environment</span><a class="button small">Nuxeo Studio<br/>Trial Offer</a></p>
          <div style="clear:both;"></div>
          <p><span>Comprehensive subscription support offering</span><a class="button small">Nuxeo Connect</a></p>
          <div style="clear:both;"></div>
          <p><span>Improve your experience </span><a class="button small">Browser addons</a></p>
          <div style="clear:both;"></div>
        </div>
        
        
        <div class="news">
        For more information about Nuxeo ECM offerings: <a href="mailto:contact@nuxeo.com">contact@nuxeo.com</a>.
        </div>
        
        <h1>Engage</h1>
    
        <div class="news links">
          <p><span>Start conversations with users </span><a class="button small">Discussion Forums</a></p>
          <div style="clear:both;"></div>
          <p><span>Get insight into ECM issues</span> <a class="button small">Blogs</a></p>
          <div style="clear:both;"></div>
          <p><span>Meet with us</span><a class="button small">Events</a></p>
          <div style="clear:both;"></div>
        </div>
        
    
        <!--)<div class="news">
	  {def $rel=ezhttp('rel','get')}
          rel={$rel}<br>
          {if $rel|begins_with('5.3')}
          Once Nuxeo DM is installed, discover the "QuickStart" guide:
          {else}
          Your Nuxeo DM is way too old.
          {/if}
        </div>-->
    
    
    <h1>Hot News</h1>
    {*NEWS LIST*}
        {def $foldernode = fetch( 'content', 'node', hash('node_id', 66 ) )
             $curdate=currentdate()
             $children=fetch( 'content', 'list', hash( 'parent_node_id', $foldernode.node_id,
                                                       'limit', 5,
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
