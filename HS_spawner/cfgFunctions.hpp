class HS_spawner {

    class client {
        file = HS_spawner\functions\client;

        class addModules {postInit = 1;};

        class assignTaskLDF;
        class createTask1;
        class createTask2;
        class createTask3;
        class createTask4;
        class createTask5;
        class createTask6;
        class createTaskLDF {postInit = 1;};
    };

  class server {
        file = HS_spawner\functions\server;

        class enemies_aceDamage;
        class enemies_attackHuman;
        class enemies_attackHumanOriginal;
        class enemies_engageTarget;
        class enemies_engageTargetOriginal;
        class enemies_feedOnTargetAny;
        class enemies_feedOnTargetOriginal;
        class enemies_findTargetLoopOriginal;
        class enemies_overwriteRZfunction {preInit = 1;};

        class loadoutLDF;
        class loadoutRussian;
        class spawnCivilians;
        class spawnCiviliansCrowd;
        class spawnClone;
        class spawnLDF;

        class spawnLightHouseFeed;
        class spawnListener {postInit = 1;};

        class spawnMapPlane;

        class spawnPoliceCar;

        class spawnRussians;
    };
};