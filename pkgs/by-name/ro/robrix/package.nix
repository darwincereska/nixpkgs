{
  lib,
  fetchFromGitHub,
  alsa-lib,
  libXcursor,
  pulseaudio,
  libX11,
  openssl,
  clang,
  rustPlatform,
  pkg-config,
  libudev-zero,
}:
rustPlatform.buildRustPackage rec {
  pname = "robrix";
  version = "0.1.0-pre-alpha";
  src = fetchFromGitHub {
    owner = "project-robius";
    repo = "robrix";
    rev = "v${version}";
    hash = "sha256-PqZ6dG7kSapC8VyGuNeDBhm/ljAXv2hOUvj91ctutkI=";
  };
  cargoLock = {
    lockFile = src + "/Cargo.lock";
    outputHashes = {
      "makepad-derive-live-0.4.0" = "sha256-9tM/rJzm3p3wLr4Apn5hVS4ZtNRTRqPHUYl1kXKFQ68=";
      "matrix-sdk-0.7.1" = "sha256-A0OIj4jsOCw1R5SAgcjfGuuRebaZ6KJcqHWMt6Jqakg=";
      "robius-directories-5.0.1" = "sha256-3x4JKX8kP8fdYjaZprg/mO4M5ZwgfR3fAcNHIGC1oJE=";
      "robius-location-0.1.0" = "sha256-WUcYjIBXEKmQnz5GYbiYJDZ7FL94a4ulos9fWG1qxxo=";
      "ruma-0.10.1" = "sha256-IZjy2a0URreITlh01PlwfUNA2wYP1RSCDMZOdm1iZSA=";
      "vodozemac-0.7.0" = "sha256-3bQyowAycvzLIwrHke+MvgbMBnfPHsUI5GTrDR5muBA=";
    };
  };
  
  cargoHash = lib.fakeHash;
  nativeBuildInputs = [
      pkg-config
      libudev-zero
    ];
  buildInputs = [
    openssl
    clang
    alsa-lib
    libX11
    libXcursor
    pulseaudio
  ];
  
  meta = {
    description = "A multi-platform Matrix chat client written in Rust";
    homepage = "https://github.com/project-robius/robrix";
    liscense = lib.licenses.mit;
    maintainers = with lib.maintainers; [ darwincereska ];
    mainProgram = "robrix";
  };
}