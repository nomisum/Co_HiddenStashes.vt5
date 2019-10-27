if (!isServer) exitWith {};

[
    west, 
    ["blu_task1"], 
    ["Spüren Sie die Rebellen auf und vernichten Sie sie. 
    In regelmäßigen Abständen werden Wärmebilder unserer Flugzeuge ausgewertet und potentielle Feindareale markiert.
    Bestellen Sie notwendige Fahrzeuge am Terminal am Ausgang der Basis (ACE-Interact).
    ", "Rebellen aufspüren und vernichten.", ""], 
    objNull,
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;