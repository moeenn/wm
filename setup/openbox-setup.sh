#! /bin/bash

function install_packages() {
  declare -a packages=(
    "openbox"
    "lxappearance"
    "thunar"
    "obconf"
    "tint2"
    "compton"
    "dmenu"
    "feh"
    "hsetroot"
    "alacritty"
    "fonts-jetbrains-mono"
    "fonts-go"
    "mpv"
    "gcolor3"
    "i3lock"
    "volumeicon-alsa"
  )

  install_cmd="sudo apt-get install -y"
  for pkg in ${packages[@]}; do
    install_cmd="${install_cmd} ${pkg} "
  done

  eval $install_cmd
}

function link_home_files() {
  prefix="../home"
  declare -a home_files=(
    ".Xresources"
    ".compton.conf"
    ".themes"
  )

  for file in ${home_files[@]}; do
    path=~/$file

    if ! [ -e $path ]; then
      echo "linking: $path"
      ln -sr $prefix/$file $path
    else
      old="$path.old"
      mv -v $path $old
      ln -sr $prefix/$file $path
    fi
  done
}

function link_config_files() {
  prefix="../config"
  declare -a config_files=(
    "alacritty"
    "openbox"
    "tint2"
  )

  for file in ${config_files[@]}; do
    path=~/.config/$file

    if ! [ -e $path ]; then
      echo "linking: $path"
      ln -sr $prefix/$file $path
    else
      old="$path.old"
      mv -v $path $old
      ln -sr $prefix/$file $path
    fi
  done
}

install_packages
link_home_files
link_config_files
