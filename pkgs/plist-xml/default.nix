{ buildDunePackage
, fetchFromGitHub
, base64
, eio
, eio_main
, iso8601
, menhir
, menhirLib
, xmlm
}:

buildDunePackage (finalAttrs: {
  pname = "plist-xml";
  version = "0.5.1";

  src = fetchFromGitHub {
    owner = "alan-j-hu";
    repo = "ocaml-plist-xml";
    tag = finalAttrs.version;
    hash = "sha256-y89TwblEZdzAlOvikRX+78a2cm5GXlIwmzmriYpQH0A=";
  };

  env.DUNE_CACHE = "disabled";

  nativeBuildInputs = [
    menhir
  ];

  propagatedBuildInputs = [
    base64
    iso8601
    menhirLib
    xmlm
  ];

  doCheck = true;

  checkInputs = [
    eio
    eio_main
  ];
})
