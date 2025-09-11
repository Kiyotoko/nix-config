# Checkout the docs first!
# https://nixos-mailserver.readthedocs.io/en/latest/setup-guide.html#setup-dns-a-aaaa-records-for-server
{
  config,
  pkgs,
  ...
}:
{
  imports = [
    (builtins.fetchTarball {
      # Pick a release version you are interested in and set its hash, e.g.
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-25.05/nixos-mailserver-nixos-25.05.tar.gz";
      # To get the sha256 of the nixos-mailserver tarball, we can use the nix-prefetch-url command:
      # release="nixos-25.05"; nix-prefetch-url "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/${release}/nixos-mailserver-${release}.tar.gz" --unpack
      sha256 = "1qn5fg0h62r82q7xw54ib9wcpflakix2db2mahbicx540562la1y";
    })
  ];

  mailserver = {
    enable = true;
    stateVersion = 3;
    # TODO: Add our mail url here.
    fqdn = "mail.example.com";
    domains = [ "example.com" ];

    # A list of all login accounts. To create the password hashes, use
    # nix-shell -p mkpasswd --run 'mkpasswd -sm bcrypt'
    loginAccounts = {
      # TODO: Add our account here.
    };

    # Use Let's Encrypt certificates. Note that this needs to set up a stripped
    # down nginx and opens port 80.
    certificateScheme = "acme-nginx";
  };
  security.acme.acceptTerms = true;
  security.acme.defaults.email = "security@example.com";
}
