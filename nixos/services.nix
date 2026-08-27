{ config, pkgs, ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";

      clock = "%T";

      clear_password = true;
      asterisk = "*";

      vi_mode = true;

      default_input = "login";
    };
  };
}
