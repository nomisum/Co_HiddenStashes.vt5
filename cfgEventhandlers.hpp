class Extended_PreInit_EventHandlers {
    class diwako_cbrn_preInit {
        init = "[] call compile preProcessFileLineNumbers 'node_modules\diwako_cbrn\XEH_PreInit.sqf'";
    };
};

class Extended_InitPost_EventHandlers {
    #include "node_modules\diwako_cbrn\XEH_InitPost_eh.hpp"
};