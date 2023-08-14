# nixos-config
Files and scripts for my NixOS configuration

## Setup
```bash
# Launch a nix-shell with git
nix-shell -p git

# Recommended, but not required, location for the repo
cd ~

# Option 1: SSH (will need to generate and setup an SSH key for GitHub)
git clone git@github.com:parthiv-krishna/nixos-config
# Option 2: HTTPS (should 'just work')
git clone https://github.com/parthiv-krishna/nixos-config

# Run the setup
cd nixos-config
./setup.sh
```
