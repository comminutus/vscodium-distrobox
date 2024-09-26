FROM registry.fedoraproject.org/fedora-toolbox:40

RUN dnf update -y

WORKDIR /root

# Install missing Distrobox packages
COPY install-packages.bash .
RUN chmod +x ./install-packages.bash && ./install-packages.bash && rm ./install-packages.bash &&    \
                                                                                                    \
# Setup xdg-open to run on the host                                                                 \
    rm /usr/bin/xdg-open &&                                                                         \
    ln -s /usr/bin/host-spawn   /usr/bin/xdg-open
