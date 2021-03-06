# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

with pkgs;
{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./network.nix
      ./gnome.nix
      ./fonts.nix
      ./dropbox.nix
      ./users.nix
    ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    useSandbox = true;
    trustedUsers = [ "root" "thiago" ];
    readOnlyStore = false;
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';
  };

  boot = {
    tmpOnTmpfs = true;
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = false;
        #  devices = [ "nodev" ];
        #  efiSupport = true;
        #  useOSProber = true;
      };
    };
  };


  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true;
    };
    libvirtd = {
      enable = true;
    };
    lxd = {
      enable = true;
    };
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  environment = {
    systemPackages = with pkgs; [
      curl
      firefox-bin
      fish
      git
      vim
      wget

      aspell
      aspellDicts.en
      aspellDicts.pt_BR
      direnv
      duperemove
      exfat
      file
      killall
      flameGraph
      gnupg
      graphviz
      htop
      lz4
      ntfs3g
      p7zip
      pciutils
      tree
      unrar
      unzip
      zlib
      xclip

      bat
      exa
      fd
      fzf
      hyperfine
      ripgrep
      tokei

      gcc
      clang
      clang-tools
      nodejs
      go_bootstrap
      gnumake
      rustup
      (python3.withPackages (py: [
        py.requests
        py.ipython
        py.numpy
        py.scipy
      ]))
    ];

  };

  programs = {
    fish.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  sound = {
    enable = true;
  };

  hardware = {

    enableAllFirmware = true;

    cpu = {
      amd.updateMicrocode = true;
    };

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };

    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };

    sane = {
      enable = true;
      extraBackends = with pkgs; [ hplipWithPlugin ];
    };
  };

  services = {

    printing = {
      enable = true;
      drivers = with pkgs; [ gutenprint hplipWithPlugin ];
    };

    avahi = {
      enable = true;
      hostName = config.networking.hostName;
      ipv4 = true;
      nssmdns = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    resolved = {
      enable = true;
    };

    smartd = {
      enable = true;
    };

    sshd = {
      enable = true;
    };

    xserver = {
      enable = true;
    };

    flatpak = {
      enable = true;
    };

    fstrim = {
      enable = true;
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?
}
