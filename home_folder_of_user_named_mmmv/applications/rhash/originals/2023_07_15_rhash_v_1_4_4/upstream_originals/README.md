# Release notes

* rhash-1.4.4-win64.zip  - 64-bit Windows version.
* rhash-1.4.4-win32.zip  - 32-bit Windows version.
* rhash-1.4.4-win64-english.zip - 64-bit Windows english-only version.
* rhash-1.4.4-win32-english.zip - 32-bit Windows english-only version.
* rhash-1.4.4-src.tar.gz - source code (RHash + LibRHash library + Bindings).
* librhash-1.4.4-win.zip - LibRHash DLL for win32/win64.
* https://github.com/rhash/RHash/ - browsable GIT source tree.

## System requirements

* The Win32 version requires: Win XP/2K/Vista/7/8/10.
* The Win64 version requires: Win 8/10  64-bit.
* The source code build requirements:
    - GCC, Clang or Intel Compiler for Linux / macOS / Unix.
    - MinGW or MS VC++ 10 for Windows.
    - (optionally) gettext library for internationalization.
    - (optionally) OpenSSL for optimized algorithms.

## RHash program

RHash  (Recursive  Hasher)   is  a  console  utility  for   calculation and
verification of magnet links and various message digests, including CRC32,
CRC32C, MD4, MD5, SHA1, SHA256, SHA512, SHA3, Tiger, DC++ TTH, BTIH, AICH,
ED2K, GOST R 34.11\-\*, RIPEMD\-160, HAS\-160, BLAKE2s/BLAKE2b, EDON-R, and
Whirlpool.

Message digests are used to ensure and verify integrity  of large volumes of
data for a long-term storing or transferring.

### Program features:
 * Ability to process directories recursively.
 * Output in a predefined (SFV, BSD-like) or a user-defined format.
 * Calculation of Magnet links.
 * Updating hash files (adding message digests of files missing in the hash file).
 * Calculates several message digests in one pass.
 * Portability: the program works the same on Linux, Unix, macOS or Windows.

## The LibRHash library

**LibRHash** is a professional, portable, thread-safe *C* library for computing
a wide variety of  hash functions,  including CRC32, CRC32C, MD4, MD5, SHA1,
SHA256,  SHA512,  SHA3,   AICH,  ED2K,   DC++ TTH,  BitTorrent BTIH,  Tiger,
GOST R 34.11-94,  GOST R 34.11-2012,   RIPEMD-160,  HAS-160,   EDON-R,   and
Whirlpool.

###Features:
 * Small and easy to learn interface.
 * Hi-level and Low-level API.
 * Calculates several hash functions simultaneously in one pass.
 * Extremely portable: works the same on Linux, Unix, macOS or Windows.
 * Written in pure C, small in size, open source.

## Links
* Project Home Page: http://rhash.sourceforge.net/
* Official Releases: https://github.com/rhash/RHash/releases/
* Bynary Windows Releases: https://sf.net/projects/rhash/files/rhash/
* The table of the supported by RHash [hash functions](http://sf.net/p/rhash/wiki/HashFunctions/)

## Getting latest source code

The latest source code can be obtained from Git repository using command:

```
git clone git://github.com/rhash/RHash.git
```

## Notes on RHash License

The code is distributed under [BSD Zero Clause License].

[BSD Zero Clause License]: https://github.com/rhash/RHash/blob/master/COPYING
