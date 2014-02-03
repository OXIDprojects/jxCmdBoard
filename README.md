# jxCmdBoard - A Command Board for OXID eShops

*Module for backend / admin of OXID eShops for displaying commands as tiles on a board.*

## Installation and Setup
1. Copy all files under **copy_this** to the rott folder of your shop.
2. In the shop admin goto settings/modules and activate **jxCmdBoard**
3. Switch to the tab **Settings** and expand the section **Module Integration**
4. Enter all submodules you want to enable/use by typing their key, separated by a comma. Eg. "jxservertime"
5. The module has now its own menu item under **Service**

## How to get the submodule key
The filename of each submodule follows the following convention: jxcmd_**KEY**.inc.php. For loading the submodule, add the text **KEY** to the module integration line in the module settings.
(https://raw.github.com/job963/jxCmdBoard/master/docs/img/cmdboard-de-r.png)
