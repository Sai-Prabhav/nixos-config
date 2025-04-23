{
  description = "NixOS + Home-Manager for greenflame41";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      #extraSpecialArgs={inherit inputs;};
      modules =
        [ ./configuration.nix inputs.home-manager.nixosModules.default ];
      specialArgs = { inherit inputs self; };
    };
  };
}

