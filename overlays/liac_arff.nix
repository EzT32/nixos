# overlays/liac-arff.nix
{ pkgs }:
final: prev: {
  liac-arff = prev.python3Packages.buildPythonPackage {
    pname = "liac-arff";
    version = "2.5.0";
    src = pkgs.python3Packages.fetchPypi {
      inherit (final.liac-arff) pname version;
      hash = "sha256-MiDQr2SHxapxtHV5vnrR2U84Sf8eIkrzvwWtSaC1xNo=";
    };
    pyproject = true;
    build-system = with pkgs.python3Packages; [ setuptools ];
  };
}
