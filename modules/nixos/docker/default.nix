{ user, ... }:
{
  users = {
    users."${user}".extraGroups = [
      "docker"
    ];
    extraGroups.docker.members = [ "${user}" ];
  };

  virtualisation.docker.enable = true;
}
