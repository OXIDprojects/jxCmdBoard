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
 * @copyright (C) Joachim Barthel 2015
 *
 */

/*
 *    This include file creates a tile for Marmalade's csvexporter guenstiger module
 */
 
array_push( $aIncModules, array("title"  => array('de' => 'Google Sitempa',
                                                  'en' => 'Google Sitemap'), 
                                "button" => array('de' => 'Sitemap erzeugen',
                                                  'en' => 'Create Sitemap'),
                                "desc"   => array('de' => 'Erzeugt eine XML-Datei für Google Sitemap.',
                                                  'en' => 'Creates a XML file for Google Sitemap.'),
                                "link"   => array('de' => "{$sShopUrl}google_sitemap_xml.php",
                                                  'en' => "{$sShopUrl}google_sitemap_xml.php"),
                                "target" => '_blank'
                                ));


?>