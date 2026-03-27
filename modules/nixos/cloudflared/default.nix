{ ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "00000000-0000-0000-0000-000000000000" = {
        credentialsFile = "/home/admin/.cloudflared/cert.pem";
        ingress = {
          "zschiebsch.org" = "https://localhost";
          "www.zschiebsch.org" = "https://localhost";
          "git.zschiebsch.org" = "https://localhost:3000";
          "nextcloud.zschiebsch.org" = "https://localhost:8080";
        };
        default = "http_status:404";
      };
    };
  };
}