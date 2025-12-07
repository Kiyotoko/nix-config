{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    settings = {
      color.ui = true;
      core.editor = "nano";
      credential.helper = "store";
      github.user = "Kiyotoko";
      push.autoSetupRemote = true;
      user.email = "karl.zschiebsch@gmail.com";
      user.name = "Kiyotoko";
    };
  };
}
