{ config, pkgs, ... }:

{
# Let Home Manager install and manage itself.
programs.home-manager.enable = true;

# Home Manager needs a bit of information about you and the
# paths it should manage.
home.username = "thiago";
home.homeDirectory = "/home/thiago";

home.packages = with pkgs; [
  htop
  fortune
  meshlab
  paraview

  # gnome3
  gnome3.gnome-tweaks
  gnome3.gnome-boxes

  # neovim
  neovim
  neovim-qt
  rust-analyzer
  python-language-server
  gopls
  rnix-lsp
  vimlsp
  sumneko

  keepassxc
  ctags
  starship
  ninja
  thunderbird-bin
  gitg
  fdupes
  binutils
  # appimage-run
  patchelf
  vlc
  ffmpeg-full
  chromium
  imagemagick
  pandoc
  haskellPackages.pandoc-citeproc
  texlive.combined.scheme-full
  zettlr
  zotero
  wineWowPackages.full
  wineWowPackages.fonts
  vulkan-tools
  (
    pkgs.python3.withPackages (ps: with ps;[
      beautifulsoup4
      click
      cython
      gdcm
      imageio
      ipython
      Keras
      keras-applications
      keras-preprocessing
      matplotlib
      networkx
      nibabel
      numba
      numpy
      opencv4
      pandas
      plaidml
      psutil
      pydot
      pypubsub
      requests
      scikitimage
      scikitlearn
      scipy
      sympy
      TheanoWithCuda
      vtk
      wxPython_4_1
    ]))
  ];

  services = {

    dropbox = {
      enable = true;
    };

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

    direnv = {
      enable = true;
      enableFishIntegration = true;
    };

    # neovim = {
      # enable = true;
    # };
  };

  home.file = {
    ".config/fish/functions/fish_greeting.fish".text = ''
      function fish_greeting;end
    '';
  };

  home.sessionVariables = {
    # PLAIDML_NATIVE_PATH = "${pkgs.python3Packages.plaidml}/lib/libplaidml.so";
    # RUNFILES_DIR = "${pkgs.python3Packages.plaidml}/share/plaidml";
    LD_LIBRARY_PATH = "$LD_LIBRARY_PATH:${pkgs.ocl-icd}/lib";
    EDITOR = "nvim";
  };

  home.stateVersion = "20.09";
}
