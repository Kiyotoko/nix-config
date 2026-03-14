{ pkgs, ... }:

{
  # https://nixos.wiki/wiki/PipeWire
  # rtkit is optional but recommended
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.playerctld.enable = true;

  environment.systemPackages = with pkgs; [
    # Cross-platform media player and streaming server
    vlc
    # PulseAudio Volume Control
    pavucontrol
  ];
}
