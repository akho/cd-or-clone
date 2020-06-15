{stdenv, lib, pkgs ? import <nixpkgs> {}, ...}:

stdenv.mkDerivation {
  name = "cd-or-clone";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ pkgs.perl pkgs.git ];
  nativeBuildInputs = [ pkgs.makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp ./cd-or-clone $out/bin/ 
    wrapProgram $out/bin/cd-or-clone --prefix PATH ${ lib.makeBinPath [ pkgs.git ] } 
    '';
}
