<?php

/*
 *    This file is part of the module jxCmdBoard for OXID eShop Community Edition.
 *
 *    The module oxProbs for OXID eShop Community Edition is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    The module jxCmdBoard for OXID eShop Community Edition is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with OXID eShop Community Edition.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      https://github.com/job963/jxCmdBoard
 * @license   http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later
 * @copyright (C) Joachim Barthel 2012-2014
 *
 */

/*
 *    This include file creates a tile for EXONNS Google Merchant module
 */
 
array_push( $aIncModules, array("title"  => array('de' => 'EXONN Google Feed',
                                                  'en' => 'EXONN Google Feed'), 
                                "button" => array('de' => 'Google Merchant Feed erzeugen',
                                                  'en' => 'Create Google Merchant Feed'),
                                "desc"   => array('de' => 'Export aller f&uuml;r den Google Merchant als aktiv geschalteter Artikel. Der Export wird im Verzeichnis /export in der Datei google.xml gespeichert.',
                                                  'en' => 'Export of all for Google Merchant active products. The export will be save in the folder /export in file google.xml.'),
                                "link"   => array('de' => "{$sShopUrl}index.php?cl=exonn_sengines_export&fnc=google_xml",
                                                  'en' => "{$sShopUrl}index.php?cl=exonn_sengines_export&fnc=google_xml"),
                                "target" => '_blank'
                                ));


?>