# overlays/vsg.nix
final: prev: {
  vsg = prev.python3Packages.buildPythonApplication {
    pname = "vsg";
    version = "3.25.0";

    src = prev.python3Packages.fetchPypi {
      pname = "vsg";
      version = "3.25.0";
      hash = "sha256-3jVkyeGMPPUktYXwI7DbByiyPMefuvXx++5y+Xr+69I=";
    };

    pyproject = true;

    build-system = with prev.python3Packages; [
      setuptools
      setuptools-scm
      setuptools-git-versioning
    ];

    propagatedBuildInputs = with prev.python3Packages; [
      pyyaml
    ];

    # vsg tries to import itself during tests; skip for now
    doCheck = false;
  };
}
