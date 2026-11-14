# How to setup nix on Fedora.

Nix has two different modes of operation:

## Daemon mode for multi-user setup

This is recommended by upstream and more seamless.
The `nix-daemon` requires functioning systemd.

Just install the `nix` package, which pulls in `nix-daemon`,
by running:
```
$ sudo dnf install nix nix-daemon
$ sudo systemctl enable --now nix-daemon
```

## Single-user mode without nix-daemon

This mode also works in rootless containers and without systemd.

Run:
```
$ sudo dnf install nix --exclude nix-daemon
$ sudo usermod -aG nixbld $USER
```
and restart your login session:
make sure the `nixbld` group appears in `id` output.

This avoids the need to run nix-daemon.

## Rootless nix store under /home

Alternatively one can run rootless nix (which uses chroots) with just:
```
$ dnf install nix-core
```
(The default user nix store is: `~/.local/share/nix/root/nix/store`.)

This also allows sharing one's nix store with toolboxes, etc.
However then nix profiles can only be used inside nix shells.

## Nixpkgs
You may want to setup a default nix channel.
```
$ nix-channel add https://nixos.org/channels/nixos-25.11 nixpkgs
```
for legacy commands, if you don't want to use rolling nixos-unstable.

## Testing

A simple way to check nix is working (with `nix-filesystem` installed) is
to run e.g. `nix-shell -p hello`.
After a while of downloading, this should put you in
a nix shell subprocess where you should be able to run `hello`.
Alternatively one can run `nix shell nixpkgs#hello`,
which works even without `nix-filesystem`.

Run `nix --help` to learn more about the nix CLI
or read <https://nix.dev/>.

## NixGL

For graphical applications that use Mesa OpenGL (or Vulkan) there is
a community maintained flake that can help with GPU config/detection.
It really requires `nix-filesystem` (/nix) for stateful non-chroot support.
This even works from within a toolbox container as one might expect.

### Default OpenGL with GPU autodetection
```
$ nix profile add nixpkgs#glmark2
$ nix run --impure github:nix-community/nixGL -- glmark2
```
(another nice example is `goxel`).
(Note this will download quite a lot: mesa is ~1.7GB.)
The `--impure` allows stateful gpu autodetection to work,
otherwise one needs to use specific outputs as explained below.

Note on the host level one can avoid add'ing (installing) the package first by running nix inside nix:

`nix run --impure github:nix-community/nixGL -- nix shell nixpkgs#goxel`

(but this requires namespaces and so will typically fail inside a container).

### Specified OpenGL variant
- Intel/AMD
  - `nix run github:nix-community/nixGL#nixGLIntel -- ...`
- Nvidia
  - `nix run github:nix-community/nixGL#nixGLNvidia -- ...`

### Vulkan support
NixGL also has some support for Vulkan.
Note that nixGL does not support GPU detection for Vulkan at this time.

After `nix profile add nixpkgs#vkcube`, use:

- Intel/AMD
  - `nix run github:nix-community/nixGL#nixVulkanIntel -- vkcube`
- Nvidia
  - `nix run github:nix-community/nixGL#nixVulkanNvidia -- vkcube`
