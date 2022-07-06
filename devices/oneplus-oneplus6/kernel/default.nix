{ mobile-nixos
, fetchFromGitLab
, fetchurl
, ...
}:

mobile-nixos.kernel-builder {
  version = "5.18.3-sdm845";
  configfile = ./config.aarch64;
  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    # sdm845-5.18.3
    rev = "b425b70a6379f3415ed349f5c5719d4a6f315523";
    sha256 = "sha256-D6ccdRuVIvf6BWZJJ6pfL2edlGej+XRwcwCzDyydn0c=";
  };
}
