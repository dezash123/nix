{ pkgs, ... }: {
  programs.zsh = {
    initContent = ''
      export ACT_HOME=${pkgs.actflow}
    '';
    shellAliases = {
      n = "neovide";
      ssh = "kitten ssh";
      icat = "kitten icat";
      pdf = "tdf";
      open = "xdg-open";
    };
  };
}
