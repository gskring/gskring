{ buildDunePackage
, fetchFromGitHub
, dune-build-info
, ppx_expect
, uucp
, uunf
, uutf
}:

buildDunePackage (finalAttrs: {
  pname = "omd";
  version = "2.0.0.alpha4";

  src = fetchFromGitHub {
    owner = "ocaml-community";
    repo = "omd";
    tag = finalAttrs.version;
    hash = "sha256-5eZitDaNKSkLOsyPf5g5v9wdZZ3iVQGu8Ot4FHZZ3AI=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    dune-build-info
    uucp
    uunf
    uutf
  ];

  doCheck = true;

  checkInputs = [
    ppx_expect
  ];
})
