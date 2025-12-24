{ buildDunePackage
, fetchFromGitHub
, bstr
, cachet
, checkseum
, decompress
, duff
, logs
, ohex
, optint
}:

buildDunePackage (finalAttrs: {
  pname = "carton";
  version = "1.1.0";

  src = fetchFromGitHub {
    owner = "robur-coop";
    repo = "carton";
    tag = finalAttrs.version;
    hash = "sha256-IBmiXKwzw7nNuPO6MLoUuYBfTi0LBZPRDsSbragJQYs=";
  };

  env.DUNE_CACHE = "disabled";

  propagatedBuildInputs = [
    bstr
    cachet
    checkseum
    decompress
    duff
    logs
    ohex
    optint
  ];

  doCheck = true;
})
