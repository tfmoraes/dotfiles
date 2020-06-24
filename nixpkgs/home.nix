{ config, pkgs, ... }:

{
# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

# Home Manager needs a bit of information about you and the
# paths it should manage.
  home.username = "thiago";
  home.homeDirectory = "/home/thiago";

  home.packages = [
    pkgs.htop
      pkgs.fortune
      pkgs.meshlab
      pkgs.paraview
      pkgs.gnome3.gnome-tweaks
      pkgs.gnome3.gnome-boxes
      pkgs.keepassxc
      pkgs.ctags
      # pkgs.neovim
      pkgs.neovim-qt
      pkgs.starship
      pkgs.python-language-server
      pkgs.gopls
      pkgs.rust-analyzer
      pkgs.ninja
      pkgs.rnix-lsp
      pkgs.thunderbird-bin
      (
       pkgs.python3.withPackages (ps: with ps;[
         vtk
         numpy
         scipy
         scikitimage
         scikitlearn
         pandas
         nibabel
         psutil
         imageio
         TheanoWithCuda
         matplotlib
         Keras
         keras-applications
         keras-preprocessing
         wxPython_4_0
         ipython
         cython
         gdcm
         pypubsub
         plaidml
       ]))
      ];

  services = {
    gnome-keyring = {
      enable = true;
    };
  };

  programs = {
    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    fish = {
      enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
    };

    neovim = {
      enable = true;
      withPython = true;
      withPython3 = true;
      extraPython3Packages = (ps: with ps; [
        pynvim
        black
        isort
        pylint
      ]);

      extraPythonPackages = (ps: with ps; [
        pynvim
      ]);
    };
  };

  home.file = {
    ".config/fish/functions/fish_greeting.fish".text = ''
      function fish_greeting;end
    '';
  };

  # home.sessionVariables = {
    # PLAIDML_NATIVE_PATH = "${pkgs.plaidml}/lib/libplaidml.so";
    # RUNFILES_DIR = "${pkgs.plaidml}/share/plaidml";
    # LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${pkgs.ocl-icd}/lib";
  # };

  home.stateVersion = "20.09";
}
