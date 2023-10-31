// initialize cultist

if (!(player getVariable ["isCultist", false])) then {

	 ["cameraView", {
		
		private _currentNVGState = player getVariable ["cultist_nvg", false];
		
		if (_currentNVGState) then {
			(player) action ["nvGoggles", (player)];
		} else {
			(player) action ["nvGogglesOff", (player)];
		};
		
	}] call CBA_fnc_addPlayerEventHandler;
};

player setcaptive true; // to make Zs ignore player

// new identification var
player setVariable ["isCultist", true, true];

// new role for briefing
player setVariable ["missionControl_role", "cultist", true];

// new group
private _buddy = player getVariable ["grad_missionControl_buddy", objNull];
if (isNull _buddy) then {
	[player] joinSilent (createGroup west);
} else {
	[player, _buddy] joinSilent (createGroup west);
};

player setVariable ["cbrn_mask_on", false, true];
if (!isNil "cbrn_mask_abberation") then {
	cbrn_mask_abberation ppEffectEnable true;
	cbrn_mask_abberation ppEffectAdjust [0,0,true];
	cbrn_mask_abberation ppEffectCommit 1;
	"cbrn_gasmask_overlay" cutFadeOut 1;
	terminate cbrn_breath_handle;
};

// hide marker
(group player) setVariable ["ACE_map_hideBlueForceMarker", true, true];
[{
	call grad_cultist_fnc_cultistLoadout;
	player linkitem "TFAR_fadak";
	player linkitem "ItemGps";
	player enableFatigue false;

	["Check your private briefing"] call CBA_fnc_notify;
}, [], 5] call CBA_fnc_waitAndExecute;

["Welcome to the Cultists!"] call CBA_fnc_notify;


// setup cultist displays and loadout
call grad_cultist_fnc_cultistManaDisplay;
call grad_cultist_fnc_cultistManaManager;

// inform zeus
["grad_missionControl_curatorInfo", [player, "respawned"]] call CBA_fnc_serverEvent;


if (isNil "mrk_cultistSpawn") then {
	private _marker = createMarkerLocal ["mrk_cultistSpawn", getPos player]; 
	_marker setMarkerTypeLocal "Contact_circle4";
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTextLocal "Cultist Base";
};