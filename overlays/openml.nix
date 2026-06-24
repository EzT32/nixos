# overlays/openml.nix
final: prev: {
  openml = prev.python3Packages.buildPythonPackage {
    pname = "openml";
    version = "0.15.1";

    src = prev.python3Packages.fetchPypi {
      pname = "openml";
      version = "0.15.1";
      hash = "sha256-WK44QLbqc2u2xpvLsw1Ye4F/ZNsHDcaRrbngm5kBiBY=";
    };

    propagatedBuildInputs = with prev.python3Packages; [
      final.liac-arff
      requests
      xmltodict
      scikit-learn
      python-dateutil
      scipy
      numpy
      pandas
      minio
      pyarrow
      tqdm
    ];

    pyproject = true;
    build-system = with prev.python3Packages; [ setuptools ];
  };
}
