{
  description = "hakyll-poc-messed-cycle";

  inputs = {
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { self
    , flake-compat
    , nixpkgs
    , utils
    }:

    utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        haskellPackages = pkgs.haskellPackages.override {
          overrides = final: prev: {
            hakyll-poc-messed-cycle = final.callPackage ./hakyll-poc-messed-cycle.nix { };
          };
        };
      in {
        devShell = self.packages.${system}.hakyll-poc-messed-cycle.env.overrideAttrs (attrs: {
          nativeBuildInputs = attrs.nativeBuildInputs ++ [
            pkgs.cabal-install
          ];
        });

        packages.hakyll-poc-messed-cycle = haskellPackages.hakyll-poc-messed-cycle;

        defaultPackage = self.packages.${system}.hakyll-poc-messed-cycle;

        apps.hakyll-poc-messed-cycle = utils.lib.mkApp { drv = self.packages.${system}.hakyll-poc-messed-cycle; };

        defaultApp = self.apps.${system}.hakyll-poc-messed-cycle;
      }
  );
}
