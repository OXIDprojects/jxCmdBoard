<?php

/*
 *    This file is part of the module jxExcptns for OXID eShop Community Edition.
 *
 *    The module OxProbs for OXID eShop Community Edition is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    The module OxProbs for OXID eShop Community Edition is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with OXID eShop Community Edition.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      https://github.com/job963/jxExcptns
 * @license   http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later
 * @copyright (C) Joachim Barthel 2012-2013
 *
 */
 
class jxcmdboard extends oxAdminView
{
    protected $_sThisTemplate = "jxcmdboard.tpl";
    //public $this->output = "";
            
    public function render()
    {
        parent::render();
        $oSmarty = oxUtilsView::getInstance()->getSmarty();
        $oSmarty->assign( "oViewConf", $this->_aViewData["oViewConf"]);
        $oSmarty->assign( "shop", $this->_aViewData["shop"]);
        $myConfig = oxRegistry::get("oxConfig");
        $sLogsDir = $myConfig->getLogsDir();
        $sShopUrl = $myConfig->getShopUrl();
        $oModule = oxNew('oxModule');
        $sModuleUrl = $sShopUrl . 'modules/' . $oModule->getModulePath("jxcmdboard") . '/';
        
        $aIncFiles = array();
        //echo '-'.$myConfig->getConfigParam("sJxCmdBoardIncludeFiles").'-';
        $aIncFiles = explode( ',', $myConfig->getConfigParam("sJxCmdBoardIncludeFiles") );
        /*echo '<hr><pre>';
        print_r($aIncFiles);
        echo '</pre><hr>';*/
        $aIncModules = array();
        $sIncPath = $this->jxGetModulePath() . '/application/controllers/admin/';
        foreach ($aIncFiles as $sIncFile) { 
            $sIncFile = $sIncPath . 'jxcmd_' . $sIncFile . '.inc.php';
            require $sIncFile;
        } 
        /*echo '<hr><pre>';
        print_r($aIncModules);
        echo '</pre><hr>';*/

        //echo '-end-';
        /*$sLogFile = $sLogsDir . 'EXCEPTION_LOG.txt';
        if (file_exists($sLogFile)) {
            $fp = fopen($sLogFile, 'r');
            $aTemp = array();
            if ($fp == FALSE)
                $aContent[0] = 'File EXCEPTION_LOG.txt not found.';

            while (!feof($fp)) 
                array_push( $aTemp, fgets($fp) );
            fclose($fp);

            $aContent = array();
            if (count($aTemp) < 400)
                $iStart = 0;
            else
                $iStart = count($aTemp) - 400;

            $iStop = count($aTemp);
            for ( $i=$iStart; $i<$iStop; $i++ )
                array_push ($aContent, $this->keywordHighlighter($aTemp[$i]));
        }
        else {
            $aContent = array();
        }
        
        $oSmarty->assign("aContent",$aContent);*/
        
        $oSmarty->assign("aIncModules",$aIncModules);
        $oSmarty->assign("output",$this->output);
        $oSmarty->assign("response",$this->response['http_code']);
        $oSmarty->assign("exectime",$this->exectime);
        $oSmarty->assign("exectitle",oxConfig::getParameter("jxcmd_title"));

        return $this->_sThisTemplate;
    }
    
    
    public function execute()
    {
        $url = oxConfig::getParameter( "jxcmd_url" );
        $ch = curl_init($url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
        //curl_setopt($ch, CURLOPT_AUTOREFERER, TRUE); 
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE); 
        $timeStart = time();
        $output = curl_exec($ch).' ';
        $this->exectime = time() - $timeStart;
        $this->response = curl_getinfo( $ch );
        curl_close($ch);
        
        $this->output = $output;
        return;
    }
    
    
    public function keywordHighlighter( $sText ) 
    {
        $sStylePreHeader = '<span style="font-size:1.25em; font-weight:bold;">';
        $sStylePostHeader = '</span>';
        $sStylePreError = '<span style="font-weight:bold;color:#dd0000;">';
        $sStylePostError = '</span>';
        
        $aSearch = array(
            '/(.*)(Faulty component|Connection Error)(.*)/',
            '/(.*)\\[0]:(.*)/',
            );

        $aReplace = array(
            "{$sStylePreHeader}$0{$sStylePostHeader}",
            "$1[0]: {$sStylePreError}$2{$sStylePostError}",
            );
        
        $sText = preg_replace($aSearch, $aReplace, $sText);

        return $sText;
    }
    
    
    public function fileDownload()
    {
        $myConfig = oxRegistry::get("oxConfig");
        $sLogsDir = $myConfig->getLogsDir();
        $sLogFile = 'EXCEPTION_LOG.txt';

        header("Content-Type: application/csv-tab-delimited-table");
        header("Content-Disposition: attachment; filename=\"$sLogFile\"");
        readfile($sLogsDir.$sLogFile);
    }

    
    public function jxGetModulePath()
    {
        $sModuleId = $this->getEditObjectId();

        $this->_aViewData['oxid'] = $sModuleId;

        $oModule = oxNew('oxModule');
        $oModule->load($sModuleId);
        $sModuleId = $oModule->getId();
        
        $myConfig = oxRegistry::get("oxConfig");
        $sModulePath = $myConfig->getConfigParam("sShopDir") . 'modules/' . $oModule->getModulePath("jxcmdboard");
        
        return $sModulePath;
    }
    
}
?>