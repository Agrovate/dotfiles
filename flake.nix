{
  description = "My dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
    i3-subflake.url = "path:./i3";
  };

  outputs = {
    self,
    nixpkgs,
    wrappers,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    i3 = inputs."i3-subflake";
  in {
    packages.${system}.i3 =
      i3.packages.${system}.default;
  };
}
