{ pkgs ? import <nixpkgs> { } }:
(pkgs.buildFHSUserEnv {
  name = "flipperzero-firmwrare";
  targetPkgs = pkgs:
    (with pkgs; [
      (python3.withPackages (ps: with ps; [ ansi pip protobuf3 pylint ]))
      clang
      cmake
      gdb
      git
      m4
      openssl
      pkg-config
      protobuf
      scons
      wget
      zlib
      zsh
    ]);
  multiPkgs = pkgs: [ pkgs.dpkg ];
  runScript = "zsh";
}).env