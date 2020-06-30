{ nixpkgs ? <nixpkgs>, ... }:
let
  pkgs = import nixpkgs {};
in {
  jobsets = pkgs.writeText "rendered-jobsets.json" (builtins.toJSON {
    minimal = {
      enabled = 1;
      hidden = false;
      description = "minimal nixpkgs hello example";
      nixexprinput = "nixpkgs";
      nixexprpath = "pkgs/top-level/release.nix";
      checkinterval = 300;
      schedulingshares = 100;
      enableemail = false;
      emailoverride = "";
      keepnr = 3;
      inputs = {
        nixpkgs = {
	  type = "git";
	  value = "https://github.com/grahamc/nixpkgs.git minimal";
	  emailresponsible = false;
  	};
      };
    };
  });
}

