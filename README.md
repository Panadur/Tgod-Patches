

This is a patch for a problem that is caused by simple adding Crazy Mike's Extended_Items_Exile to an Exile server. 
By adding this mod the message format for the communication between the client and server when upgrading base building elements is altered. 
So if you do not modify the Missionfile on your server, then upgrades will not work because neither the server nor the client understand the message and just disregards the messages.

# How to install.

1. Copy ExileClient_object_construction_upgrade.sqf and ExileServer_object_construction_network_upgradeConstructionRequest.sqf
to a folder within your mission file.
2. Locate config.cpp in your mission file and find the class CfgExileCustomCode section.
3. in this section (between the { and } brackets) add followind lines of code
ExileClient_object_construction_upgradeShow = "YOUR_FOLDER_NAME\ExileClient_object_construction_upgradeShow.sqf";
ExileClient_object_construction_upgrade = "YOUR_FOLDER_NAME\ExileClient_object_construction_upgrade.sqf";
4. save config.cpp
5. restart Server
6. Done !!!


