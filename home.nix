{ config, pkgs, ... }:

{
  # Imports your custom jj module and any others
  imports = [
    # ./parts/jj.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "jr";
  home.homeDirectory = "/home/jr";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "25.11";

  # Enable the custom jj module you defined earlier
  # custom.jj.enable = true;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    # Terminal essentials
    nushell
    starship
    direnv

    # Dev tools
    helix
    ripgrep
    fd
  ];

  # Basic configuration for other programs
  programs.bash.enable = true; # Good to have as a fallback

  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
