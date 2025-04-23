{
  description = "NixOS + Home-Manager for greenflame41";

  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-unstable;
  home-manager.url = github:nix-community/home-manager;
  };

  outputs = { self, nixpkgs,  ... }: {
    nixosConfigurations.nixos= nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
      ];
      specialArgs = { inherit self; };
    };
  };
}



