{
  description = "NixOS + Home-Manager for greenflame41";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      #extraSpecialArgs={inherit inputs;};
      modules = [
        ./configuration.nix

        inputs.home-manager.nixosModules.default
      ];

      specialArgs = {inherit inputs self;};
    };
  };
}
