# modules/system/enable-groups.nix
{
  lib,
  ...
}:
{
  options.modules.enableGroups = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [ ];
    description = "List of active module groups. Modules belonging to an enabled group are activated unless explicitly disabled.";
  };
}
