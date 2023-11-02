"blu_task_ldf" call BIS_fnc_taskSetCurrent;

["Use self interact to see your briefing!"] call CBA_fnc_notify;

player createDiaryRecord ["Mission", ["Your mission", "
Hunt down the rebels and eliminate them. Sometimes our planes might give you indications on the map where our thermals picked up signals.
New vehicles will be delivered to your base automatically. Be aware the russians will see entering their territory as an act of aggression and act accordingly.
Attention: Growing rumors suggest there is an apocalyptic sect active in the border area. Treat them as any enemy and eliminate any threat."], taskNull, "", false];