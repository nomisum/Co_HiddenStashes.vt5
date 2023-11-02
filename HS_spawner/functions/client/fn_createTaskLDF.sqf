if (!isServer) exitWith {};

private _exists = ["blu_task_ldf"] call BIS_fnc_taskExists;

if (!_exists) then {
    [
        player, 
        ["blu_task_ldf"], 
        ["
        Hunt down the rebels and eliminate them. Sometimes our planes might give you indications on the map where our thermals picked up signals.
New vehicles will be delivered to your base automatically. Be aware the russians will see entering their territory as an act of aggression and act accordingly.
Attention: Growing rumors suggest there is an apocalyptic sect active in the border area. Treat them as any enemy and eliminate any threat.
        ", "Destroy rebels and sectists", ""],
        objNull,
        1, 
        2, 
        true
    ] call BIS_fnc_taskCreate;
};
