python-self: python-super:
{

  nibabel = python-super.nibabel.overrideAttrs (oldAttrs: {
    doInstallCheck = false;
    propagatedBuildInputs = oldAttrs.propagatedBuildInputs
    ++ [python-super.packaging];
  });

  Keras = python-super.Keras.overrideAttrs (oldAttrs: rec {
    pname = "Keras";
    version = "2.2.4";
    src = python-super.fetchPypi {
      pname = "Keras";
      version = "2.2.4";
      sha256 = "1j8bsqzh49vjdxy6l1k4iwax5vpjzniynyd041xjavdzvfii1dlh";
    };
  });

  plaidml = python-super.callPackage ./pkgs/plaidml {
  };

  pypubsub = python-super.callPackage ./pkgs/pubsub {
    buildPythonPackage = python-super.buildPythonPackage;
  };

  gdcm = python-super.toPythonModule ((
    python-super.callPackage ./pkgs/gdcm {
      enablePython = true;
    }).override {}) ;

}
