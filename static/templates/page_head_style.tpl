{ezcss_load( array( ezini( 'StylesheetSettings', 'CSSFileList', 'design.ini' ), ezini( 'StylesheetSettings', 'FrontendCSSFileList', 'design.ini' ) ))}

{* <link href='http://fonts.googleapis.com/css?family=Merriweather' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Istok+Web:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Droid+Serif' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Open+Sans|Ubuntu|Brawler|Karla|PT+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'> *}

<!-- Combined css media + print -->
{* Timestamp CSS?date makes new file when uptades for browsers that cache the file *}
{*
<style type="text/css">
@import url(/extension/nuxeo_design/design/nuxeo/stylesheets/nuxeo_style.css?2012-01-03-C);
*}
{*@import url(/extension/nuxeo_design/design/nuxeo/stylesheets/netgen_style.css?2011-12-12-K);*}
{*
@import url(/extension/nuxeo_design/design/nuxeo/stylesheets/fancybox/jquery.fancybox-1.3.4.css);
</style>
*}

{* For IE 9 round corners *}
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

{* For IE not to bleed around corners *}
<!--[if  ie 9]>
<style type="text/css" media="screen">
{literal}  #main table.typ-steps .typ-step h3, body #main p.button_rounded_lightgray, body #main p.button_rounded_lightblue, #sharing-links , #feedback, #feedback:hover {
filter: none;
-ms-filter:none;
}{/literal}
</style>
<![endif]-->

<!--[if IE]>
<style type="text/css" media="screen">
{literal}  #feedback {
bottom:0;
right:20px;
}{/literal}
</style>
<![endif]-->

{* end of styles *}

{* Previous way

<style type="text/css">
@import url({"stylesheets/nuxeo_style.css"|ezdesign(no)});
</style>

*}

{*
All in nuxeo_style.css, not using debug.css though

@import url({"stylesheets/debug.css"|ezdesign(no)});
@import url({"stylesheets/websitetoolbar.css"|ezdesign(no)});
<link rel="stylesheet" type="text/css" href={"stylesheets/print.css"|ezdesign} media="print" />
*}

<!-- IE conditional comments; for bug fixes for different IE versions -->
<!--[if IE 5]>     <style type="text/css"> @import url({"stylesheets/browsers/ie5.css"|ezdesign(no)});    </style> <![endif]-->
<!--[if IE 6]>     <style type="text/css"> @import url({"stylesheets/browsers/ie6.css"|ezdesign(no)});    </style> <![endif]-->
<!--[if lte IE 7]> <style type="text/css"> @import url({"stylesheets/browsers/ie7lte.css"|ezdesign(no)}); </style> <![endif]-->
<!--[if lte IE 8]> <style type="text/css"> @import url({"stylesheets/browsers/ie8lte.css"|ezdesign(no)}); </style> <![endif]-->
