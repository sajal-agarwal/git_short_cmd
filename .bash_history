pull
add Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteComponentModel.cpp
git add Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteComponentModel.cpp
s
ca -m "disabling read only for synthesize array for now"
push
s
o Source/Internal/proxies/LinuxProxyForAthletico/LinuxProxyServer
s
bmf
pull
push
cm -m "Changed plugin 'Type' to 'Class'\n fixed Frame Length related issue"
rpc
s
cm -m "Changed plugin 'Type' to 'Class'\n fixed Frame Length related issue"
push
s
pull
cm -m "Typo in 'Plugin Class' anem"
push
s
o Source/auvid/app/auvid/UIComponents/RouteEditorComponents
s
bmf
pull
s
s
dbd
bmf
pull
cm -m "Added tooltip for min max in range property"
push
bmf
pull
pull
cm -m "Added group name to tuning pannel\n added event handler for lua to notify param ui window close for reload of usecase JSON"
push
push --no-thin
s
pull
cm -m "comma missing in PluginSetParamBlk in route script"
push
s
pull
s
bmf
pull
cm -m "1. Improved loading time for tunning window \n2. made synthesizable parameters readonly"
push
bmf
pull
push
cm -m "Fixing set/get param for korma"
push
pull
pull
cm -m "Fixed frame length related error for plugin"
push
bmf
pull
cm -m "Updated tuning window title name to start with ... and show the file name at end"
push
s
s
bmf
pull
cm -m "Disconnect param chane listner before loading secase json"
push
s
pull
cm -m "Fix for crash in VP tuning pannel"
push
s
pull
s
diff Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteMainComponent.cpp
diff-tool Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteMainComponent.cpp
pull
s
pull
s
s
bmf
git checkout .
s
pull
obd
s
cm -m "Updated userguide for VP tuning panel"
push
pull
pull
pull
pull
cm -m "Disabled scroll event for Range property"
push
s
pull
cm -m "Changed the color of tuning window to match current AuViD theme"
push
s
pull
cm -m "Fix for kerrick error - Frame length is displayed in bytes"
push
bmf
pull
cm -m "Fix for Run time param tuning error and support for non-model tuning window"
push
pull
c
s
bmf
pull
cm -m "Update usecase file agaist the properties which are not already present in usecase file"
push
bmf
pull
cm -m "Do not open multiple param editor windows if a param editor window with the same json file is already open"
push
s
pull
cm -m "Fix for Compilation error in VS2013"
push
s
pull
cm -m "•Rename RouteMainComponent::getAllPluginsEnumData() to RouteMainComponent::getAllPluginsData() as we no longer have enums in the UI"
push
s
pull
cm -m "RouteMainComponent::getAllPluginsData() must return the plugin instance and plugin name too as Lua code will need this information to highlight plugin boxes"
push
bmf
pull
pull
cm -m "Hide all sections other than 'Plugin Properties'"
push
s
s
add .
git add Resources/IA8508/RouteData/PluginConfigProjectWorkflow.xml
git commit -m "Plugin config file for project workflow mode"
s
push
s
bmf
pull
s
bmf
pull
s
dbd
bmf
pull
cm -m "added schema validation after every parameter change"
push
l
rpc
cm -m "KRM-325: added schema validation after every parameter change"
push
pull
cm -m "Fix for KRM-328: Route is reporting 1536 for “Frame length (samples)” for Streams when it should have been reporting 384"
push
s
pull
cm -m "Linux compilation error fix"
push
s
pull
cm -m "TRK-1994"
push
bmf
pull
o ~/.bash_profile 
aa
s
ca -m "Add 'BT Endpoint' component in Route Editor"
push
pull
pull
git pull --rebase
s
git pull --rebase
bmf
pull
cm -m "CLYP-1523: Need scrollbar for Route editor tool bar"
push
s
bmf
pull
cm -m "CLYP-1090: Added log for tunnel disable call"
push
pull
caf -m "1. CLYP-1090 Added log for stop tunnelling 2. Added config file for BT Endpoint"
push
bmf
pull
cm -m "CLYP-694: issue no 2"
push
bmf
pull
cm -m "Added a check for write perssion before updating the usecase json file"
push
rpc
cm -m "KRM-337: Added a check for write perssion before updating the usecase json file"
push
bmf
pull
cm -m "CLYP-694: Code improvement, bring connections to front on mouse hover to channel endpoint"
push
bmf
pull
pul
pull
s
pull
cm -m "KRM-350: While editing a plugin highlight all the plugins with the same param config as of the plugin which is chosen for editing"
push
pull
s
cm -m "KRM-350: Exposed API to highlight plugings with same param config to lua"
push
rpc
s
pull
pull
cm -m "KRM-350: Exposed API to highlight plugings with same param config to lua"
push
pull
pull
git checkout Source/libs/juce_lua_bindings/JuceWrap.cpp
s
pull
s
a Source/libs/juce_lua_bindings/CMakeLists.txt
s
log
l
ca -m "TRK-2036: typo in file name"
push
bmf
pull
cm -m "KRM-352: Write an API to validate current route against the active route"
push
bmf
pull
s
caf -m "KRM-325: Changed route validate shortcut to F7 and added icons for synthesize buttons"
push
bmf
pull
bmf
pull
pull
s
cm -m "LinuxProxy code clean - removed some commented lines"
push
rpc
cm -m "CLYP-1586: LinuxProxy code clean - removed some commented lines"
push
s
cm -m "CLYP-1586: Bumped-up linuxproxy version to 2, same is updated in AuViD"
push
pull
a Source/auvid/app/auvid/UIComponents/LProxyConnectionComponents/LProxyDefines.h
s
ca -m "CLYP-1586: Bumped-up linuxproxy version to 2, same is updated in AuViD"
push
c
s
a Source/auvid/app/resources/Targets/LinuxProxyServer/bin/calypso/linuxproxy
s
c
ca -m "CLYP-1586: latest linuxproxy with version 2"
push
obd
o ~/.bash_profile 
source ~/.bash_profile 
obd
source ~/.bash_profile 
obd
ebd
bmf
dbd
c
s
pull
a Source/infra/tools_base/devices/cheetah/ChtSPIDevice.cpp
ca -m "TRK-2050: Adding a 2ms delay in Cheetah Spi transaction between address and data"
push
s
a Source/infra/tools_base/devices/cheetah/ChtSPIDevice.cpp
a Source/auvid/app/auvid/Features/Rome/RomeControlUtils.cpp
ca -m "TRK-2050: Adding a 2ms delay in Cheetah Spi transaction between address and data"
push
s
pull
a Source/auvid/app/resources/Targets/Rome/Panels/Home/RomeHome.panel
ca -m "CLYP-1586: Home->SetUp pannel is getting open in edit mode, changing it to open in non-edit mode"
push
c
s
git checkout Source/infra/tools_base/devices/cheetah/ChtSPIDevice.cpp
git checkout master
s
s
l
push
bmf
pull
ssh root@10.251.224.191
ssh mhaikwad@10.251.224.49
ssh mhaikwad@10.251.224.49
ssh mgaikwad@10.251.224.49
ssh root@10.251.224.191
ssh mgaikwad@10.251.224.49
s
bmf
pull
a Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteEditorComponent.h
a Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteEditorComponent.cpp
s
ca -m "CLYP-1619: AuViD crashes in active route diagnostic panel in a particular case"
push
s
dbd
obd
bmf
pull
a Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteConfigChannelComponent.h
a Source/auvid/app/auvid/UIComponents/RouteEditorComponents/RouteConfigChannelComponent.cpp
s
ca -m "CLYP-1617: Route connections remain highlighted until route destroyed in a particular case"
push
clear
c
s
dbd
bmf
obd
pull
a Source/auvid/app/resources/Targets/Rome/Panels/PluginTuning/PluginTuning.panel
s
ca -m "CLYP-694: Plugin Tuning ->generic plugin is not scrollable"
push
bmf
pull
caf -m "CLYP-1471: AuViD UI support to configure WiFi, LinPhone, AVS, select Keyword for use case - first level"
push
bmf
pull
cm -m "CLYP-1471 - AuViD UI support to configure WiFi, LinPhone, AVS, select Keyword for use case - first level"
push
pull
git branch
git checkout regmapupdate
git branch
git checkout regmapupdate1
c
s
git stash
s
git checkout master
git stash pop
s
clear
bmf
pull
pull
cm -m "TRK-2080: Integrate latest changes in in Register Map and Rome Control into AuViD"
push
s
pull
cm -m "CLYP-1586 - Fixed a typo"
push
pull
cm -m "TRK-2080 - Integrate latest changes in in Register Map and Rome Control into AuViD"
push
s
pull
l
s
bmf
pull
push
cm -m "CLYP-694: Make generic tuning window scrollable"
push
s
s
cm -m "TRK-2080: Integrate latest changes in in Register Map and Rome Control into AuViD"
push
s
cm -m "TRK-2080: Integrate latest changes in in Register Map and Rome Control into AuViD"
push
pull
bmf
pull
pull
cm -m "TRK-2080: Integrate latest changes in in Register Map and Rome Control into AuViD"
push
s
pull
s
s
pull
ca -m "CLYP-1471: AuViD UI support to configure WiFi, LinPhone, AVS, select Keyword for use case - first level"
s
caf -m "CLYP-1471: AuViD UI support to configure WiFi, LinPhone, AVS, select Keyword for use case - first level"
s
push
s
bmf
pull
cm -m "TRK-2080: Integrate latest changes in in Register Map and Rome Control into AuViD"
push
pull
cm -m "TRK-2080: Integrate latest changes in in Register Map and Rome Control into AuViD"
push
s
s
o
s
bmf
pull
cm -m "CLYP-1471: AuViD UI support to configure WiFi, LinPhone, AVS, select Keyword for use case - first level"
push
s
bmf
pull
cm -m "CLYP-1471: AuViD UI support to configure WiFi, LinPhone, AVS, select Keyword for use case - first level"
push
rpc
s
cm -m "CLYP-1471: AuViD UI support to configure WiFi, LinPhone, AVS, select Keyword for use case - first level"
push
pull
cm -m "TRK-2080: Integrate latest changes in in Register Map and Rome Control into AuViD"
push
s
pull
cm -m "TRK-2080: Reverting proxymanager version for now"
push
bmf
pull
o Source/auvid/app/auvid/UIComponents/LProxyConnectionComponents
a Source/auvid/app/auvid/UIComponents/AProxyConnectionComponents/AProxyCmdExecutor.h
a Source/auvid/app/auvid/UIComponents/AProxyConnectionComponents/AProxyCmdExecutor.cpp
s
ca -m "CLYP-988: Randomly AndroidProxy Push and Start functionalities are not working properly in Ubuntu platform"
push
bmf
pull
pull
cm -m "CLYP-1726: Allow user to set the log level and fetch log file from AuViD"
rpc
cm -m "CLYP-1726: Allow user to set the log level and fetch log file from AuViD"
push
git checkout fireball
s
git checkout .
s
git checkout fireball
s
git log
s
cm -m "Fixed Active route crash on scroll after clicking error or warning icon"
push
rpc
cm -m "CLYP-1619: Fixed Active route crash on scroll after clicking error or warning icon"
push
s
pull
cm -m "CLYP-1619: Typo in header file"
push
s
git checkout master
s
bmf
pull
cm -m "TRK-2113: Allow user to add remove tunnels in Active Route Diagram"
push
pull
cm -m "ATM-51:"
push
bmf
pull
cm -m "CLYP-1471: Calypso setup added support for Usecase mode selection"
push
s
cm -m "CLYP-1471: Updated the version for linuxproxy"
push
s
bmf
pull
cm -m "se mode selection"
 8 files changed, 518 insertions(+), 103 deletions(-)
rpc
cm -m "CLYP-1471: Support for Usecase mode selection for Calypso"
push
git clone https://github.com/sajal-agarwal/git_short_cmd.git saagarwal/
