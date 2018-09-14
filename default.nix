{ 
} :
let
  config = {
    packageOverrides = pkgs: rec {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          /* aeson = haskellPackagesNew.callPackage ./aeson.nix { }; */
          ghc = haskellPackagesOld.ghc
            // { withPackages = haskellPackagesOld.ghc.withHoogle; };
          ghcWithPackages = haskellPackagesNew.ghc.withPackages;
        };
      };
    };
    # allowUnfree = true;
  };
  nixpkgs = import <nixpkgs> { inherit config; };
  pkgs = nixpkgs.pkgs;
  hpkgs = pkgs.haskellPackages;

  adjust-for-ghc = drv: {
    executableSystemDepends = [
      hpkgs.ghcid
      hpkgs.cabal-install
    ];
    buildDepends = [
      hpkgs.hdevtools 
      hpkgs.hlint
      # hpkgs.hasktags
      # hpkgs.haskdogs  # stack config set system-ghc --global true
      # hpkgs.hindent
      # hpkgs.hsimport
      # hpkgs.pointfree
      # hpkgs.pointful
      # hpkgs.stylish-haskell
    ];
  };

  adjust = adjust-for-ghc;

  exe-code-base = hpkgs.callCabal2nix "css2HsClassName" ./. {};
  exe-code = pkgs.haskell.lib.overrideCabal exe-code-base adjust;
in
  exe-code

