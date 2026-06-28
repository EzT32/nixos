# How things work

## import-tree & flake-parts
Files pointed at in `hosts/<host>/configuration.nix` are collected by the `import-tree` tool. It collects every file with the `.nix` suffix it finds, and hands them over to the module system – similarly to listing them in `imports = []` manually.

### Special cases
The `_` prefix works on either a file or folder and opts it out of the tool's discovery. Features currently being drafted or that are not wanted in the context, should therefore be denoted as such.

## nixosConfigurations
An attribute in the flake's outputs that `nixos-rebuild` knows to look at. When running `nixos-rebuild switch --flake .#<host>`, Nix looks up `outputs.nixosConfigurations.<host>` in the flake finds a fully evaluated system configuration, and builds it. `nixpkgs.lib.nixosSystem` is the function that produces that evaluated system – it takes a list of modules and runs NixOS' module system over them to produce a buildable system.


# General structure
```
.
├── modules
│   ├── cli
│   ├── dev
│   │   └── nvim
│   ├── gui
│   │   ├── hyprland
│   │   └── waybar
│   ├── hosts
│   │   ├── desktop
│   │   └── laptop
│   ├── programs
│   ├── services
│   └── system
├── overlays
└── wallpapers
```
