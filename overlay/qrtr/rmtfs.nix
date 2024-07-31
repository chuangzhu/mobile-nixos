{ stdenv, lib, fetchFromGitHub, udev, qrtr, qmic }:

stdenv.mkDerivation rec {
  pname = "rmtfs";
  version = "1.0";

  buildInputs = [ udev qrtr qmic ];

  src = fetchFromGitHub {
    owner = "andersson";
    repo = "rmtfs";
    rev = "v${version}";
    hash = "sha256-00KOjdkwcAER261lleSl7OVDEAEbDyW9MWxDd0GI8KA=";
  };

  installFlags = [ "prefix=$(out)" ];

  meta = with lib; {
    description = "Qualcomm Remote Filesystem Service";
    homepage = "https://github.com/andersson/rmtfs";
    license = licenses.bsd3;
    platforms = platforms.aarch64;
  };
}
