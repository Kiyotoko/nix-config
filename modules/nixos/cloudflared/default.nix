{ ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "b8e26b4e-8f71-4751-9320-f8cf76543f8b" = {
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