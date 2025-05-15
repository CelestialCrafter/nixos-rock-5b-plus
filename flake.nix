{
  description = "Build image";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    radxa-kernel = {
      url = "github:radxa/kernel";
      flake = false;
    };
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      ...
    }:
    rec {
      nixosConfigurations.rock-5b-plus = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          ./kernel.nix
          {
            nixpkgs.config.allowUnsupportedSystem = true;
            nixpkgs.hostPlatform.system = {
			};
            nixpkgs.buildPlatform.system = "x86_64-linux";
          }
        ];
      };
      images.rock-5b-plus = nixosConfigurations.rock-5b-plus.config.system.build.sdImage;
    };
}
