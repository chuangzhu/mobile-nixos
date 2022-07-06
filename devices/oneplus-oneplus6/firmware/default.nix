{ lib
, runCommandNoCC
, fetchFromGitLab
}:

runCommandNoCC "oneplus-oneplus6-firmware"
{
  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "firmware-oneplus-sdm845";
    # sdm845-5.18.3
    rev = "3ec855b2247291c79652b319dfe93f7747363c86";
    sha256 = "sha256-0000000000000000000000000000000000000000000=";
  };
  meta.license = lib.licenses.unfreeRedistributable;
} ''
  install -Dm444 "$src/lib/firmware/qcom/a630_gmu.bin" -t "$out/lib/firmware"
  install -Dm444 "$src/lib/firmware/qcom/a630_sqe.fw" -t "$out/lib/firmware"
  install -Dm444 "$src/lib/firmware/qcom/sdm845/oneplus6/a630_zap.mbn" -t "$out/lib/firmware"
''
