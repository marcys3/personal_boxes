/*
 * Name:	Init_crate
 * Date:	12/11/2021
 * Version: 1.0
 * Author:  Fluffy
 *
 * Description:
 * Adds option to lock and unlock specific crate
 *
 * Parameter(s):
 * _box (OBJECT): - Ammo crate or object
 * _owner (ARRAY): - Player's profilename
 *
 * EXAMPLE:
 * [this,"Punisher"] execVM "Init_Crate.sqf";
 */
 
_box = _this select 0;
_owner = _this select 1;
//make object unable to move and load to prevent stealing
[_box, false, [0, 2, 0], 0] call ace_dragging_fnc_setDraggable;
[_box, false, [0, 2, 0], 0] call ace_dragging_fnc_setCarryable;
[_box, -1] call ace_cargo_fnc_setSize;

//lock crate at the start of the game
_lock_status = _box getVariable ["flf_lock_status", true];
if (_lock_status) then {
[_box, true] remoteExec ["lockInventory"];
};

_statement = {
params ["_target", "_player"];
// lock object
[_target, true] remoteExec ["lockInventory"];
//set variable that box is locked
_target setVariable ["flf_lock_status", true, true];
systemChat "locked";
};

_condition = {
params ["_target", "_player", "_params"];
_owner = _params;
//get variable
_lock_status = _target getVariable ["flf_lock_status", true];
// check if caller is the owner and object is unlocked
name _player == _owner && !_lock_status
};

//same thing happens with unlocking
_statement_unlock = {
[_target, false] remoteExec ["lockInventory"];
_target setVariable ["flf_lock_status", false, true];
systemChat "unlocked";
};

_condition_unlock = {
params ["_target", "_player", "_params"];
_owner = _params;
_lock_status = _target getVariable ["flf_lock_status", true];
name _player == _owner && _lock_status
};

_action_lock = ["Lock_Crate","Lock Crate","\a3\modules_f\data\iconlock_ca.paa",_statement,_condition,{},_owner] call ace_interact_menu_fnc_createAction;
[_box, 0, ["ACE_MainActions"], _action_lock] call ace_interact_menu_fnc_addActionToObject;

_action_unlock = ["Unlock_Crate","Unlock Crate","\a3\modules_f\data\iconunlock_ca.paa",_statement_unlock,_condition_unlock,{},_owner] call ace_interact_menu_fnc_createAction;
[_box, 0, ["ACE_MainActions"], _action_unlock] call ace_interact_menu_fnc_addActionToObject;
