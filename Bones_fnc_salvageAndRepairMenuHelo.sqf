private _vehicle = _this select 0;
LastHeliWrenched = _vehicle;
private _vehicleAllHitPointsDamage = getAllHitPointsDamage _vehicle;
private _vehicleDamage = (_vehicleAllHitPointsDamage select 2);
private _vehicleHitNames = (_vehicleAllHitPointsDamage select 0);
private _vehiclePartNames = (_vehicleAllHitPointsDamage select 1);

ASL_Show_RepairGlass_Options_Menu_Array = [["Glass Repair Menu",true]];
ASL_Show_SalvageGlass_Options_Menu_Array = [["Glass Salvage Menu",true]];

{
    private _partDisplayName = (_vehicleHitNames select _forEachIndex) select [3];
    private _partDisplayHitpoint = round(100-((_vehicleDamage select _forEachIndex) * 100));
    if (toLower(_x) find "glass" >= 0) then {
        private _menuItemName = format ["Repair Glass: %1 (%2%3)", _partDisplayName, _partDisplayHitpoint, "/100"];
        private _menuItemExpression = format ["['repairGlass','%1'] Call salvage_setup",(_vehicleHitNames select _forEachIndex)];
        private _enableMenuItem = ["0","1"] select (_vehicleDamage select _forEachIndex > 0);
        ASL_Show_RepairGlass_Options_Menu_Array pushBack [_menuItemName,[0],"",-5,[["expression",_menuItemExpression]],"1",_enableMenuItem];

        private _menuItemName = format ["Salvage Glass: %1 (%2%3)", _partDisplayName, _partDisplayHitpoint, "/100"];
        private _menuItemExpression = format ["['salvageGlass','%1'] Call salvage_setup",(_vehicleHitNames select _forEachIndex)];
        private _enableMenuItem = ["0","1"] select (_vehicleDamage select _forEachIndex < 0.2);
        ASL_Show_SalvageGlass_Options_Menu_Array pushBack [_menuItemName,[0],"",-5,[["expression",_menuItemExpression]],"1",_enableMenuItem];
    };
} forEach _vehiclePartNames;

private _vehicleName = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "displayName");

ASL_Show_Repair_Options_Menu_Array = 
[
	["Repair "+_vehicleName ,true]
];


private _hullDamage = _vehicleDamage select (_vehicleHitNames find "HitHull");
private _hullDisplayHitpoint = round(100-((_hullDamage) * 100));
private _enableHullRepair = ["0","1"] select (_hullDamage > 0);
ASL_Show_Repair_Options_Menu_Array pushBack [format ["Repair Hull (%1%2)", _hullDisplayHitpoint, "/100"],[0],"",-5,[["expression","['repairHeloHull'] Call salvage_setup"]],"1",_enableHullRepair];

ASL_Show_Repair_Options_Menu_Array pushBack ["Repair Glass",[0],"#USER:ASL_Show_RepairGlass_Options_Menu_Array",-5,[],"1","1"];

private _engineDamage = _vehicleDamage select (_vehicleHitNames find "HitEngine");
private _enableEngineRepair = ["0","1"] select (_engineDamage > 0);
private _enableEngineSalvage = ["0","1"] select (_engineDamage < 0.2);
private _engineDisplayHitpoint = round(100-((_engineDamage) * 100));

ASL_Show_Repair_Options_Menu_Array pushBack	[format ["Repair Engine (%1%2)", _engineDisplayHitpoint, "/100"],[0],"",-5,[["expression","['repairCarEngine'] Call salvage_setup"]],"1",_enableEngineRepair];

private _fueltankDamage = _vehicleDamage select (_vehicleHitNames find "HitFuel");
private _enableFueltankRepair = ["0","1"] select (_fueltankDamage > 0);
private _enableFueltankSalvage = ["0","1"] select (_fueltankDamage < 0.2);
private _fueltankDisplayHitpoint = round(100-((_fueltankDamage) * 100));

