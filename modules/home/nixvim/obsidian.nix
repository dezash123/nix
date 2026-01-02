{
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      legacy_commands = false;
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "current_dir";
      workspaces = [
        {
          name = "notes";
          path = "~/notes";
        }
      ];
    };
  };
}
