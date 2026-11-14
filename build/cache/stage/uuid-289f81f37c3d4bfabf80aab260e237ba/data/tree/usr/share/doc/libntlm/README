# Libntlm README -- Introduction information

Libntlm is a client-side Microsoft NTLM authentication library.

References for the NTLM protocol are:

 * [The NTLM Authentication Protocol](https://davenport.sourceforge.net/ntlm.html), by Eric Glass.
 * [NTLM Authentication Scheme for HTTP](https://web.archive.org/web/20210126065105/http://www.innovation.ch/personal/ronald/ntlm.html), by Ronald Tschalär.

*Warning!* NTLM is not a secure authentication protocol -- it uses MD4
and single-DES.  MD4 has been broken, and single-DES have a too small
key size to be considered secure against brute-force attacks.  You
should only use Libntlm for interoperability purposes, not to achieve
any kind of security.

# License

Libntlm is licensed under the GNU Lesser General Public License
version 2.1 or (at your option) any later version, see
[COPYING](COPYING).

This code was initially taken mostly from the Samba project and was
initially intended for use with Microsoft Exchange Server when it is
configured to require NTLM authentication for clients of it's IMAP
server.  Today, libntlm contain re-written code, so that the license
is now LGPLv2+ instead of the GPL that would be inherited from the
Samba files.

# Support

The [Libntlm project page at GitLab](https://gitlab.com/gsasl/libntlm)
provides git repository, issue tracker, CI/CD and more.

The [Libntlm project page at
Savannah](https://savannah.nongnu.org/projects/libntlm/) manages the
tarball distribution and the mailing list.

If you want to discuss something related to Libntlm we have a [mailing
list](https://lists.nongnu.org/mailman/listinfo/libntlm) reachable at
libntlm@nongnu.org.  Old discussions are available from the [Libntlm
mailing list archive](https://lists.nongnu.org/archive/html/libntlm/).

# History

The old libntlm (note lower case) was a library that implement
Microsoft's NTLM authentication. However, the packaging of libntlm
lacked certain things, such as having build problems, lacking shared
library support, lacking autoconf macro for use in other applications,
lacking pkg-config support, and more. So this page distributes an
improved version of the library; called Libntlm (note upper case L to
differentiate it from the original libntlm). Compared to the original
releases, the current version has been entirely re-written and only
shares the same function interfaces.

See [NEWS](NEWS) for more detailed release information, however brief
updates related to the project are here:

 * 2024-04-13: Version 1.8 released. Reproducible tarball.
 * 2023-12-31: Version 1.7 released. Maintainance fixes.
 * 2020-04-19: Version 1.6 released. Security bugfix for buffer overflow. CVE-2019-17455.
 * 2018-08-24: Version 1.5 released. LTO/gcc8 support. Git repository moved to GitLab.
 * 2013-07-08: Version 1.4 released. Build fixes.
 * 2011-06-20: Version 1.3 released. Proving the project is still alive.
 * 2009-11-06: Version 1.2 released. Fixes MinGW cross-compile bug.
 * 2009-05-08: Version 1.1 released. No significant changes.
 * 2008-04-12: Version 1.0 released. Declared stable.
 * 2008-03-05: Version 0.4.2 released. Portability fixes for big-endian platforms.
 * 2008-03-05: Development (source code and web pages) moved to savannah.
 * 2007-10-29: Version 0.4.1 released. Maintainance release.
 * 2007-09-23: Version 0.4.0 released. Gnulib files updated, only public API is exported in shared library. Approaching a stable v1.0.
 * 2007-09-23: Developed in Git instead of CVS.
 * 2007-03-27: Version 0.3.13 released. Minor portability fixes, by updating from gnulib.
 * 2006-06-24: Version 0.3.12 released. Minor portability fixes, by updating from gnulib.
 * 2006-05-16: Version 0.3.11 released. Now works on 64-bit platforms.
 * 2006-03-24: Version 0.3.10 released. Exports the ntlm_smb_encrypt and ntlm_smb_nt_encrypt APIs.
 * 2005-10-23: Version 0.3.9 released. The DES and MD4 functions are now shared with gnulib, to simplify maintenance.
 * 2005-09-27: Version 0.3.8 released. APIs to build requests/responses for usernames with @ in them (earlier an @ was used to separate the username from the realm). Build fixes.
 * 2005-07-15: Version 0.3.7 released. A spec file was added. Compiler warnings fixed, thanks to Frediano Ziglio. Gnulib is used, currently only for a more robust ntlm_check_version.
 * 2004-09-30: Version 0.3.6 released. Various cleanups, thanks to Frediano Ziglio.
 * 2004-09-23: Version 0.3.5 released. Ported to many platforms.
 * 2004-09-23: Version 0.3.4 released. License changed to LGPL, thanks to rewrites by Frediano Ziglio.
 * 2004-09-18: Version 0.3.3 released. Use of 'const' in function prototypes. Source code indented according to GNU Coding Standard.
 * 2003-03-17: Version 0.3.2 released. Only build changes.
 * 2002-10-17: Version 0.3.1 released. No code changes, but uses automake 1.7, gnits and pkg-config.
 * 2002-10-04: Anonymous CVS is available via pserver.
 * 2002-10-01: Version 0.3.0 released. No code changes compared to the last official 0.21 release.

# Download

Tarball releases are available from
[https://download.savannah.nongnu.org/releases/libntlm/](https://download.savannah.nongnu.org/releases/libntlm/).

The tarballs are signed with [Simon Josefsson's OpenPGP
key](https://josefsson.org/key-20190320.txt):

```
ed25519 2019-03-20 [SC] Simon Josefsson <simon@josefsson.org>
B1D2 BD13 75BE CB78 4CF4  F8C4 D73C F638 C53C 06BE
```

Older releases are signed with [Simon Josefsson's OpenPGP key with
fingerprint B565716F](https://josefsson.org/key.txt) or [Simon
Josefsson's OpenPGP key with fingerprint
54265E8C](https://josefsson.org/54265e8c.txt).

# Building

Build instructions are in [INSTALL](INSTALL).  Typically, the
following is sufficient:

```
./configure
make
make check
sudo make install
```

# Development

Clone the source code and bootstrap it as follows:

```
git clone https://gitlab.com/gsasl/libntlm.git
cd libntlm
./bootstrap
```

Then build it as usual.  See [CONTRIBUTING.md](CONTRIBUTING.md) for
more information.

# Usage

The application program must convert these structures to/from base64
which is used to transfer data for IMAP authentication.  For example
usage see the sources for the mutt MUA or the fetchmail package.

In general the usage is something like shown below (no, I don't know
if this code even compiles, but you get the idea hopefully):

```
#include <ntlm.h>

extern char *seqTag;  /* IMAP sequence number */

int imap_auth_ntlm(char *user, char *domain, char *pass)
{
  tSmbNtlmAuthRequest   request;
  tSmbNtlmAuthChallenge challenge;
  tSmbNtlmAuthResponse  response;
  char buffer[512];
  char tmpstr[32];

  writeToServer("%s AUTHENTICATE NTLM\r\n",seqTag);
  readFromServer(buffer)

  /* buffer should be "+", but we won't show code to check */

  /*
   * prepare the request, convert to base64, and send it to
   * the server.  My server didn't care about domain, and NULL
   * worked fine.
   */

  buildSmbNtlmAuthRequest(&request,user,domain);
  convertToBase64(buffer, &request, SmbLength(&request));
  writeToServer("%s\r\n",buffer);

  /* read challange data from server, convert from base64 */

  readFromServer(buffer);

  /* buffer should contain the string "+ [base 64 data]" */

  convertFromBase64(&challenge, buffer+2);

  /* prepare response, convert to base64, send to server */

  buildSmbNtlmAuthResponse(&challenge, &response, user, pass);
  convertToBase64(buffer,&response,SmbLength(&response));
  writeToServer("%s\r\n",buffer);

  /* read line from server, it should be "[seq] OK blah blah blah" */

  readFromServer(buffer);

  sprintf(tmpstr,"%s OK",seqTag);

  if (strncmp(buffer,tmpstr,strlen(tmpstr)))
  {
    /* login failed */
    return -1;
  }

  return 0;
}
```

----------------------------------------------------------------------
```
Copyright (C) 2002-2024 Simon Josefsson
Copyright (C) 1999 Grant Edwards
Copying and distribution of this file, with or without modification,
are permitted in any medium without royalty provided the copyright
notice and this notice are preserved.
```
