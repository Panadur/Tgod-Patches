/**
 * ExileClient_object_construction_upgrade
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object"];
_object = _this select 0;

//diag_log "######################################";
//diag_log " construction_upgrade";
//diag_log "################################# #####";
//diag_log str (_this select 0);
if ("Exile_Item_FortificationUpgrade" in (magazines player)) then
{
  //["upgradeConstructionRequest", [_object]] call ExileClient_system_network_send; <-- disabled because because of Crazy Mike's change to Message format.
	["upgradeConstructionRequest", [_object,[]]] call ExileClient_system_network_send; <-- The new message format excepts "STRING","ARRAY" as parameters, so just add an empty array to the message.
}
else
{
	["ErrorTitleAndText", ["Failed to upgrade!", "You are missing the required upgrade kit."]] call ExileClient_gui_toaster_addTemplateToast;
};
true
