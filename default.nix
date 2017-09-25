{ compiler   ? "ghc"
} :
let
  initialNixpkgs = import <nixpkgs> {};
  pkgs = initialNixpkgs.pkgs;

  #installPhase = ''
  #  mkdir $out
  #  cp -r ./* $out/
  #'';
  # phase = ["unpackPhase" "buildPhase" "installPhase"];
  adjust-for-ghc = drv: {
    executableSystemDepends = [
      pkgs.haskellPackages.ghcid
      # (pkgs.callPackage (import ./tools/nix-tags-haskell) {})
      pkgs.cabal-install
      pkgs.haskellPackages.ghc-mod
      pkgs.haskellPackages.hasktags
      pkgs.haskellPackages.haskdogs  # stack config set system-ghc --global true
      pkgs.haskellPackages.hdevtools
      pkgs.haskellPackages.hlint
      pkgs.haskellPackages.pointfree
      pkgs.haskellPackages.pointful
      /* pkgs.stack */
    ];
    /* executableHaskellDepends = [ */
    /* ]; */
  };

  adjust = adjust-for-ghc;

  /* haskellPackages = pkgs.haskellPackages.${compiler}.override { */
  /*   overrides = (self: super: { */
  /*     ghc = super.ghc // { withPackages = super.ghc.withHoogle; }; */
  /*     ghcWithPackages = self.ghc.withPackages; */
  /*   }); */
  /* }; */

  exe-code-base = 
    pkgs.haskellPackages.callPackage ./css2HsClassName.nix { };
  exe-code = 
    pkgs.haskell.lib.overrideCabal exe-code-base adjust;
in
  exe-code
