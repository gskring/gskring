{ buildDunePackage
, fetchFromGitHub
, dune-configurator
, pkgs
}:

buildDunePackage (finalAttrs: {
  pname = "oniguruma";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "alan-j-hu";
    repo = "ocaml-oniguruma";
    tag = finalAttrs.version;
    hash = "sha256-ZTJlFyKFt6bn/Rn1fjmTtkyCy6FD1p7KTBPBoLqfREQ=";
  };

  env.DUNE_CACHE = "disabled";

  buildInputs = [ dune-configurator ];

  propagatedBuildInputs = [
    pkgs.oniguruma
  ];

  doCheck = true;
})