ASL_Show_Repair_Options_Menu_Array pushBack	[format ["Repair Fueltank (%1%2)", _fueltankDisplayHitpoint , "/100"],[0],"",-5,[["expression","['repairFueltank'] Call salvage_setup"]],"1",_enableFueltankRepair];

private _avionicsDamage = _vehicleDamage select (_vehicleHitNames find "HitAvionics");
private _enableAvionicsRepair = ["0","1"] select (_avionicsDamage > 0);
private _enableAvionicsSalvage = ["0","1"] select (_avionicsDamage < 0.2);
private _avionicsDisplayHitpoint = round(100-((_avionicsDamage) * 100));

ASL_Show_Repair_Options_Menu_Array pushBack	[format ["Repair Avionics (%1%2)", _avionicsDisplayHitpoint , "/100"],[0],"",-5,[["expression","['repairAvionics'] Call salvage_setup"]],"1",_enableAvionicsRepair];

private _VRotorDamage = _vehicleDamage select (_vehicleHitNames find "HitVRotor");
private _enableVRotorRepair = ["0","1"] select (_VRotorDamage > 0);
private _enableVRotorSalvage = ["0","1"] select (_VRotorDamage < 0.2);
private _VRotorDisplayHitpoint = round(100-((_VRotorDamage) * 100));

ASL_Show_Repair_Options_Menu_Array pushBack	[format ["Repair Tail Rotor (%1%2)", _VRotorDisplayHitpoint , "/100"],[0],"",-5,[["expression","['repairTailRotor'] Call salvage_setup"]],"1",_enableVRotorRepair];

private _HRotorDamage = _vehicleDamage select (_vehicleHitNames find "HitHRotor");
private _enableHRotorRepair = ["0","1"] select (_HRotorDamage > 0);
private _enableHRotorSalvage = ["0","1"] select (_HRotorDamage < 0.2);
private _HRotorDisplayHitpoint = round(100-((_HRotorDamage) * 100));

ASL_Show_Repair_Options_Menu_Array pushBack	[format ["Repair Main Rotor (%1%2)", _HRotorDisplayHitpoint , "/100"],[0],"",-5,[["expression","['repairMainRotor'] Call salvage_setup"]],"1",_enableHRotorRepair];

ASL_Show_Repair_Options_Menu_Array pushBack ["Salvage Glass",[0],"#USER:ASL_Show_SalvageGlass_Options_Menu_Array",-5,[],"1","1"];
ASL_Show_Repair_Options_Menu_Array pushBack	["Salvage Engine",[0],"",-5,[["expression","['salvageCarEngine'] Call salvage_setup"]],"1",_enableEngineSalvage];
ASL_Show_Repair_Options_Menu_Array pushBack	["Salvage Fueltank",[0],"",-5,[["expression","['salvageFueltank'] Call salvage_setup"]],"1",_enableFueltankSalvage];
ASL_Show_Repair_Options_Menu_Array pushBack	["Salvage Avionics",[0],"",-5,[["expression","['salvageAvionics'] Call salvage_setup"]],"1",_enableAvionicsSalvage];
ASL_Show_Repair_Options_Menu_Array pushBack	["Salvage Tail Rotor",[0],"",-5,[["expression","['salvageTailRotor'] Call salvage_setup"]],"1",_enableVRotorSalvage];
ASL_Show_Repair_Options_Menu_Array pushBack	["Salvage Main Rotor",[0],"",-5,[["expression","['salvageMainRotor'] Call salvage_setup"]],"1",_enableHRotorSalvage];

showCommandingMenu "";
showCommandingMenu "#USER:ASL_Show_Repair_Options_Menu_Array";

salvage_setup = {

_vehicle = LastHeliWrenched;
_action = _this select 0;
if (_action in ["salvageGlass","repairGlass"]) then {
    _part = _this select 1;
    [_action,_vehicle,_part] execVM 'advancedRepair\Bones_fnc_salvageAndRepair.sqf';
} else {
   [_action,_vehicle] execVM 'advancedRepair\Bones_fnc_salvageAndRepair.sqf';
};

};
