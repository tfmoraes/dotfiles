self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideDerivation (oldAttrs: rec{
    pname = "neovim-unwrapped";
    version = "0.5.0";
    name="${pname}-${version}";
    src = super.pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "721f69c4af8bc81ba04088e7b56f8cdba653b418";
      sha256 = "1zcbv0x48yvr7llfyvb5qdpgf3rb6ccnxakah5bkz8nz42sikwlk";
    };
  });

  # neovim = super.neovim.override {
    # extraPython3Packages = (ps: with ps; [
      # pynvim
      # black
      # isort
      # pylint
    # ]);
    # extraPythonPackages = (ps: with ps; [
      # pynvim
    # ]);
  # };
}
