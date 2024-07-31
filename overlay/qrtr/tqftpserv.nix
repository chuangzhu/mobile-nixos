{ stdenv, lib, fetchFromGitHub, qrtr, meson, ninja, pkg-config, zstd }:

stdenv.mkDerivation rec {
  pname = "tqftpserv";
  version = "1.1";

  nativeBuildInputs = [ meson ninja pkg-config ];
  buildInputs = [ qrtr zstd ];

  src = fetchFromGitHub {
    owner = "linux-msm";
    repo = "tqftpserv";
    rev = "v${version}";
    hash = "sha256-Djw2rx1FXYYPXs6Htq7jWcgeXFvfCUoeidKtYUvTqZU=";
  };

  patches = [
    ./tqftpserv-firmware-path.diff
  ];

  # installFlags = [ "prefix=$(out)" ];

  meta = with lib; {
    description = "Trivial File Transfer Protocol server over AF_QIPCRTR";
    homepage = "https://github.com/andersson/tqftpserv";
    license = licenses.bsd3;
    platforms = platforms.aarch64;
  };
}
