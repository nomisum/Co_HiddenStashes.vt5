params ["_unit"];

_unit setVariable ["missionControl_role", "saboteur", true];

["You have been assigned a private briefing (Self Interact)"] remoteExec ["CBA_fnc_notify", _unit];