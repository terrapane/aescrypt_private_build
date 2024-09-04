Private Build
=============

This container is used to create a private build of AES Crypt.  One may build
either the desktop (GUI) or command-line (CLI) version.

# Creating the build container

To create the build container, run the following command from the root directory
of this repository directory:

```
docker build -t aescrypt_private_build .
```

# Create release packages

Run the script `./private_build` script using a format like the following:

```
./private_build https://github.com/terrapane/aescrypt_linux.git
./private_build https://github.com/terrapane/aescrypt_cli.git
```

The first is for building the desktop (GUI) release, while the second
if for building the command-line (CLI) version.

The above would create a `build/` directory in the current directory containing
the release packages.  They would be located in `build/<repo>/build/`.
There, you would find a .rpm, .dep, and .tgz package file.

If running the software on an older system, it might be necessary to statically
link to libc and libstdc++.  Official releases are *not* statically linked, as
that would invoke a dependency on LGPL.  However, the following would create
statically-linked binaries that are more portable (albiet larger).

```
./private_build -s https://github.com/terrapane/aescrypt_linux.git
./private_build -s https://github.com/terrapane/aescrypt_cli.git
```

