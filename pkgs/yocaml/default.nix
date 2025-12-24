{ buildDunePackage
, fetchFromGitHub
, alcotest
, fmt
, logs
, mdx
, ppx_expect
, qcheck
, qcheck-alcotest
}:

buildDunePackage (finalAttrs: {
  pname = "yocaml";
  version = "2.8.0";

  src = fetchFromGitHub {
    owner = "xhtmlboi";
    repo = "yocaml";
    tag = "v${finalAttrs.version}";
    hash = "sha256-wuKPv9bFV2DEV5KwfZxnYavtqaCs8OO/iKI2F3qF+4w=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    logs
  ];

  doCheck = true;

  nativeCheckInputs = [
    mdx.bin
  ];

  checkInputs = [
    alcotest
    fmt
    (mdx.override { inherit logs; })
    ppx_expect
    qcheck
    qcheck-alcotest
  ];
})
