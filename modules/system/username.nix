{ lib, ... }: {
  options.modules.username = lib.mkOption {
    type = lib.types.str;
  };
}
