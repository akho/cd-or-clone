{pkgs ? import <nixpkgs> {}, stdenv ? pkgs.stdenv, lib ? pkgs.lib, ...}:

stdenv.mkDerivation {
  name = "cd-or-clone";
  version = "0.0.1";
  src = ./.;
  buildInputs = [ pkgs.perl pkgs.git pkgs.fzf ];
  nativeBuildInputs = [ pkgs.makeWrapper ];
  installPhase = ''
    mkdir -p $out/bin
    cp ./cd-or-clone $out/bin/ 
    wrapProgram $out/bin/cd-or-clone \
      --set CDORCLONE_GIT_PATH ${ lib.makeBinPath [ pkgs.git ]}/git \
      --set CDORCLONE_FZF_PATH ${ lib.makeBinPath [ pkgs.fzf ]}/fzf
    '';
}
