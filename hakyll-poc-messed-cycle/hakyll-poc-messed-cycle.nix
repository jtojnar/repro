{ mkDerivation
, base
, containers
, extra
, filepath
, graphviz
, hakyll
, lib
}:

mkDerivation {
  pname = "hakyll-poc-messed-cycle";
  version = "0.0.1";

  # Keep the contents of the src/ directory and top-level .cabal file.
  src = lib.sourceByRegex ./. [ "^src(/.+|$)" "[^/]+\.cabal$" ];

  isLibrary = false;
  isExecutable = true;

  executableHaskellDepends = [
    base
    containers
    extra
    filepath
    graphviz
    hakyll
  ];

  license = lib.licenses.mit;
}
