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
  version = "1.3.2";

  src = fetchFromGitHub {
    owner = "ocaml-community";
    repo = "omd";
    tag = finalAttrs.version;
    hash = "sha256-PeEWqHgdajSxoi5G4TfyV1S3RRfilYlcttTxQ0xhyE4=";
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
