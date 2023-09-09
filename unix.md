---
date: 2023-09-08
published: true
categories: notes
tags:
  - software
  - operatingsystems
  - unix
  - linux
---

Unix
===================
This page will document **Unix history**, and **POSIX** knowledge for working with [[Linux]], [[BSD]], [[macOS]], and others.

POSIX
-----
[POSIX] is a documented set of features and behaviors that all "UNIX" systems are supposed to comply with in order for various software/tools to be cross-compatible.

[POSIX]: https://en.wikipedia.org/wiki/POSIX

Shells
------
A shell is just the way you interact with an operating system, but usually when we talk about a "shell", it's in the context of command-line processing shells like [[bash]], csh, tcsh, zsh, fish, and others. POSIX.


### The POSIX Shell: `sh`
Bash as well as other shells will be some level POSIX compliant, either by default, via flags, configs, or when invoked with the name (`argv` 0) of `sh`.


### Login vs Non-Login Shell
Simply put, a user has a single "login" shell instance, which is the shell they *logged in* with. This includes when you [[ssh]] into another machine.

When a POSIX login shell is executed, it will `source` the system-wide `/etc/profile` config file, followed by the logging-in user's `~/.profile`.

(Note that Bash will read more files, documented on the [[Bash]] page.)


### Interactive vs Non-Interactive Shell
An interactive shell is one that allows a user to *interact* with it. A non-interactive shell is any shell that is not user facing, such as a sub-shell in a script, or invoked by a program.

Some shells will execute scripts for an interactive but **not** a login shell. This is shell dependent, but is not a POSIX standard.

Bash will `source` the system-wide `/etc/bash.bashrc` config file first, followed by the invoking user's `~/.bashrc`.