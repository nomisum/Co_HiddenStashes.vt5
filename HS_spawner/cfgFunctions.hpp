class HS_spawner {

    class client {
        file = HS_spawner\functions\client;

        class addModules {postInit = 1;};
    };

  class server {
        file = HS_spawner\functions\server;

        class loadoutRussian;
        class spawnCivilians;
        class spawnListener {postInit = 1;};
    };
};