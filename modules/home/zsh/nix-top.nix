{
  programs.zsh = {
    initContent = ''
      export KICAD_3RD_PARTY=/home/dezash/kicad/3rdparty/KiCad
      export KICAD9_SYMBOL_DIR=/home/dezash/kicad/symbols
      export KICAD9_FOOTPRINT_DIR=/home/dezash/kicad/footprints
      export KICAD9_3DMODEL_DIR=/home/dezash/kicad/3d
      export KICAD9_DESIGN_BLOCK_DIR=/home/dezash/kicad/blocks
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
