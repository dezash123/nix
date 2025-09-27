{
  programs.nixvim.plugins = {

    # notifications
    fidget = {
      enable = true;
      settings.progress = {
        suppress_on_insert = true;
        ignore_done_already = true;
        poll_rate = 0;
      };
    };

    #
    treesitter = {
      enable = true;
      nixGrammars = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };

    #
    treesitter-context = {
      enable = true;
      settings = { max_lines = 2; };
    };

    # ([{}]) highlighting
    rainbow-delimiters.enable = true;

    #
    nvim-tree = {
      enable = true;
      openOnSetupFile = true;
      settings.auto_reload_on_write = true;
    };

    # bar on the bottom
    lightline = {
      enable = true;
      settings = {
        colorscheme = "material";
      };
    };
    
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        trouble = true;
      };
    };
  };
}
