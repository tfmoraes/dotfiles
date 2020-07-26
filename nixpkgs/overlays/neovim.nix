self: super: {
  neovim-unwrapped = super.neovim-unwrapped.overrideDerivation (oldAttrs: rec{
    pname = "neovim-unwrapped";
    version = "0.5.0";
    name="${pname}-${version}";
    src = super.pkgs.fetchFromGitHub {
      owner = "neovim";
      repo = "neovim";
      rev = "44cbf288ec4407c6fddf79b6b39041d5bbee940b";
      sha256 = "0m19jm648f2gm0zx2faymbvm9wcqisznfk91s69rh04bajw0mybp";
    };
  });

  neovim = super.neovim.override {
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
}
