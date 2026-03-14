{ ... }:
{
  services.ddclient = {
    enable = true;
    ssl = true;
    use = "web, web=https://cloudflare.com/cdn-cgi/trace";
    interval = "5min";
    protocol = "cloudflare";
    passwordFile = "/var/ddclient/api-token";
    zone = "zschiebsch.org";
    domains = [ "zschiebsch.org" ];
  };
}