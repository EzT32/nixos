# overlays/liac-arff.nix
final: prev: {
  liac-arff = prev.python3Packages.buildPythonPackage {
    pname = "liac-arff";
    version = "2.5.0";

    src = prev.python3Packages.fetchPypi {
      pname = "liac-arff";
      version = "2.5.0";
      hash = "sha256-MiDQr2SHxapxtHV5vnrR2U84Sf8eIkrzvwWtSaC1xNo=";
    };

    pyproject = true;
    build-system = with prev.python3Packages; [ setuptools ];
  };
}
