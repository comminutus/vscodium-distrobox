#!/usr/bin/env bash
set -euo pipefail

this_dir="$(dirname "$(realpath "$0")")"
image=ghcr.io/comminutus/vscodium-distrobox
name=vscodium
codium_bin_path="$HOME/.local/bin/codium"
codium_bin_url=https://raw.githubusercontent.com/comminutus/vscodium-distrobox/master/codium.sh


distrobox create -p -i "$image" "$name"
distrobox enter --name "$name" -- distrobox-export --app codium
distrobox enter --name "$name" -- distrobox-export --bin /usr/bin/codium

# Copy codium script to .local/bin 
rm "$codium_bin_path"

if [ -f "$this_dir/codium.sh" ]; then
    cp "$this_dir/codium.sh" "$codium_bin_path"
else
    curl -o "$codium_bin_path" "$codium_bin_url"
fi

chmod +x "$codium_bin_path"

