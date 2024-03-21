{
  description = "Purescript-Lua Flake";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    easyps = {
      url = "github:justinwoo/easy-purescript-nix";
      flake = false;
    };
    pslua.url = "github:Unisay/purescript-lua";
  };

  outputs = { self, nixpkgs, flake-utils, easyps, pslua }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        epkgs = import easyps { inherit pkgs; };
        lpkgs = pkgs.lua51Packages;
      in {
        devShell = pkgs.mkShell {
          buildInputs = [
              pkgs.dhall
              lpkgs.lua
              lpkgs.luacheck
              pkgs.luaformatter
              pkgs.nixfmt
              pslua.packages.${system}.default
              epkgs.purescript
              epkgs.purs-tidy
              epkgs.spago
              pkgs.treefmt
            ];
        };
      });
}

