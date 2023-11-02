#include "script_macros.hpp"

params ["_type"];

// manaNeeded in percent
private _manaNeeded = 1;

switch (_type) do {
	case "walker": { _manaNeeded = 0.2; };
	case "zombie": { _manaNeeded = 0.2; };
	case "spider": { _manaNeeded = 0.3; };
	case "demon": { _manaNeeded = 0.4; };
	case "resurrect": { _manaNeeded = 1; };
	case "sense": { _manaNeeded = 0.75; };
	default { };
};

_manaNeeded * MAX_DRAIN_TIME