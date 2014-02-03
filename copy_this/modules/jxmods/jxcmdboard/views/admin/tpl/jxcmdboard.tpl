[{*debug*}]
[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign box=" "}]

[{*<script type="text/javascript" src="[{$shop->basetpldir}]sortable/sortable.js"></script>
<link rel="stylesheet" type="text/css" href="[{$shop->basetpldir}]sortable/sortable.css" />
<script type="text/javascript">image_path = "[{$shop->basetpldir}]sortable/";</script>*}]

<script type="text/javascript">
  if(top)
  {
    top.sMenuItem    = "[{ oxmultilang ident="mxservice" }]";
    top.sMenuSubItem = "[{ oxmultilang ident="jxexcptns_menu" }]";
    top.sWorkArea    = "[{$_act}]";
    top.setTitle();
  }

    function resizeCodeFrame () {
        var codeframe = document.getElementById('codeframe');
        codeframe.style.height = (window.innerHeight - 150) + "px";;
    }
</script>
<style>
    /*.jxcmdboard li {
        list-style-type:none;
        background: none;
    }
    .jxcmdboard li a {
        color: #ffffff;
        background-color: #323232;
        border-radius: 3px;height:14px;
        width: 18px;
        padding-top: -2px;
        padding-left: 4px;
        padding-right: 4px;
    }
    .jxcmdboard li a:hover {
        box-shadow: 2px 2px #aaa;
        text-decoration: none;
    }
    .jxcmdboard li a:active {
        background-color: #424242;
        box-shadow: 1px 1px #aaa;
        border-top: 1px #fff solid;
        border-left: 1px #fff solid;
    }*/
    .grayout {
        display: none;
        padding: 0;
        margin: 0;
        top: 0;
        left: 0;
        position: absolute;
        width: 100%;
        height: 100%;
        z-index: 1;
        background-color: #000000;
        opacity: 0.4;
        filter:alpha(opacity=40);  
    }
    .jxcmdboard {
        margin-left: 20px; !important
        margin-right: 20px;
    }
    .jxcmdboard fieldset {
        background-color: #f0f0f0;
        border-radius: 4px;
        height: 125px;
        width: 250px;
        float: left;
        margin-right: 20px;
    }
    .jxcmdboard legend {
        background-color: #f0f0f0;
        border-radius: 10px;
        border-top: 2px solid #444;
        /*border-left: 1px solid #444;
        border-right: 1px solid #444;*/
        padding-top: 2px;
        padding-left: 8px;
        padding-right: 8px;
        font-weight: bold;
    }
    .desc {
        height: 84px;
    }
    .jxcmdboard fieldset a {
        color: #ffffff;
        background-color: #323232;
        border-radius: 3px;
        box-shadow: 2px 2px #aaa;
        height: 14px;
        width: 18px;
        padding-top: -2px;
        padding-left: 4px;
        padding-right: 4px;
    }
    .jxcmdboard fieldset a:hover {
        box-shadow: 2px 2px #aaa;
        text-decoration: none;
    }
    .jxcmdboard fieldset a:active {
        background-color: #424242;
        box-shadow: 1px 1px #aaa;
        border-top: 1px #fff solid;
        border-left: 1px #fff solid;
    }
</style>

[{php}] 
    $sIsoLang = oxLang::getInstance()->getLanguageAbbr(); 
    $this->assign('IsoLang', $sIsoLang);
[{/php}]

