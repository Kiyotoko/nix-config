{ ... }:
{
  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings =
    let
      LC = "de_DE.UTF-8";
    in
    {
      LC_ADDRESS = LC;
      LC_IDENTIFICATION = LC;
      LC_MEASUREMENT = LC;
      LC_MONETARY = LC;
      LC_NAME = LC;
      LC_NUMERIC = LC;
      LC_PAPER = LC;
      LC_TELEPHONE = LC;
      LC_TIME = LC;
    };

  # Configure console keymap
  console.keyMap = "de";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };
}
