{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur.url = "github:nix-community/NUR";
  
    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
  
    alejandra.url = "github:kamadorueda/alejandra/3.0.0";
  
    nix-gaming.url = "github:fufexan/nix-gaming";
  
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };
  
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprmag.url = "github:SIMULATAN/hyprmag";

    nixvim = {
          url = "github:nix-community/nixvim";
          inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, self, ...} @ inputs:
  let
    username = "romain";
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/desktop {
        nixpkgs.overlays = [
          inputs.hyprpanel.overlay
        ];
        } 
        ];
        specialArgs = { host="desktop"; inherit self inputs username ; };
        
      };
      nividic = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/nividic
        {
        nixpkgs.overlays = [
          inputs.hyprpanel.overlay
        ];
        } 
        ];
        specialArgs = { host="nividic"; inherit self inputs username ; };
      };
       vm = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [ ./hosts/vm 
        {
        nixpkgs.overlays = [
          inputs.hyprpanel.overlay
        ];
        } 
        ];
        specialArgs = { host="vm"; inherit self inputs username ; };
        overlays = [
        inputs.hyprpanel.overlay
      ];
      };
    };
  };
}
