_:
{
  programs.nixvim.plugins = {
    avante.enable = true; 
    # copilot-chat.enable = true;
    supermaven.enable = true;
    claude-code = {
      enable = true;
      settings = {
        window = {
          position = "rightbelow vsplit";
        };
      };
    };
  };
}
