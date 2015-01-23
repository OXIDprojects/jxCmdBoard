[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign box=" "}]


<!-- compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

        
[{assign var="cssFilePath" value=$oViewConf->getModulePath('jxcmdboard','out/admin/src/jxcmdboard.css') }]
[{php}] 
    $sCssFilePath = $this->get_template_vars('cssFilePath');;
    $sCssTime = filemtime( $sCssFilePath );
    $this->assign('cssTime', $sCssTime);
[{/php}]
[{assign var="cssFileUrl" value=$oViewConf->getModuleUrl('jxcmdboard','out/admin/src/jxcmdboard.css') }]
[{assign var="cssFileUrl" value="$cssFileUrl?$cssTime" }]
<link href="[{$cssFileUrl}]" type="text/css" rel="stylesheet">

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

<body onresize="resizeCodeFrame();">
<div class="center" style="height:100%;">
    <h1 style="margin-left:10px;">[{ oxmultilang ident="JXCMDBOARD_TITLE" }]</h1>
    <p>
        <form name="transfer" id="transfer" action="[{ $shop->selflink }]" method="post">
            [{ $shop->hiddensid }]
            <input type="hidden" name="oxid" value="[{ $oxid }]">
            <input type="hidden" name="cl" value="article" size="40">
            <input type="hidden" name="updatelist" value="1">
        </form>
        
        <div class="jxcmdboard">
            
            <div id="execinfo" class="jxexecinfo">[{ oxmultilang ident="JXCMDBOARD_EXECUTING" }] <img src="[{$oViewConf->getModuleUrl('jxcmdboard','out/admin/src/img/progress.gif')}]"></div>
            
            <form name="jxcmd" id="jxcmd" action="[{ $oViewConf->getSelfLink() }]" method="post">
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="cl" value="[{$oViewConf->getActiveClassName()}]">
                <input type="hidden" name="fnc" value="">
                <input type="hidden" name="oxid" value="[{ $oxid }]">
                <input type="hidden" name="editval[oxuser__oxid]" value="[{ $oxid }]">
                <input type="hidden" name="jxcmd_url" value="">
                <input type="hidden" name="jxcmd_title" value="">
            </form>
        </div>
    </p>

    <br clear="all" />
    
    [{assign var="tplIncFile" value=$oViewConf->getModulePath('jxcmdboard','application/views/admin/tpl/jxcmdboard_response.tpl') }]
    [{include file=$tplIncFile}]
    
    <div class="container-fluid container-lg-height">
        <div class="row">
            [{assign var="i" value=1}]
            [{foreach name=incmods item=aIncModule from=$aIncModules}]
                <div class="col-md-3 col-lg-height" style="margin-bottom:16px;">
                <button type="button" class="btn btn-metro[{$i}] btn-lg btn-block" data-toggle="modal"
                         onClick="Javascript:document.getElementById('execinfo').style.display='block';document.jxcmd.jxcmd_title.value='[{ $aIncModule.title[$sIsoLang] }]';document.jxcmd.jxcmd_url.value='[{ $aIncModule.link[$sIsoLang] }]';document.jxcmd.fnc.value='execute';document.jxcmd.submit();">
                    [{ $aIncModule.title[$sIsoLang] }]
                    <div style="font-size:0.7em;white-space:normal;">
                        [{ $aIncModule.desc[$sIsoLang] }]
                    </div>
                </button>
                </div>
                [{if $i % 4 == 0}]
                    </div>
                    <div class="row">
                [{/if}]
                [{assign var="i" value=$i+1}]
            [{/foreach}]
        </div>
    </div>

    <div style="position:absolute; bottom:0px; left:0px; height:50px; background-color:#dd0000;"></div>

</div>

</body>

