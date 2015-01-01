# jxCmdBoard - A Command Board for OXID eShops

*Module for backend / admin of OXID eShops for displaying commands as tiles on a board.*

## Installation and Setup
1. Copy all files under **copy_this** to the root folder of your shop.
2. In the shop admin goto settings/modules and activate **jxCmdBoard**
3. Switch to the tab **Settings** and expand the section **Module Integration**
4. Enter all submodules you want to enable/use by typing their key, each module in a new line. Eg. "jxservertime"  
![Settings](https://github.com/job963/jxCmdBoard/raw/master/docs/img/setup-de-r.png)
5. The module has now its own menu item under **Service**

## How to get the submodule key
The filename of each submodule follows the following convention: jxcmd_**KEY**.inc.php. For loading the submodule, add the text **KEY** to the module integration line in the module settings.
![Command Board](https://github.com/job963/jxCmdBoard/raw/master/docs/img/cmdboard-de-r.png)

## Execute and Display
The specified links will be call be a cUrl function, the output catched and displayed in a popup window.
![popup window](https://github.com/job963/jxCmdBoard/raw/master/docs/img/output-de-r.png)

## How to write your own submodule
Use one of the included submodules, save it under a new name and change the text string and the links.
```php
array_push( $aIncModules, array(
		"title"  => array('de' => 'Deutscher Titel',
						  'en' => 'English Title'), 
		"button" => array('de' => 'Button Text',
						  'en' => 'Button Text'),
		"desc"   => array('de' => 'Deutsche Beschreibung des Links / der Funktion',
						  'en' => 'English description of this link/function'),
		"link"   => array('de' => "{$sShopUrl}modules/vendor/some folder/sample.php",
						  'en' => "{$sShopUrl}modules/vendor/some folder/sample.php"),
		"target" => '_blank'
				));