<body onresize="resizeCodeFrame();">
<div class="center" style="height:100%;">
    <h1>[{ oxmultilang ident="JXCMDBOARD_TITLE" }]</h1>
    <p>
        <form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
            [{ $shop->hiddensid }]
            <input type="hidden" name="oxid" value="[{ $oxid }]">
            <input type="hidden" name="cl" value="article" size="40">
            <input type="hidden" name="updatelist" value="1">
        </form>
        
        [{*<div style="position:relative; top:-10px;">
            <form name="jxexcptns" id="jxexcptns" action="[{ $shop->selflink }]" method="post">
                [{ $shop->hiddensid }]
                <input type="hidden" name="editlanguage" value="[{ $editlanguage }]">
                <input type="hidden" name="cl" value="jxexcptns">
                <input type="hidden" name="fnc" value="filedownload">
                <input type="hidden" name="oxid" value="[{ $oxid }]">
                <input class="edittext" type="submit" 
                         onClick="document.forms['jxexcptns'].elements['parentvarname'].value = document.forms['search'].elements['editval[oxarticles__oxvarname]'].value;" 
                         value=" [{ oxmultilang ident="JXCMDBOARD_DOWNLOAD" }] " [{ $readonly }]><br /> <br/>
            </form>
        </div>*}]
        
        [{*
        <div id="codeframe" style="border:1px solid #888; padding:4px; background-color:#efefef;height:500px;overflow-y: scroll;">
            <span style="">
                [{if !$aContent}]
                    <em>[{ oxmultilang ident="JXCMDBOARD_NOCONTENT" }]</em>
                [{else}]
                    [{foreach name=outer item=sLine from=$aContent}]
                        [{ $sLine }]<br />
                    [{/foreach}]
                [{/if}]
            </span>
            <div id="eop"></div>
        </div>
        *}]
        <div class="jxcmdboard">
            <ul>
                [{*foreach name=incmods item=aIncModule from=$aIncModules}]
                    <li><a href="[{ $aIncModule.link[$IsoLang] }]">[{ $aIncModule.button[$IsoLang] }]</a></li>
                [{/foreach*}]
                [{*
                <li><a href="[{$oViewConf->getBaseDir()}]servertime.php">Show Server Time</a> / [{$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}]</li>
                <li><a href="[{$oViewConf->getBaseDir()}]index.php?cl=exonn_sengines_export&fnc=google_xml" target="_blank">Create Google Merchant Feed</a></li>
                *}]
            </ul>
            [{if $output}]
                [{*<hr>[{ $output }]<hr>*}]
                <div id="popup" style="position:fixed;left:10%;top:10%;width:80%;min-height:65%;height:250px;padding:10px;border:1px solid gray;z-index: 99;background-color:#ffffff;border-radius:3px;box-shadow:5px 5px 3px #777;">
                    <div style="position:absolute;top:-12px;right:-12px;height:24px;width:24px;vertical-align:bottom;text-align:center;color:#ffffff;background:#323232;cursor:default;border-radius:12px;" onclick="document.getElementById('popup').style.display='none';document.getElementById('grayout').style.display='none';">
                        <div style="height:3px;"></div>
                        <b>X</b></div>
                    <div style="min-height:99%;height:200px;overflow:scroll;">[{ $output }]</div>
                </div>
            [{/if}]
<div id="grayout" class="grayout" [{if $output}]style="display:block;"[{/if}]>
</div>
<form name="jxcmd" id="jxcmdt" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
    <input type="hidden" name="fnc" value="">
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="editval[oxuser__oxid]" value="[{ $oxid }]">
    <input type="hidden" name="jxcmd_url" value="[{ $aIncModule.link[$IsoLang] }]">
            [{foreach name=incmods item=aIncModule from=$aIncModules}]
                <fieldset>
                    <legend>[{ $aIncModule.title[$IsoLang] }]</legend>
                    <div class="desc">[{ $aIncModule.desc[$IsoLang] }]</div>
                    [{*<div style="height:12px;"> </div>*}]
                    [{*
                    <a href="[{ $aIncModule.link[$IsoLang] }]" target="[{ $aIncModule.target }]" onClick="Javascript:document.jxcmd.jxcmd_url.value='[{ $aIncModule.link[$IsoLang] }]';document.jxcmd.fnc.value='execute';">[{ $aIncModule.button[$IsoLang] }]</a>
                    *}]
                    <input type="submit" class="edittext" name="save" value=" [{ $aIncModule.button[$IsoLang] }] " onClick="Javascript:document.jxcmd.jxcmd_url.value='[{ $aIncModule.link[$IsoLang] }]';document.jxcmd.fnc.value='execute';" [{ $readonly }]>
                    [{*<div style="height:4px;"> </div>*}]
                </fieldset>
            [{/foreach}]

</form>
        </div>
    </p>
    <div style="position:absolute; bottom:0px; left:0px; height:50px; background-color:#dd0000;"></div>

</div>

</body>
<script type="text/javascript">
    resizeCodeFrame();
    window.location.hash = "eop";
</script>
