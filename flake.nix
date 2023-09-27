{

description = "A blazingly terminal emulator";

inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

outputs = { self, nixpkgs }: let
  pkgs = nixpkgs.legacyPackages.x86_64-linux;
in {
  packages.x86_64-linux.default = pkgs.rustPlatform.buildRustPackage {
    pname = "titty";
    version = "0.0.0";
    src = self;
    cargoLock.lockFile = ./Cargo.lock;
  };

  devShells.x86_64-linux.default = pkgs.mkShell {
    packages = with pkgs; [
      rustc
      cargo
      cargo-watch
      clippy
    ];
  };
};

}
