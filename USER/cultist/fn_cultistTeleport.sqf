// server manages teleport

if (!isServer) exitWith {};

params ["_player", "_pos"];

private _placeholderBefore = createVehicle ["Land_ClutterCutter_small_F", getPos player, [], 0, "CAN_COLLIDE"];
private _placeholderAfter = createVehicle ["Land_ClutterCutter_small_F", _pos, [], 0, "CAN_COLLIDE"];

private _soundDummyBefore = createVehicle ["Land_ClutterCutter_small_F", getPos player, [], 0, "CAN_COLLIDE"];
private _soundDummyAfter = createVehicle ["Land_ClutterCutter_small_F", _pos, [], 0, "CAN_COLLIDE"];

[_placeholderBefore, getPos _placeholderBefore] remoteExec ["grad_cultist_fnc_cultistBeamCreate"];
[_placeholderAfter, getPos _placeholderAfter] remoteExec ["grad_cultist_fnc_cultistBeamCreate"];

[_soundDummyBefore, "teleport_global"] remoteExec ["say3D"];
[_soundDummyAfter, "teleport_global"] remoteExec ["say3D"];

[{
	params ["_placeholderBefore", "_placeholderAfter", "_player", "_pos"];
	
	private _flashPosBefore = [(getPos _placeholderBefore#0), (getPos _placeholderBefore#1), 1.5];
	private _flashPosAfter = [(getPos _placeholderAfter#0), (getPos _placeholderAfter#1), 1.5];

	deleteVehicle _placeholderBefore; // triggers deletion on clients
	deleteVehicle _placeholderAfter; // triggers deletion on clients
	
	[_flashPosAfter] remoteExec ["grad_cultist_fnc_cultistSpawnFX_spawnFlash"];
	_player setPos _pos;
	[_flashPosBefore] remoteExec ["grad_cultist_fnc_cultistSpawnFX_spawnFlash"];
	_player setVariable ["cultist_teleporting", false, true];

}, [_placeholderBefore, _placeholderAfter, _player, _pos], 5] call CBA_fnc_waitAndExecute;

[{
	params ["_soundDummyBefore", "_soundDummyAfter"];

	deleteVehicle _placeholderBefore;
	deleteVehicle _placeholderAfter;

}, [_soundDummyBefore, _soundDummyAfter], 25] call CBA_fnc_waitAndExecute;
