{ pkgs, ... }:

[
  (pkgs.neovim.override {
    extraPythonPackages = with pkgs.python27Packages; [ neovim ];
    extraPython3Packages = with pkgs.python35Packages; [ neovim black isort ];
  })
  pkgs.python
  pkgs.ctags
] 
