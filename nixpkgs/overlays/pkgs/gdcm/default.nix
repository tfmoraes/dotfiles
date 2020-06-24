{ stdenv, fetchurl, cmake, vtk_7, swig
, enablePython ? false, python ? null }:

with stdenv.lib;

stdenv.mkDerivation rec {
  version = "3.0.6";
  pname = "gdcm";

  src = fetchurl {
    url = "mirror://sourceforge/gdcm/gdcm-${version}.tar.bz2";
    sha256 = "048ycvhk143cvsf09r7vwmp4sm9ah9bh5pbbrl366m5a4sp7fr89";
  };

  dontUseCmakeBuildDir = true;

  cmakeFlags = [
    "-DGDCM_BUILD_APPLICATIONS=ON"
    "-DGDCM_BUILD_SHARED_LIBS=ON"
    "-DGDCM_USE_VTK=ON"]
    ++ optional enablePython ["-DGDCM_WRAP_PYTHON:BOOL=ON"];

  preConfigure = ''
    cmakeDir=$PWD
    mkdir ../build
    cd ../build
    cmakeFlags="$cmakeFlags -DGDCM_INSTALL_PYTHONMODULE_DIR:STRING=$out/lib/${python.libPrefix}/site-packages"'';

  enableParallelBuilding = true;
  buildInputs = [ cmake vtk_7 swig ]
      ++ optional enablePython [
      python
    ];
  propagatedBuildInputs = [ ];

  meta = with stdenv.lib; {
    description = "The grassroots cross-platform DICOM implementation";
    longDescription = ''
      Grassroots DICOM (GDCM) is an implementation of the DICOM standard designed to be open source so that researchers may access clinical data directly.
      GDCM includes a file format definition and a network communications protocol, both of which should be extended to provide a full set of tools for a researcher or small medical imaging vendor to interface with an existing medical database.
    '';
    homepage = "http://gdcm.sourceforge.net/";
    license = with licenses; [ bsd3 asl20 ];
    platforms = platforms.all;
  };
}
