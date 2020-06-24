
self: super: {
  python3 = super.python3.override {
    packageOverrides = import ./python_overlays.nix;
  };

  python37 = super.python37.override {
    packageOverrides = import ./python_overlays.nix;
  };

  python38 = super.python38.override {
    packageOverrides = import ./python_overlays.nix;
  };
}
