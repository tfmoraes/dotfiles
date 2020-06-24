{ lib, buildPythonPackage, fetchurl }:

buildPythonPackage rec {
  pname ="PyPubSub";
  version = "4.0.3";
  src = fetchurl {
    url = "https://github.com/schollii/pypubsub/archive/v${version}.tar.gz";
    sha256 = "18l97965bfw832z74lcslpg155vchcnq3xlghnmin0mh3jm3vy0d";
  };
  doCheck = false;
}
