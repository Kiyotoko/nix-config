{ ... }:
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "b8e26b4e-8f71-4751-9320-f8cf76543f8b" = {
        credentialsFile = "/home/admin/.cloudflared/b8e26b4e-8f71-4751-9320-f8cf76543f8b.json";
        ingress = {
          "ssh.zschiebsch.org" = "ssh://localhost:22";
          "zschiebsch.org" = "http://localhost:80";
          "www.zschiebsch.org" = "http://localhost:80";
          "git.zschiebsch.org" = "http://localhost:3000";
          "nextcloud.zschiebsch.org" = "http://localhost:8080";
        };
        default = "http_status:404";
      };
    };
  };
}