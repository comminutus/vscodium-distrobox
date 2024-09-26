# vscodium-distrobox
[![AGPL License](https://img.shields.io/badge/license-AGPL-blue.svg)](https://www.gnu.org/licenses/agpl-3.0.html)
[![CI](https://github.com/comminutus/vscodium-toolbox/actions/workflows/ci.yaml/badge.svg)](https://github.com/comminutus/vscodium-toolbox/actions/workflows/ci.yaml)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/comminutus/vscodium-toolbox)](https://github.com/comminutus/vscodium-toolbox/releases/latest)


## Description
This is a container image tailored for using [VSCodium](https://github.com/89luca89/distrobox) inside a [Distrobox](https://github.com/89luca89/distrobox) container environment. It also installs some tooling for use with common extensions.


## Getting Started
```
distrobox create -i ghcr.io/comminutus/vscodium-distrobox vscodium-distrobox
distrobox enter vscodium-distrobox
codium
```
_or yolo_

```
curl https://raw.githubusercontent.com/comminutus/vscodium-distrobox/master/create-distrobox.bash | bash

```

## Usage
You can integrate the containerized VSCodium into your host environment by running:
```
# Enter the distrobox container environment
distrobox enter vscodium-toolbox

# From within the container environment
distrobox-export --app codium
distrobox-export --bin /usr/bin/codium
```

This will give you a few `.desktop` files installed on your host, as well as a `codium` executable script for use in shells.  There are a few tweaks you can make to this script to ensure VSCodium launches remembering it's last window size and position, as well as silencing the odd warnings that occur because as a consequence of fixing the window size and position.  An example of this can be found in [`codium.sh`](codium.sh).

The [`create-distrobox.bash`](create-distrobox.bash) script does all of this for you.

## License
The container image portion of this project is licensed under the GNU Affero General Public License v3.0 - see the
[LICENSE](LICENSE) file for details.
