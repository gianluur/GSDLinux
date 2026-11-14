# KRunner Yafti Plugin

This is basically 50% copied from [Krunner-Bazaar](https://github.com/bazaar-org/krunner-bazaar/) and 50% vibe coded.
~~Either someone comes along and take a good look at it or I try to comprehend what is happening bit by bit before this goes on anything.~~ After a good hour of staring at the code, I feel like I have a good idea of what is going on. Any review of the code is still welcome!

I am also not sure about the ownership about the files(i.e. whether they should be left with their original owner, re-author with my name, and/or add co-authored by LLM). For now I've edited them to be under my name, but I am happy to change whatever needs to be changed.

## Installation

From Source

Requires Podman. Tested on Bazzite.
```bash
just build
just install
```
Building RPM Locally
```bash
# Build RPM package
just rpm
```
## Development

### Internationalization

Haven't gotten around to it yet.

### Release Process

Create a version tag:
```bash
just bump-version 1.x.x
```
Verify, add the appropriate tag and push the change:
```bash
just commit 1.x.x
```
GitHub Actions will hopefully automatically:

- Build the RPM packages
- Create a GitHub release
- Upload RPM artifacts with checksums

## Implementation Details

It takes a look at `/usr/share/yafti/yafti.yml`, matches it, then runs `/usr/bin/yafti_gtk.py` (or use `which` to find the location of `yafti_gtk.py` as a fallback), then if the entry is selected in krunner, run the script with the `--action-id ID` argument, with ID being the id entry of the `yafti.yml` file. This means this is also reliant on [this](https://github.com/ublue-os/yafti-gtk/pull/19)

...well, from what I understand, anyways.
