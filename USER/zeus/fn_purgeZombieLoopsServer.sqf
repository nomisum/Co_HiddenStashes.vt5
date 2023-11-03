if (!isServer) exitWith {};


if (!isNil "grad_mainZombieLoops") then {
	private _count = count grad_mainZombieLoops;
	{ [_x] call CBA_fnc_removePerFrameHandler; } forEach grad_mainZombieLoops;
	
	diag_log ("PURGED " + str _count + " ZOMBIE LOOPS");

};

grad_mainZombieLoops = nil;
