{
  description = "z0wr's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixos-24.11";
  }

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.z0wr-desktop = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        "./configuration.nix"
      ];
    }
  }
}