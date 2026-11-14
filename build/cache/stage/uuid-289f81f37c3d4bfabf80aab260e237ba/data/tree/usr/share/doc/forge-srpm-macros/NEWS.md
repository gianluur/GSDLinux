<!--
Copyright (C) 2023 Maxwell G <maxwell@gtmx.me>
SPDX-License-Identifier: GPL-1.0-or-later
-->

NEWS
========

## 0.4.0 - 2024-09-27 <a id='0.4.0'></a>

### Added

- Add support for go.googlesource.com forge

## 0.3.2 - 2024-08-07 <a id='0.3.2'></a>

### Removed

- `forgeversion`: entirely remove warning when `Version:` is set after `Release:`.
  This started causing false positives and confusing users.

## 0.3.1 - 2024-04-10 <a id='0.3.1'></a>

- `forgeversion`: make `Version:` set after `Release:` a warning instead of an
  error to make parsing more resilient

## 0.3.0 - 2024-03-02 <a id='0.3.0'></a>

### Added

- **all: restore compatibility with RPM 4.16 and support EPEL 9**
- packaging: make the RPM noarch. The package does not contain any compiled
  code.

## 0.2.0 - 2023-12-07 <a id='0.2.0'></a>

### Added

- Allow specifying a custom forge scheme

## 0.1.0 - 2023-09-04 <a id='0.1.0'></a>

### Added

- add `-b` flag to `%forgeversion` to override base package version.

### Changed

- `%forgeversion`: use `%version0` instead of `%version` as the base package
  version.
  See the [FPC discussion][FPC discussion] for more context.

[FPC discussion]: https://pagure.io/packaging-committee/pull-request/1295

## 0.0.1 - 2023-08-13 <a id='0.0.1'></a>

Initial release

### Added

- add support for Codeberg
- allow unlimited subgroups in GitLab URLs
- forge.lua: fix syntax error for pagure_ns_fork
- forge.lua: add missing archiveext for pagure_ns_fork
- add %forgeversion to add snapshot info to Version
- add extensive test vectors

### Changed

- Set minimum supported Fedora/RPM version to 37/4.18

