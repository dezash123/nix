_: 
{
  programs.nixvim.plugins = {
    bufferline.enable = true;
    remote-nvim.enable = true;
    direnv.enable = true;
    # menu autocomplete
    wilder = {
      enable = true;
      modes = [ ":" "/" "?" ];
    };
    # keymap hints
    which-key.enable = true;
    # terminal 
    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-t>]]";
      };
    };
    # tab highlighting 
    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          smart_indent_cap = true;
          char = " ";
        };
        scope = {
          enabled = true;
          char = "│";
        };
      };
    };
    # autosave
    auto-save = {
      enable = true;
      settings.enabled = true;
    };
  };
}
