# modules/dev/java.nix
{
  den.aspects.java = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        javaPackages.compiler.openjdk25
      ];
    };
  };
}
