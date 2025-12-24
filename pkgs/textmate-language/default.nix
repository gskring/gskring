{ buildDunePackage
, fetchFromGitHub
, alcotest
, ezjsonm
, oniguruma
, plist-xml
, yojson
}:

buildDunePackage (finalAttrs: {
  pname = "textmate-language";
  version = "0.4.0";

  src = fetchFromGitHub {
    owner = "alan-j-hu";
    repo = "ocaml-textmate-language";
    tag = finalAttrs.version;
    hash = "sha256-s18Qd7CTjYSrIFZaR6V8WbodJRo+Qctrqg2yr3dQx+Q=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    oniguruma
  ];

  doCheck = true;

  checkInputs = [
    alcotest
    ezjsonm
    plist-xml
    yojson
  ];
})
