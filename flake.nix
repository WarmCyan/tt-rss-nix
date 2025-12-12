{
  description = "Tiny tiny RSS service module and some plugins as of NixOS 25.05";

  # inputs.nixpkgs.url = "github.com:NixOS/nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs, ... } @ inputs:
  let
    lib = nixpkgs.lib;

    systems = [
      "x86_64-linux"
      "aarch64-linux"
    ];

    forAllSystems = lib.genAttrs systems;
    pkgsFor = forAllSystems (system: inputs.nixpkgs.legacyPackages.${system});
  in {
    packages = forAllSystems (system:
    let
      pkgs = pkgsFor.${system};
    in {
      tt-rss-plugin-close-btn = import ./pkgs/tt-rss-plugin-close-btn.nix { inherit pkgs; };
      tt-rss-plugin-fresh-api = import ./pkgs/tt-rss-plugin-fresh-api.nix { inherit pkgs; };
      tt-rss-plugin-theme-feedly = import ./pkgs/tt-rss-plugin-theme-feedly.nix { inherit pkgs; };
      tt-rss = import ./pkgs/tt-rss.nix { inherit pkgs; };
    });

    nixosModules = {
      tt-rss = import ./modules/tt-rss.nix;
      default = self.nixosModules.tt-rss;
    };
  };
}
