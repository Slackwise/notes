---
date: 2023-09-07
published: true
categories: notes
tags:
  - development
  - software
---

Git
===================
The version control system (VCS), if you somehow aren't familiar.

First created by Linus Torvalds for the [[Linux]] Kernel project, now the most popular VCS in the world.


Git LFS
-------
A plugin for Git that stores *designated* large files externally, so that the repository itself doesn't get too large or slow to work with.

With LFS, you need to explicitly "track" files using `git lfs track <pattern>`, otherwise they will be treated like all other files. This pattern is often an **extension** like `.*.pdf`.