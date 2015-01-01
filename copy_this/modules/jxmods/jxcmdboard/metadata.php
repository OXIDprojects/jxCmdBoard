<?php

/**
 * Metadata version
 */
$sMetadataVersion = '1.1';
 
/**
 * Module information
 */
$aModule = array(
    'id'           => 'jxcmdboard',
    'title'        => 'jxCmdBoard - Command Board',
    'description'  => array(
                        'de'=>'Konfigurierbares Command Board',
                        'en'=>'Configurable Command Board'
                        ),
    'thumbnail'    => 'jxcmdboard.png',
    'version'      => '0.3',
    'author'       => 'Joachim Barthel',
    'url'          => 'https://github.com/job963/jxCmdBoard',
    'email'        => 'jobarthel@gmail.com',
    'extend'       => array(
                        ),
    'files'        => array(
        'jxcmdboard'     => 'jxmods/jxcmdboard/application/controllers/admin/jxcmdboard.php'
                        ),
    'templates'    => array(
        'jxcmdboard.tpl' => 'jxmods/jxcmdboard/application/views/admin/tpl/jxcmdboard.tpl'
                        ),
    'settings'     => array(
                        array(
                            'group' => 'JXCMDBOARD_INCLUDEMODULES', 
                            'name'  => 'aJxCmdBoardIncludeFiles', 
                            'type'  => 'arr', 
                            'value' => array(), 
                            'position' => 1
                            )
                        )
    );

?>
