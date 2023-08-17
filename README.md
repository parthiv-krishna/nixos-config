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

# Run the setup script. Replace HOST with one of the hosts in system/hosts
cd nixos-config
./setup.sh HOST
```

As long as all additional configuration changes are made or imported into
`hosts/HOST.nix`, it should automatically be detected by `nixos-rebuild`.
