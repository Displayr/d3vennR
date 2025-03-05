{ pkgs ? import <nixpkgs> {}, displayrUtils }:

pkgs.rPackages.buildRPackage {
  name = "d3vennR";
  version = displayrUtils.extractRVersion (builtins.readFile ./DESCRIPTION); 
  src = ./.;
  description = ''Make interactive d3.js Venn/Euler diagrams in R with the convenience and infrastructure
    of an htmlwidget.'';
  propagatedBuildInputs = with pkgs.rPackages; [ 
    htmlwidgets
  ];
}
