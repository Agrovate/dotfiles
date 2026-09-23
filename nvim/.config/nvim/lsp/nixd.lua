local hostname = vim.uv.os_gethostname()
local lowerhostname = string.lower(hostname)

return {
    cmd = { "nixd" },
    filetypes = { "nix" },
    root_markers = { "flake.nix", ".git" },
    settings = {
        nixd = {
            nixpkgs = {
                expr = "import <nixpkgs> { }",
            },
            formatting = {
                command = { "alejandra" },
            },
            options = {
                nixos = {
                    expr = '(builtins.getFlake "~/.dotfiles/.nixos").nixosConfigurations.'
                        .. lowerhostname
                        .. ".options",

                },
            },
        },
    },
}
