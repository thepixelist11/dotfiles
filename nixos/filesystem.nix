{ ... }:

{
  fileSystems."/home/ben/external" = {
    device = "/dev/disk/by-uuid/a7a41bd9-6746-45f9-a965-1a8bb2b29694";
    fsType = "ext4";
    options = [ "defaults" ];
  };
}
