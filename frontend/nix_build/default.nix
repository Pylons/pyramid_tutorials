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
    inherit pkgs pythonPackages;
  };

in buildPythonPackage rec {

  name = "pyramid-tutorial";
  src = ./.;

  postInstall = ''
    ensureDir $out/bin
    ln -s ${python}/bin/python${if isPython3 == false then "3" else ""} $out/bin/python
    for file in $out/bin/*; do
      wrapProgram $file --prefix PYTHONPATH : $PYTHONPATH
    done
  '';

  buildInputs = with customPythonPackages; [
    #flake8
    #pytest
    #pytest-cov
  ] ++ pkgs.lib.optional develop [
    #ipdb
  ];

  propagatedBuildInputs = with customPythonPackages; [
    pyramid
    #pyramid_mako
    #supervisor
    waitress
  ];

}
