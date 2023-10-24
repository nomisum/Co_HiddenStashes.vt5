"blu_task_cultist" call BIS_fnc_taskSetCurrent;


hint "Gentlemens Agreement: Schalten Sie Licht und Warnleuchte an Fahrzeugen an und nutzen Sie dauerhaft das Flashlight der Primärwaffe. Detailliertere Hinweise zur Task im Map-Screen.";

player createDiaryRecord ["Auftrag", ["Ihr Auftrag", "
    Spüren Sie die Rebellen auf und eliminieren Sie so viele, dass Sie sie zur Aufgabe ihrer Waffen überreden können. Bringen Sie die Überlebenden zur C-130 auf ihrem Flugfeld.
    In regelmäßigen Abständen werden Wärmebilder unserer Flugzeuge ausgewertet und potentielle Feindareale markiert.
    Bestellen Sie notwendige Fahrzeuge am Terminal am Ausgang der Basis (ACE-Interact).
    Achtung: Die Russen werden das Übertreten der Grenze als feindlichen Akt werten und entsprechend gegen Sie vorgehen!"], taskNull, "", false];