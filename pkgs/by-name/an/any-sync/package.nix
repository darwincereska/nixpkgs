{
  lib,
  fetchFromGitHub,
  buildGoModule,
}:

buildGoModule rec {
  pname = "any-sync";
  version = "0.5.25";

  src = fetchFromGitHub {
    owner = "anyproto";
    repo = "any-sync";
    rev = "refs/tags/v${version}";
    hash = "sha256-wA8V/EFPDhzyNa4nc6NpQfH1KaClt0a8JAsWY7sPqz0=";
  };

  vendorHash = "sha256-az30eFqJ77j5O+/PFIFEs9vNDz5DzdC7jJzug4P86i4=";

  buildPhase = ''
    runHook preBuild
    go build -o build/bin/any-sync .
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp build/bin/any-sync $out/bin/
    runHook postInstall
  '';
}
