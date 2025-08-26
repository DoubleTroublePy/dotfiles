#!/usr/bin/env bash

# This script launches a Windows executable using Proton within a Linux environment.
# It requires exactly one argument: the path to the executable to run.
# It sets up a separate Proton prefix for each executable to avoid conflicts.
# Usage: proton <path-to-executable>

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <executable-path>"
  exit 1
fi

PROTON_ROOT="/mnt/personal/steam/steamapps/common/Proton - Experimental/"
STEAM_ROOT="/mnt/personal/steam"
PROTON_VER="Proton - Experimental"
GAME_ROOT="$(dirname "$1")"
GAME="$(basename "$1")"

cd "$GAME_ROOT" || exit

mkdir -p "$PROTON_ROOT/$GAME"
export STEAM_COMPAT_DATA_PATH="$PROTON_ROOT/$GAME"
export STEAM_COMPAT_CLIENT_INSTALL_PATH="$STEAM_ROOT"

"$STEAM_ROOT/steamapps/common/$PROTON_VER/proton" run "$1"
