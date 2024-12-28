{
  lib,
  fetchFromGitHub,
  alsa-lib,
  libXCursor,
  pulseaudio,
  libX11,
  openssl,
  clang,
  rust-platform
}:
rust-platform.BuildRustPackage rec {
  pname = "robrix";
  version = "0.1.0-pre-alpha";
  src = fetchFromGitHub {
    owner = "project-robius";
    repo = "robrix";
    rev = "v${version}";
    hash = "";
  };
  
  cargoHash = lib.fakeHash;
  
  nativeBuildInputs = [
    clang
    alsa-lib
    libX11
    libXCursor
    pulseaudio
  ];
  buildInputs = [
    openssl
  ];
  
  meta = {
    description = "A multi-platform Matrix chat client written in Rust";
    homepage = "https://github.com/project-robius/robrix";
    liscense = lib.licenses.mit;
    maintainers = with lib.maintainers; [ darwincereska ];
    mainProgram = "robrix";
  };
}