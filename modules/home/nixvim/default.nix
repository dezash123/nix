{ pkgs, inputs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./ai.nix
    ./cmp.nix
    ./keymaps.nix
    #./lazy.nix
    ./lsp.nix
    ./options.nix
    ./utils.nix
    ./ui.nix
    ./utils
  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
  
    nixpkgs.useGlobalPackages = true;

    diagnostic.settings.virtual_lines.only_current_line = true;

    # extraPlugins = with pkgs.vimPlugins; [
    #   augment-vim
    # ];

    extraConfigVim = ''
      autocmd BufRead,BufNewFile *.pl set filetype=prolog
    '';
  };
}
