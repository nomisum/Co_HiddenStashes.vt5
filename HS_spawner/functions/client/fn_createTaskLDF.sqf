if (!isServer) exitWith {};

[
    west, 
    ["blu_task1"], 
    ["Spüren Sie die Rebellen auf und vernichten Sie sie ODER nehmen Sie Kontakt auf und extrahieren Sie sie - entwaffnet - mit der C130 auf ihrem Flugfeld. 
    Für letzteres müssen Sie auf die Hilfe der Rebellen-Dolmetscher zählen.
    In regelmäßigen Abständen werden Wärmebilder unserer Flugzeuge ausgewertet und potentielle Feindareale markiert.
    Bestellen Sie notwendige Fahrzeuge am Terminal am Ausgang der Basis (ACE-Interact).
    Achtung: Die Russen werden das Übertreten der Grenze als feindlichen Akt werten und entsprechend gegen Sie vorgehen!
    ", "Rebellen vernichten oder extrahieren", ""],
    objNull,
    1, 
    2, 
    true
] call BIS_fnc_taskCreate;