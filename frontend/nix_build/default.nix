{ system ? builtins.currentSystem
, develop ? false
, isPython3 ? false
}:

let

  inherit (pkgs) fetchurl fetchgit;

  pkgs = import <nixpkgs> { inherit system; };

  pythonPackages = if isPython3 == false
    then pkgs.python27Packages
    else pkgs.python34Packages;

  python = pythonPackages.python;
  buildPythonPackage = pythonPackages.buildPythonPackage;
  customPythonPackages = import ./python-packages.nix {
    inherit pkgs pythonPackages isPython3;
  };

in buildPythonPackage rec {

  name = "pyramid-tutorial";
  src = ./.;

  postInstall = ''
    ensureDir $out/bin
    ln -s ${python}/bin/python $out/bin/
    ln -s ${python}/bin/.python-wrapped $out/bin/
    for file in $out/bin/*; do
      wrapProgram $file --prefix PYTHONPATH : $PYTHONPATH
    done
  '';

  buildInputs = with customPythonPackages; [
    flake8
    pytest
    pytest-cov
  ] ++ pkgs.lib.optional develop [
    ipdb
    supervisor
  ];

  propagatedBuildInputs = with customPythonPackages; [
    pyramid
    waitress
  ];

}
