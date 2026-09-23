{
  description = "Neovim with LSP dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    wrappers.url = "github:BirdeeHub/nix-wrapper-modules";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    supportedSystems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];

    forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f (import nixpkgs {inherit system;}));
  in {
    packages = forAllSystems (
      pkgs: let
        pkgList = with pkgs; [
          # LSPs
          lua-language-server
          stylua

          vscode-langservers-extracted
          emmet-language-server
          svelte-language-server
          typescript-language-server
          tailwindcss-language-server

          rust-analyzer
          rustfmt
          ast-grep

          prettier

          black
          python313Packages.python-lsp-server
          basedpyright
          ruff

          alejandra
          nixd

          # other tools
          lua5_1
          tree-sitter
          ripgrep
          gcc
          cargo
          fzf
          gnumake
          imagemagick
          luarocks
        ];
      in {
        default = inputs.wrappers.wrappers.neovim.wrap {
          inherit pkgs;
          runtimePkgs = pkgList;
          settings.config_directory = ./.;
        };
        minimal = inputs.wrappers.wrappers.neovim.wrap {
          inherit pkgs;
          runtimePkgs = with pkgs; [
            lua5_1
            tree-sitter
            ripgrep
            gcc
            fzf
            luarocks
          ];
          settings.config_directory = ./.;
        };
      }
    );
  };
}
