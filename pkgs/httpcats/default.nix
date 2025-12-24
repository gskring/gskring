{ buildDunePackage
, fetchFromGitHub
, alcotest
, bstr
, ca-certs
, digestif
, dns-client-miou-unix
, fmt
, h1
, h2
, happy-eyeballs-miou-unix
, logs
, miou
, mirage-crypto-rng-miou-unix
, tls-miou-unix
}:

buildDunePackage (finalAttrs: {
  pname = "httpcats";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "robur-coop";
    repo = "httpcats";
    tag = "v${finalAttrs.version}";
    hash = "sha256-t3gSfv73XYntle1dd4k9bv893pGStk1NHz62mAvcHAs=";
  };

  env.DUNE_CACHE = "disabled";

  __darwinAllowLocalNetworking = true;

  propagatedBuildInputs = [
    miou
    h1
    h2
    ca-certs
    bstr
    tls-miou-unix
    dns-client-miou-unix
    happy-eyeballs-miou-unix
  ];

  doCheck = true;

  checkInputs = [
    alcotest
    digestif
    fmt
    logs
    mirage-crypto-rng-miou-unix
  ];
})
