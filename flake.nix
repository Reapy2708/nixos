{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    #nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # Helix editor Master branch
    helix.url = "github:helix-editor/helix/master";

    # Grub Themes
    nixos-grub-themes.url = "github:jeslie0/nixos-grub-themes";

    #Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    
    #Home Manager
    home-manager = {
      #url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }@inputs: {  
    nixosConfigurations = {
      t460s = nixpkgs.lib.nixosSystem {
	      system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
	        ./hosts/t460s
	        home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
	          home-manager.useUserPackages = true;
	          home-manager.users.reapy = import ./hosts/t460s/home.nix;
          }
	];
      };
      
      t440p-nvi = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/t440p-nvi
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tino = import ./hosts/t440p-nvi/home.nix;
          }    
        ];
      };

      yoga2 = nixpkgs.lib.nixosSystem {
      	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/yoga2
          home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.reapy = import ./hosts/yoga2/home.nix;
          }
	];
      };

	ultimate-yoga = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = {inherit inputs;};
	modules = [
	  ./hosts/ultimate-yoga
	  home-manager.nixosModules.home-manager {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;
	    home-manager.users.sinan = import ./hosts/ultimate-yoga/home.nix;
	  }
	];
      };

	overclockulus = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {inherit inputs;};
		modules = [
		  ./hosts/overclockulus
		  home-manager.nixosModules.home-manager {
		    home-manager.useGlobalPkgs = true;
		    home-manager.useUserPackages = true;
		    home-manager.users.ares = import ./hosts/overclockulus/home.nix;
		  }
		];
	      };
      
    };
  };
}
