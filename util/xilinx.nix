# https://github.com/nix-community/nix-environments/blob/master/envs/xilinx-vitis/shell.nix
# environment for xilinx tools. imperative installation:
#    nix-shell xilinx.nix
#    cd /path/to/Xilinx_Unified*.bin
#    chmod +x Xilinx_Unified*.bin
#    ./Xilinx_Unified*.bin
# install to /home/parthiv/xilinx

{ pkgs ? import <nixpkgs> {}
, extraPkgs ? []
, runScript ? "bash"
, xilinxName ? "xilinx-env"
}:

(pkgs.buildFHSUserEnv {
  name = xilinxName;
  inherit runScript;
  targetPkgs = pkgs: with pkgs; [
    bash
    coreutils
    zlib
    lsb-release
    stdenv.cc.cc
    ncurses5
    xorg.libXext
    xorg.libX11
    xorg.libXrender
    xorg.libXtst
    xorg.libXi
    xorg.libXft
    xorg.libxcb
    xorg.libxcb
    # common requirements
    freetype
    fontconfig
    glib
    gtk2
    gtk3
    libxcrypt-legacy # required for Vivado
    python3

    # to compile some xilinx examples
    opencl-clhpp
    ocl-icd
    opencl-headers

    # from installLibs.sh
    graphviz
    (lib.hiPrio gcc)
    unzip
    nettools
  ] ++ extraPkgs;
  multiPkgs = null;
  profile = ''
    export LC_NUMERIC="en_US.UTF-8"
    source /home/parthiv/xilinx/Vitis/*/settings64.sh
  '';
}).env

