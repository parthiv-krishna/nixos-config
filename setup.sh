#!/usr/bin/env bash
# generates a configuration.nix that points to the
# relevant files in this repo as well as the platform-
# specific hardware-configuration.nix

TARGET_CONFIG=/etc/nixos/configuration.nix

DATE=$(date "+%F_%H-%M-%S")
BACKUP_CONFIG=/tmp/configuration_$DATE.nix

SCRIPT_DIR=$(dirname "$(readlink -f "$BASH_SOURCE")")

if [[ -f $TARGET_CONFIG ]]; then
    echo "Backing up existing $TARGET_CONFIG to $BACKUP_CONFIG"
    cp $TARGET_CONFIG $BACKUP_CONFIG
fi

echo "Writing new configuration to $TARGET_CONFIG"
cat << CONFIGURATION | sudo tee $TARGET_CONFIG
{ config, pkgs, ...}:

{
  imports =
    [
      ./hardware-configuration.nix
      $SCRIPT_DIR/system/common/common.nix
    ];
}
CONFIGURATION

