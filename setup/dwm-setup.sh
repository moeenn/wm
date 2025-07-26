#! /bin/bash

function install_packages() {
  declare -a packages=(
    "lxappearance"
    "thunar"
    "obconf"
    "tint2"
    "compton"
    "feh"
    "hsetroot"
    "alacritty"
    "fonts-jetbrains-mono"
    "fonts-go"
    "mpv"
    "gcolor3"
    "i3lock"
    "libX11-devel"
    "xorg-x11-proto-devel"
    "harfbuzz"
    "libxft-dev"
    "libxinerama-dev"
    "xorg-x11-server-Xephyr"
    "xorg-x11-drivers"
    "xorg-x11-xinit"
  )

  install_cmd="sudo apt-get install -y"
  for pkg in ${packages[@]}; do
    install_cmd="${install_cmd} ${pkg} "
  done

  eval $install_cmd
}

install_packages
