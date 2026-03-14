{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # powers up the default Bluetooth
  };

  # Use blueman for bluetooth
  services.blueman.enable = true;
}