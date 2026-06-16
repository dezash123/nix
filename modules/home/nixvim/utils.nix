_: {
  programs.nixvim.plugins = {
    bufferline.enable = true;
    remote-nvim.enable = true;
    direnv.enable = true;

    # menu autocomplete
    wilder = {
      enable = true;
      settings.modes = [
        ":"
        "/"
        "?"
      ];
    };

    # keymap hints
    which-key.enable = true;

    # terminal
    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        float_opts.border = "curved";
        highlights = {
          FloatBorder.link = "FloatBorder";
          Normal.link = "Normal";
          NormalFloat.link = "NormalFloat";
        };
        open_mapping = "[[<C-t>]]";
        shade_terminals = false;
      };
    };

    # indentation guides
    indent-blankline = {
      enable = true;
      settings = {
        indent = {
          smart_indent_cap = true;
          char = "│";
        };
        scope = {
          enabled = true;
          char = "│";
          show_end = false;
          show_start = false;
        };
      };
    };
  };
}
