{ stdenv, lib, fetchFromGitHub, meson, ninja }:

stdenv.mkDerivation rec {
  pname = "qrtr";
  version = "1.1";

  nativeBuildInputs = [ meson ninja ];

  src = fetchFromGitHub {
    owner = "linux-msm";
    repo = "qrtr";
    rev = "v${version}";
    hash = "sha256-cPd7bd+S2uVILrFF797FwumPWBOJFDI4NvtoZ9HiWKM=";
  };

  #installFlags = [ "prefix=$(out)" ];
  mesonFlags = [ "-Dsystemd-service=disabled" ];

  meta = with lib; {
    description = "QMI IDL compiler";
    homepage = "https://github.com/andersson/qrtr";
    license = licenses.bsd3;
    platforms = platforms.aarch64;
  };
}
