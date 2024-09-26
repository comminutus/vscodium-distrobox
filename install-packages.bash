#!/bin/bash
set -euo pipefail

sudo tee -a /etc/yum.repos.d/vscodium.repo << 'EOF'
[gitlab.com_paulcarroty_vscodium_repo]
name=gitlab.com_paulcarroty_vscodium_repo
baseurl=https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/rpms/
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg
metadata_expire=1h
EOF

dev_packages=(
    ansible
    ansible-lint
    codium
    diffutils
    direnv
    gettext
    hadolint
    helm
    kubernetes-client
    make
    pass
)

distrobox_packages=(
   gnupg2
   pinentry
   zip
)

distrobox_dependencies=(
    bc
    bzip2
    chpasswd
    curl
    diff
    find
    findmnt
    gpg
    hostname
    less
    lsof
    man
    mount
    passwd
    pigz
    pinentry
    ping
    ps
    rsync
    script
    ssh
    sudo
    time
    tree
    umount
    unzip
    useradd
    wc
    wget
    xauth
    zip
)

all_packages=("${dev_packages[@]}" "${distrobox_packages[@]}")

dnf update -y
dnf install -y "${all_packages[@]}"


# Check for mising dependencies
dependency_missing=false
for dependency in "${distrobox_dependencies[@]}"; do
    if ! command -v "${dependency}" > /dev/null; then
        echo "Error: missing dependency: $dependency"
        dependency_missing=true
    fi
done

if [ "$dependency_missing" = true ]; then
    exit 1;
fi

# Install FluxCD
curl -s https://fluxcd.io/install.sh | bash

dnf clean all

