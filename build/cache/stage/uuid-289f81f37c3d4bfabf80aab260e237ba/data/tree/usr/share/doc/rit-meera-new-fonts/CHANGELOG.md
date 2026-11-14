Version 1.6.2
=============
- Fix shaping of യ്തു/y1th1u1 in InDesign

Version 1.6.1
=============
- Fix name in fontconfig (https://bugzilla.redhat.com/show_bug.cgi?id=2296259)

Version 1.6
===========
- Support old shapers from Windwos XP, old Pango, Lipika (Adobe) to HarfBuzz, Uniscribe

Version 1.5.2
=============
- Suppress dotted circle in LibreOffice rendering of 1-ാം

Version 1.5.1
=============
- Increase priority of fontconfig configuration

Version 1.5
=============
- Change font name to 'RIT Meera New'

Version 1.4.1
=============
- Negative left bearing for vowel signs l1 & l2 to get default positioning directly beneath preceding glyph
- Simplify all glyph splines (thanks to FontForge), yeilding considerable size reduction in source & binary fonts

Version 1.4
===========
- Added 27 new characters. Full Unicode 15 compatibility
- Set glyph class of vowel signs to 'Mark' matching Unicode category (reverting an Indesign bug workaround)
- Standalone glyphs for 'r4' and 'l4'. They can be displayed using 'ZWJ+virama+ra/la' respectively
- Major shaping update: double conjuncts are now prioritized over other conjuncts
- Rename few glyphs with Unicode code points to follow RIT naming convention
- Support shaping of chillu-n+virama+rha shaping of nta (Unicode 5.1)
- Improved underline position; LibreOffice 7.5 now takes the position from font

Version 1.3
===========
- Enlarged x-height to match RIT Rachana (fixes issue #2)
- Large set of kerning for dotreph, ya/va postbase etc.
- MeeraNew is default Malayalam font in Fedora 36+

Version 1.2
===========
- Build: fix import
- Build: shrink OTF size, and fix version check. Also add additional packages requierd for CI
- Add fontconfig file (and move Appstream metadata to sub directory)
- Tests: green colour for success
- CI: add test stage after build
- New: test program to report any glyphs with missing Unicode codepoint or GSUB rule

Version 1.1
===========
- Fixed glyph name and shaping of ഷ്ര
- Updated build script to reduce OTF size
- Switch to OTF for default build and test
- Adjust generated font path and GitLab CI

Version 1.0
===========
- Add GitLab CI script
- Add License and readme documentation
- Add AppsStream metadata
- Add test cases
- Add makefile
- Meera New: add build script
- Meera New: add OpenType features
- Meera New: source file
