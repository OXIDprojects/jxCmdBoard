[{*debug*}]
[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign box=" "}]
<link href="[{$oViewConf->getModuleUrl('jxcmdboard','out/admin/src/jxcmdboard.css')}]" type="text/css" rel="stylesheet">

<script type="text/javascript">
  if(top)
  {
    top.sMenuItem    = "[{ oxmultilang ident="mxservice" }]";
    top.sMenuSubItem = "[{ oxmultilang ident="jxcmdboard_menu" }]";
    top.sWorkArea    = "[{$_act}]";
    top.setTitle();
  }

    function resizeCodeFrame () {
        var codeframe = document.getElementById('codeframe');
        codeframe.style.height = (window.innerHeight - 150) + "px";;
    }
</script>

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
        
        <div class="jxcmdboard">
            
            [{if $output}]
                <div id="popupwin" class="jxpopupwin">
                    <div style="[{if $response == "200"}]background:#008000;[{else}]background:#800000;[{/if}]color:#fff;padding:4px;">
                        <span style="padding-left:10px;font-size:1.2em;font-weight:bold;">[{$exectitle}]</span> 
                        <span style="padding-left:40px;">[{ oxmultilang ident="JXCMDBOARD_DURATION" }]: <b>[{$exectime}] sec.</b></span>
                        <span style="padding-left:40px;">[{ oxmultilang ident="JXCMDBOARD_RESPONSE" }]: <b>[{if $response == "200"}]OK[{else}]ERROR: [{$response}][{/if}]</b></span>
                    </div>
                    <div class="jxpopupclose" onclick="document.getElementById('popupwin').style.display='none';document.getElementById('grayout').style.display='none';">
                        <div style="height:3px;"></div>
                        <b>X</b></div>
                    <div class="jxpopupcontent">[{ $output }]</div>
                </div>
            [{/if}]
            
            <div id="grayout" class="jxgrayout" [{if $output}]style="display:block;"[{else}]style="display:none;"[{/if}]></div>
            <div id="execinfo" class="jxexecinfo">[{ oxmultilang ident="JXCMDBOARD_EXECUTING" }] <img src="[{$oViewConf->getModuleUrl('jxcmdboard','out/admin/src/img/progress.gif')}]"></div>
            
            <form name="jxcmd" id="jxcmd" action="[{ $oViewConf->getSelfLink() }]" method="post">
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="fnc" value="">
                <input type="hidden" name="oxid" value="[{ $oxid }]">
                <input type="hidden" name="editval[oxuser__oxid]" value="[{ $oxid }]">
                <input type="hidden" name="jxcmd_url" value="">
                <input type="hidden" name="jxcmd_title" value="">
                [{foreach name=incmods item=aIncModule from=$aIncModules}]
                    <fieldset>
                        <legend>[{ $aIncModule.title[$IsoLang] }]</legend>
                        <div class="desc">[{ $aIncModule.desc[$IsoLang] }]</div>
                        [{*<div style="height:12px;"> </div>*}]
                        [{*
                        <a href="[{ $aIncModule.link[$IsoLang] }]" target="[{ $aIncModule.target }]" onClick="Javascript:document.jxcmd.jxcmd_url.value='[{ $aIncModule.link[$IsoLang] }]';document.jxcmd.fnc.value='execute';">[{ $aIncModule.button[$IsoLang] }]</a>
                        *}]
                        <input type="submit" class="edittext" name="save" value=" [{ $aIncModule.button[$IsoLang] }] " onClick="Javascript:document.getElementById('execinfo').style.display='block';document.jxcmd.jxcmd_title.value='[{ $aIncModule.title[$IsoLang] }]';document.jxcmd.jxcmd_url.value='[{ $aIncModule.link[$IsoLang] }]';document.jxcmd.fnc.value='execute';" [{ $readonly }]>
                    </fieldset>
                [{/foreach}]
            </form>
        </div>
    </p>
    <div style="position:absolute; bottom:0px; left:0px; height:50px; background-color:#dd0000;"></div>

</div>

</body>

