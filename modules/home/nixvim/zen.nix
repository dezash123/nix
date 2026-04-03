{ pkgs, ... }:
let
  zen-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "zen-nvim";
    version = "unstable-2026-04-03";

    src = pkgs.fetchFromGitHub {
      owner = "diodeinc";
      repo = "zen.nvim";
      rev = "5304e8ba131ddfc59ead94ebac0869cceb569d73";
      hash = "sha256-NJfqSBdnw76jbCsVb/zTlPCy6ipp88iDvpat7L8IThY=";
    };
  };
in
{
  programs.nixvim = {
    extraPlugins = [ zen-nvim ];

    extraConfigLua = ''
      require("zen").setup({
        lsp = {
          enabled = true,
          cmd = { "pcb", "lsp" },
        },
        treesitter = {
          enabled = false,
        },
      })
    '';
  };
}
