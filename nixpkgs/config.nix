{ pkgs, ... }:

{
    time.timeZone = "America/Sao_Paulo";

    packageOverrides = pkgs: with pkgs; {
        neovim = pkgs.neovim.override {
            extraPython3Packages = (ps: with ps; [
                    neovim
                    black
                    isort
                    jedi
                    pylint
            ]);
            extraPythonPackages = (ps: with ps; [
                    neovim
                    jedi
            ]);
        };
    };
}
