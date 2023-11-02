class HS_spawner {

    class client {
        file = HS_spawner\functions\client;

        class addModules {postInit = 1;};

        class assignTaskLDF;
        class assignTaskCultist;
        class createTask1;
        class createTask2;
        class createTask3;
        class createTask4;
        class createTask5;
        class createTask6;
        class createTaskLDF;
        class createTaskCultist;
    };

  class server {
        file = HS_spawner\functions\server;

        class equipWithGasMask;

        class loadoutLDF;
        class loadoutRussian;

        class playOrganMusic;
        class policeFeed;
        class setFace;
        
        class spawnCivilians;
        class spawnCiviliansCrowd;
        class spawnClone;
        class spawnLDF;

        class spawnLightHouseFeed;
        class spawnListener {postInit = 1;};

        class spawnMapPlane;
        class spawnNuclearWasteTruck;

        class spawnPoliceCar;

        class spawnPriest;
        class spawnRussians;
        class spawnStreetBlock;
        class spawnTranslationBook;

        class zombieInit;
    };
};