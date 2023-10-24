if (!isServer) exitWith {};

private _exists = ["blu_task_cultist"] call BIS_fnc_taskExists;

if (!_exists) then {
	[
		player, 
		["blu_task_cultist"], 
		["
		Spüren Sie die Rebellen auf und eliminieren Sie so viele, dass Sie sie zur Aufgabe ihrer Waffen überreden können. Bringen Sie die Überlebenden zur C-130 auf ihrem Flugfeld.
		In regelmäßigen Abständen werden Wärmebilder unserer Flugzeuge ausgewertet und potentielle Feindareale markiert.
		Bestellen Sie notwendige Fahrzeuge am Terminal am Ausgang der Basis (ACE-Interact).
		Achtung: Die Russen werden das Übertreten der Grenze als feindlichen Akt werten und entsprechend gegen Sie vorgehen!
		", "Rebellen vernichten oder extrahieren", ""],
		objNull,
		1, 
		2, 
		true
	] call BIS_fnc_taskCreate;
};
