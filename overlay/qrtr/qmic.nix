{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "qmic";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "andersson";
    repo = "qmic";
    rev = "v${version}";
    hash = "sha256-0/mIg98pN66ZaVsQ6KmZINuNfiKvdEHMsqDx0iciF8w=";
  };

  installFlags = [ "prefix=$(out)" ];

  meta = with lib; {
    description = "QMI IDL compiler";
    homepage = "https://github.com/andersson/qmic";
    license = licenses.bsd3;
    platforms = platforms.aarch64;
  };
}
