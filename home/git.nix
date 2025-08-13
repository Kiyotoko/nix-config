{
  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nano";
      credential.helper = "store";
      github.user = "Kiyotoko";
      push.autoSetupRemote = true;
    };
    userEmail = "karl.zschiebsch@gmail.com";
    userName = "Kiyotoko";
  };
}
