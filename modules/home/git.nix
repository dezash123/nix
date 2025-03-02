{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "dezash123";
    userEmail = "desmondmehta@gmail.com ";
    
    extraConfig = { 
      init.defaultBranch = "main";
      credential.helper = "store";
    };
    lfs.enable = true;
  };

  # home.packages = [ pkgs.gh pkgs.git-lfs ];
}
