{ mkDerivation, stdenv, base, css-syntax, text
}:
mkDerivation {
  pname = "css2HsClassName";
  version = "0.1.0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base css-syntax text
  ];
  description = "Utilities to generate css and html tags to reflex";
  license = stdenv.lib.licenses.bsd3;
}
