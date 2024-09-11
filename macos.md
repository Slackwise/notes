---
date: 2024-09-11
published: true
categories: notes
tags:
  - operatingsystems
  - apple
  - software
---

macOS (osx)
===================


Services
--------
When creating a background service, you can and *should* [create a "role account"][RA] via `sysadminctl -roleAction`.

Role accounts require name starting with `_` and UID in 200-400 range.


[RA]: https://forums.developer.apple.com/forums/thread/692593 "Apple engineer answering that services should use 'role accounts'"