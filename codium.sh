#!/bin/sh
# distrobox_binary
# name: vscodium-distrobox
set -o pipefail

if [ -z "${CONTAINER_ID}" ]; then
    /usr/bin/distrobox-enter -n vscodium -- '/usr/bin/codium' --no-url-handler --enable-features=WaylandWindowDecorations --ozone-platform=wayland --class=VSCodium "$@" 2> /dev/null | grep -v '^Warning:'
    EXIT_STATUS=${PIPESTATUS[0]}
elif [ -n "${CONTAINER_ID}" ] && [ "${CONTAINER_ID}" != "vscodium-distrobox" ]; then
    distrobox-host-exec "$HOME/.local/bin/codium" --no-url-handler --enable-features=WaylandWindowDecorations --ozone-platform=wayland --class=VSCodium "$@" 2> /dev/null | grep -v '^Warning:'
    EXIT_STATUS=${PIPESTATUS[0]}
else
    '/usr/bin/codium' --no-url-handler --enable-features=WaylandWindowDecorations --ozone-platform=wayland --class=VSCodium "$@" 2> /dev/null | grep -v '^Warning:'
    EXIT_STATUS=${PIPESTATUS[0]}
fi

exit $EXIT_STATUS
