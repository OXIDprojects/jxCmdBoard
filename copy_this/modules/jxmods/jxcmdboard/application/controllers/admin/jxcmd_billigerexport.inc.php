<?php

/*
 *    This file is part of the module jxCmdBoard for OXID eShop Community Edition.
 *
 *    The module jxCmdBoard for OXID eShop Community Edition is free software: you can redistribute it and/or modify
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
 * @copyright (C) Joachim Barthel, 2015
 *
 */

/*
 *    This include file creates a tile for Marmalade's csvexporter and the billiger exporter module
 */
 
array_push( $aIncModules, array("title"  => array('de' => 'billiger.de Export',
                                                  'en' => 'billiger.de Export'), 
                                "button" => array('de' => 'CSV Datei erzeugen',
                                                  'en' => 'Create CSV File'),
                                "desc"   => array('de' => 'Export aller als aktiv geschalteter Artikel. Der Export wird im Verzeichnis /export in der Datei bdex-nnnn.txt gespeichert.',
                                                  'en' => 'Export of all  active products. The export will be save in the folder /export in file ddex-nnnn.txt.'),
                                "link"   => array('de' => "{$sShopUrl}modules/marm/csvexporter/exporter/billiger/billigerExporter.php",
                                                  'en' => "{$sShopUrl}modules/marm/csvexporter/exporter/billiger/billigerExporter.php"),
                                "target" => '_blank'
                                ));


?>