set name (buildah from fedora)

buildah run $name dnf -y install bash btrfs-progs dialog git gawk libarchive openssl parted polkit qemu-user-static rsync systemd-container wget

buildah run $name git clone https://github.com/bengtfredh/pinebook-pro-fedora-installer.git /root/pinebook-pro-fedora-installer

buildah config --entrypoint "/usr/bin/bash /root/pinebook-pro-fedora-installer/fedora-installer" $name

buildah commit $name pinebook-pro-fedora-installer

buildah rm $name
