python-self: python-super:
{

  # nibabel = python-super.nibabel.overrideAttrs (oldAttrs: {
    # doInstallCheck = false;
    # propagatedBuildInputs = oldAttrs.propagatedBuildInputs
    # ++ [python-super.packaging];
  # });

  Keras = python-super.Keras.overrideAttrs (oldAttrs: rec {
    pname = "Keras";
    version = "2.2.4";
    name = "${pname}-${version}";
    src = python-super.fetchPypi {
      pname = "Keras";
      version = "2.2.4";
      sha256 = "1j8bsqzh49vjdxy6l1k4iwax5vpjzniynyd041xjavdzvfii1dlh";
    };
  });

  plaidml = python-super.callPackage ./plaidml {
  };

  # pypubsub = python-super.callPackage ./pubsub {
    # buildPythonPackage = python-super.buildPythonPackage;
  # };

  # gdcm = python-super.toPythonModule ((
    # python-super.callPackage ./gdcm {
      # enablePython = true;
    # }).override {}) ;

  wxPython_4_1 = python-super.callPackage ./wxPython/4.1.nix {
  };

  }
