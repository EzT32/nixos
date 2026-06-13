{ pkgs, ... }: {
  config.services.minecraft-server = {
    enable = true;
    package = pkgs.unstable.minecraft-server;
    eula = true;
    openFirewall = true;
    declarative = true;
    jvmOpts = "-Xmx4G -Xms4G";
    serverProperties = {
      difficulty = "hard";
      spawn-protection = 0;
      view-distance = 16;
      enable-rcon = true;
      "rcon.password" = "password";
    };
  };

}
