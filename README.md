# How things work

## import-tree & flake-parts
All nix files are recursively imported by the `import-tree` tool. It collects every file with the `.nix` suffix it finds, and hands them over to the module system – similarly to listing them in `imports = []` manually.

### Special cases
The `_` prefix works on either a file or folder and opts it out of the tool's discovery. Features currently being drafted or that are not wanted in the context, should therefore be denoted as such.

`configuration.nix` files are not imported at flake level. The `flake-parts` module system is a different system from NixOS' completely, have different options, special arguments etc. A NixOS module created from these configuration files would not be compatible or non-functional in the flake-parts context. 

## nixosConfigurations
An attribute in the flake's outputs that `nixos-rebuild` knows to look at. When running `nixos-rebuild switch --flake .#<host>`, Nix looks up `outputs.nixosConfigurations.<host>` in the flakem finds a fully evaluated system configuration (the system configuration), and builds it. `nixpkgs.lib.nixosSystem` is the function that produces that evaluated system – it takes a list of modules and runs NixOS' module system over them to produce a buildable system.


# General structure
```
.
├── flake.nix                  ← flake-parts + import-tree, much smaller
├── modules/
│   ├── hosts/
│   │   ├── desktop/
│   │   │   ├── default.nix    ← host definition for flake-parts
│   │   │   └── configuration.nix
│   │   └── laptop/
│   │       ├── default.nix
│   │       └── configuration.nix
│   ├── system/
│   │   ├── boot.nix
│   │   ├── locale.nix
│   │   ├── networking.nix
│   │   ├── nix.nix
│   │   ├── security.nix
│   │   ├── user.nix           ← new: modules.user option block
│   │   └── ...
│   ├── desktop/
│   │   ├── hyprland.nix       ← collapsed, no sub-default.nix needed
│   │   ├── hypridle.nix
│   │   ├── hyprlock.nix
│   │   ├── waybar.nix
│   │   └── ...
│   ├── programs/
│   │   ├── discord.nix
│   │   ├── steam.nix
│   │   ├── kitty.nix
│   │   └── ...
│   ├── groups/                ← new: convenience group enables
│   │   ├── communication.nix
│   │   ├── gaming.nix
│   │   ├── media.nix
│   │   └── dev.nix
│   ├── dev/
│   │   ├── nvim.nix           ← just fetches external flake input
│   │   ├── java.nix
│   │   └── python.nix
│   ├── services/
│   │   └── ...
│   ├── overlays/
│   │   ├── unstable.nix
│   │   └── vsg.nix
│   └── presets.nix
└── README.md
```
