{
  programs.git = {
    enable = true;

    settings = {
      user.name = "dezash123";
      user.email = "desmondmehta@gmail.com ";

      init.defaultBranch = "main";
      credential.helper = "store";
    };
    lfs.enable = true;
  };
}
