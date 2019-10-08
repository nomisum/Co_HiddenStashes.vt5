#include "component.hpp"

private ["_startPosition"];

private _startPosition = getMarkerPos "mrk_independent_hq"; // [] call wita_setup_fnc_selectStartLocation;
INFO_1("%1 selected as start location for independent.", _startLocation);

/*
{
    if ([_x] call wita_common_fnc_isAgent) then {
        private _startVeh = [_startPosition] call wita_setup_fnc_createStartVehicle;
        if (WITA_DEBUGMODE) then {
            ["wita_indep_startvehicle",getPos _startVeh,"ICON",[1,1],"PERSIST","TYPE:","hd_dot","COLOR:","COLORGUER"] call CBA_fnc_createMarker
        };
    };
    false
} count playableUnits;

"respawn_guerrila" setMarkerPos _startPosition;

if (WITA_DEBUGMODE) then {
    ["wita_indep_crashHeli",getPos _heli,"ICON",[1,1],"PERSIST","TYPE:","mil_triangle","COLOR:","COLORGUER"] call CBA_fnc_createMarker;
    ["wita_indep_startPosition",_startPosition,"ICON",[1,1],"PERSIST","TYPE:","hd_start","COLOR:","COLORGUER"] call CBA_fnc_createMarker;
};
*/

missionNamespace setVariable ["WITA_SETUP_INDEPENDENTDONE",true,true];

_startPosition
