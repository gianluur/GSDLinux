Version 1.5.2
====================
- Fix shaping of യ്യു, വ്വു with Lipika (https://gitlab.com/rit-fonts/RIT-Rachana/-/issues/27)

Version 1.5.1
=============
- Fix shaping of യ്തു/y1th1u1 in InDesign

Version 1.5.0
=============
- Malayalam OpenType feature: include 'mylm' (v1 spec) also into font, supports Kobo ebook reader
- Workaround InDesign 2020 placing 'mark' OT glyphs outside margins
- Improve shaping support for Lipika shaper (InDesign 2020 etc.)
- Split common lookups into a new file and include it in both mlm2 & mlym features
- MLM2 GSUB: descriptive names for lookups
- New Make target 'newversion' that updates version & copyright, prepares changelog and on confirmation creates new tag
- Script to update version & copyright year on SFD sources

Version 1.4.7
=============
- Set StyleMap on all variants manually, added space in SubFamily of 'Bold Italic'

Version 1.4.6
=============
- Suppress dotted circle in LibreOffice rendering of 1-ാം

Version 1.4.5
=============
- Increase left margin of all punctuation symbols; reported by Barbara Beeton & Karl Berry
- Bold/BoldItalic: lowercase i - was not visible as strokes were not joined at the bottom

Version 1.4.4
=============
- Added dotted circle (U+25CC) and NBSP (U+00A0) characters

Version 1.4.3
=============
- Fix curves deformed on FontForge's auto-simplication in a few glyphs (notable below-base k1k1u2 and ch3ch3u2); removed background image in u1

Version 1.4.2
=============
- Regression fix #24: revert Bold sources to original to fix artefacts in automatic glyph simplifying
- Improve kerning of 'ബ്ജ്യ' p3ch3

Version 1.4.1
=============
- Added കൣ (k1l2) glyph and shaping rule for it (issue #22)
- Negative left bearing for vowel signs l1 & l2 to get default positioning directly beneath preceding glyph
- Corrected baseline of 0D4F (issue #21)
- Simplify all glyph splines (thanks to FontForge), yeilding considerable size reduction in source & binary fonts

Version 1.4
=============
- Add 0D04 vedic anusvara character. Full Unicode 15 compatibility.
- Set glyph class of vowel signs to 'Mark' matching Unicode category (reverting an Indesign bug workaround)
- Standalone glyphs for 'r4' and 'l4'. They can be displayed using 'ZWJ+virama+ra/la' respectively
- Major shaping update: double conjuncts are now prioritized over other conjuncts
- Improved design of oldstye figures 0, 1, 2
- Support shaping of chillu-n+virama+rha shaping of nta (Unicode 5.1)
- Improved underline position; LibreOffice 7.5 now takes the position from font

Version 1.3.1
=============
- Correct the glyph shape of y1k1k1u1 (യ്ക്കു) in Italic variant

Version 1.3
===========
- Fix PS/TTF name of Regular variant (remove 'Regular', just keep family name)
- Tests: specify Bold, Italic & BoldItalic styles in fontspec
- Add fontconfig rules
- AppStream metadata: license MIT
- Meta files: move to separate directory and adapt makefile
- Remove stray glyph 'nine.old' identified by test script
- Build: fix major version comparison
- Update copyright year
- Test module: use terminal colours for success/warning
- Test: New test program to report any glyphs with missing Unicode codepoint or GSUB rule
- Build script: use CFF subroutinizer to reduce OTF size even further. Adds 2 build requirements: python3-fonttols, python3-cffsubr.

Version 1.2
===========
- Redesigned കു glyphs for legibility
- Makefile: update test target to use OTF, add new target for PDF and adjust the TeX file
- Makefile: define build/fonts directory and build different font types into subdirectories and adjust release/beta targets for clean artifacts
- [MAJOR] Rewritten Malayalam shaping rules: form post-base u1/u2 forms of Ra, below-base La first and then the rest of the conjuncts. This fixes a large chunk of issues with limited character set fonts - they now form Ra forms consistently
- Enable and use OTF files, now that size issue is resolved
- [FIX] Generated OTF size
- Shaping test: add ya, va combinations
- Kerning for Latin glyphs, adapted from TeX Gyre Schola
- Beta version 61
- [FIX] wire up ZWJ chillus of മ, യ, ഴ
- Shaping test: add specific dot reph characters in the definitive character set for Malayalam traditional orthography
- AppStream metadata: set license to CC-BY-SA

Version 1.1
===========
- [FIX #17] Add circumflex glyphs
- [FIX #17] Redesigned anusvaraabove glyphs
- Tests: add valid dot reph combinations
- [FIX #17] Redesign Malayalam Chandrabindu U+0D01 glyph
- [FIX] mlm2 OpenType feature: fix shaping involving double consontants such as ക്ട്ട where ട്ട shouldn't break.
- [FIX] Remove opentype lookup from SFD files
- [FIX #16] Proper oldstyle figures. Glyphs adapted from TeXGyre Schola
- [FIX #15] Move glyphs of Ring and Tilde to their correct code points
- Rearrange characters grouped by Unicode codepoints in SFD. No functional change expected
- [FIX #13] Set Unicode glyph class of verticalbarvirama, circularvirama & dotreph to ‘Mark’ and all vowel signs to ‘Base Glyph’ (to work around InDesign shaping issues, even though correct Unicode category of Malayalam vowel signs is ‘Mark’)

Version 1.0
===========
- Add license file
- Add thanks and credit to GUST for TeX Gyre Schola Latin glyphs
- Add initial documentation
- Generate tar.xz archive for source distribution
- Beta: generate ttf and woff2
- Add a 'dist' target to generate source archive
- export VERSION to build beta versions as well
- Kerning: fix kerning of ക്സ്യു
- Beta version 60: Characters in Unicode 13 added, and some glyph shapes corrected (archaic_ii, datemark, etc.)
- [FIX #5] Regular - redesigned few fractions and numbers and archaic_ii etc.
- [FEAT #1 & #5] Unicode 13. Add rupee symbol, chillu of മ, യ, ഴ , para sign and 8 fractions
- Beta version 59: fixes few kerning pairs
- Fix kerning of l3p2y2 (ല്ഫ്യ)
- Fix kerning of s1s1r3y2 (സ്സ്ര്യ)
- Kerning tests: add few more pairs
- Revert "Bold Italic: change the Style name to 'BoldItalic' as we now look for last space to identify the Style"
- Build script: properly identify the style variant name (from a list of standard styles). Required because 'Bold Italic' is the correct style name, not 'BoldItalic'
- Appstream data: minor change
- Beta version 58. Fixes few kerning pairs
- Bold: fix kerning of sht1y2 (ഷ്ട്യ) and adjust kerning of സ്ത്ര്യ, സ്സ്ര്യ
- Regular: fix kerning of sht1y2 (ഷ്ട്യ) and vowel combinations
- Beta version 57. Fixes some kerning, and proper PostScript font naming
- Font names: Follow the PostScript font naming standard when generating beta version also.
- Bold Italic: change the Style name to 'BoldItalic' as we now look for last space to identify the Style
- GPOS: adjust kerning of many conjuncts and y2[u1,u2]; and add kerning for പ്പ്യ (p1p1y2)
- GPOS: fix kerning of പ്പ്യ (p1p1y2) and vowel combinations
- Build: Separate version in PostScript FontName and FullName with hyphen and space respectively
- Beta version 56
- [FIX #10] Increase kerning for ബ്ല്യ  ബ്ല്യു  ബ്ല്യൂ
- Include appstream metadata in release zip
- Appstream data for RI Rachana - Regular, Italic, Bold and BoldItalic
- Beta version 55. Create zip of beta release also
- [FIX #6] Positioning of dotreph in Bold variants -- right bearing removed and placed -700 and -400 left of right bearing
- GitLab CI support
- Makefile: refactor beta and release targets. Also license build scripts under GPLv3. The 'release' target now builds TTF and WOFF2, and creates archive with name 'Font-Family-version.zip'
- New beta release 54
- FIX removing kerning for v1 from another rule
- FIX: remove kerning involving v1 (വ). Only v2 form needs kerning.
- GPOS abvm feature -- hook up the lookup with corresponding OpenType feature
- OldStyle figures -- hook up the lookup with corresponding OpenType feature
- Beta release 53
- Features: OldStyle figures for Regular, Bold, Italic & BoldItalic
- Bold, BoldItalic: remove unused glyphs, and GSUB embedded in SFD
- Italic: remove unused glyphs, and GSUB embedded in SFD
- Features: OldStyle figures/numbers
- Shaping test: add കൢ  (k1l1) conjunct
- Regular: remove unused glyphs, and GSUB embedded in SFD
- Shaping test: add single character matra forms
- Tests: add missing test for conjuct p1th1r2 പ്തൄ
- Shaping fix: wire-up p1th1r2, k1l1 conjuncts and u-matra forms of nj
- Beta release 52
- Improve kerning for 'nta' and its vowel forms with chandrakala/xx'
- Add a kerning test for 'nta' and its vowel forms with chandrakala/xx'
- Update shaping test case with ഷ്ട്ര ഷ്ട്രു ഷ്ട്രൂ
- New beta release 51
- FIX: shaping of ഷ്ട്ര ഷ്ട്രു ഷ്ട്രൂ
- Increase beta release to 50. Mostly kerning fixes
- Kerning for Italic -- use same as Regular
- Kerning for BoldItalic -- use same as Bold
- Kerning for Bold -- fix glyph name s1th1r3
- Kerning updates for RIT Rachana Bold
- Kerning corrections for RIT Rachana Regular
- Test file for kerning. Author: Hussain KH
- Makefile: skip the 'test' target parameter to avoid 'no rule to make kerning target' error
- Makefile: Test 'shaping' and 'kerning' using 'make test shaping' and 'make test kerning'. 'make test' defaults to 'shaping'
- Makefile: adapt targets for ttf/otf/woff/woff2 to reuse the 'fbuild' target
- Makefile: use the build targets beta or release to generate the TTF. Version string is set by variable
- Build script: take font version string as parameter. If it is more than 10, treat as beta version
- Italic: Reduced italic angle (internal version 49)
- Italic: Reduced italic angle (internal version 49)
- Bold: Increased stroke width (internal version 49)
- Regular: some glyphs reworked (internal version 49)
- Makefile: parameterize python interpreter. Requires Python3
- Makefile to automate font building and testing. Every font should follow the naming: <FontName>-{Regular,Italic,Bold,BoldItalic} etc. and their corresponding feature file should be named {regular,italic,bold,bolditalic}.fea
- Test files to check the shaping
- Build script to generate TTF/OTF/WOFF2 combining SFD file and FEA files; using FontForge
- Feature files and GPOS rules per font style/variant
- Malayalam OpenType features (mlm2): Completely from-the-scratch shaping rules for traditional orthography fonts
- RIT Rachana: Regular, Bold, Italic and BoldItalic SFD files
