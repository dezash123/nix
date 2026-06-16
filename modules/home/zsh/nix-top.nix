{
  programs.zsh = {
    initContent = ''
      export KICAD_3RD_PARTY="$HOME/kicad/3rdparty/KiCad"
      export KICAD9_SYMBOL_DIR="$HOME/kicad/symbols"
      export KICAD9_FOOTPRINT_DIR="$HOME/kicad/footprints"
      export KICAD9_3DMODEL_DIR="$HOME/kicad/3d"
      export KICAD9_DESIGN_BLOCK_DIR="$HOME/kicad/blocks"
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
