{
  description = "Wrapped i3";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    supportedSystems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forAllSystems = f:
      nixpkgs.lib.genAttrs supportedSystems (
        system: f (import nixpkgs {inherit system;})
      );
  in {
    packages = forAllSystems (
      pkgs: let
        system = pkgs.stdenv.hostPlatform.system;

        inputConfig = builtins.readFile ./.config/i3/config;

        updatedConfig =
          builtins.replaceStrings
          ["alacritty"]
          [(nixpkgs.lib.getExe ghostty.packages.${system}.default)]
          inputConfig;

        finalConfig =
          pkgs.writeText "i3-config" updatedConfig;
      in {
        default = inputs.wrappers.lib.wrapPackage {
          inherit pkgs;

          package = pkgs.i3;

          runtimePkgs = with pkgs; [
            xrandr
            xkill
            xinit
            xauth
            xsetroot
            dmenu
            i3status
            xinit
          ];

          flags = {
            "-c" = ./.config/i3/config;
          };
        };
      }
    );
  };
}
