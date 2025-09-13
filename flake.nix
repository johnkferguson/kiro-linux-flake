{
  description = "Kiro - AI-powered IDE based on VSCode";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      # Only support x86_64-linux for now since that's what we have the URL for
      supportedSystem = system == "x86_64-linux";
    in
      if supportedSystem
      then {
        packages.default = pkgs.callPackage "${pkgs.path}/pkgs/applications/editors/vscode/generic.nix" {
          pname = "kiro";
          version = "202509032213";
          src = pkgs.fetchurl {
            url = "https://prod.download.desktop.kiro.dev/releases/202509032213--distro-linux-x64-tar-gz/202509032213-distro-linux-x64.tar.gz";
            sha256 = "sha256-nqOtD7Ef7dLYHzAM2jTybV/paUPjPYBJpa2AM0lnyIE=";
          };

          executableName = "kiro";
          longName = "Kiro";
          shortName = "Kiro";
          libraryName = "kiro";
          iconName = "kiro";
          commandLineArgs = "";

          sourceRoot = "Kiro";

          tests = {};
          updateScript = null;

          meta = with pkgs.lib; {
            description = "AI-powered IDE based on VSCode";
            homepage = "https://kiro.dev";
            license = licenses.unfree;
            maintainers = [];
            platforms = ["x86_64-linux"];
            sourceProvenance = [sourceTypes.binaryBytecode];
          };
        };

        packages.kiro = self.packages.${system}.default;
      }
      else {
        packages = {};
      });
}
