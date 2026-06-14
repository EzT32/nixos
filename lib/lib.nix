# lib/lib.nix
lib:
lib.extend (
  _: lprev: {
    # Merge feature additions into attrset.
    # `or { }` guard against lib.modules not existing.
    modules = lprev.modules or { } // {

      # Check if any group appears in enableGroups.
      # Returns: boolean
      # Args:
      # - groups: list of groups specified module belong to, e.g [ "dev" ].
      # - enableGroups: system-wide list of active groups
      inGroups = groups: enableGroups: builtins.any (g: builtins.elem g enableGroups) groups;

      # Determine if a module should be enabled based on its explicit
      # enable value and group membership.
      # - true:  always enabled
      # - false: always disabled
      # - null:  defers to enableGroups
      # Args:
      # - enable:       cfg.enable value (null | bool)
      # - groups:       list of groups this module belongs to
      # - enableGroups: from modules.enableGroups
      # Returns: boolean
      isEnabled =
        enable: groups: enableGroups:
        enable == true || (enable == null && lprev.modules.inGroups groups enableGroups);
    };

    options = lprev.options or { } // {

      # Shorthand for a nullable bool option used as a module enable switch.
      # - true:  explicitly enable
      # - false: explicitly disable
      # - null:  defer to enableGroups (default)
      # Args:
      # - description: string describing what the option enables
      # Returns: lib.mkOption attrset
      mkUnsetOption =
        description:
        lprev.mkOption {
          type = lprev.types.nullOr lprev.types.bool;
          default = null;
          inherit description;
        };
    };
  }
)
