---
date: 2023-09-08
published: true
categories: notes
tags:
  - software
  - unix
  - linux
---


Emacs
=====


Finding Documentation
---------------------

(Write out a list of all functions to find documentation and keybinds.)


Debugging
---------

You can jump into the debugger on error by using `(setq debug-on-error t)`, which you can just slot right into a function you're debugging.


Changing Behavior of Emacs or Packages
--------------------------------------

You have several options, from best to worst in terms of long-term maintenance:

-   Customize Variables
-   Event Hooks
-   Advice Functions
-   Overwrite Functions (Use `with-eval-after-load`!)


# Setting up Org-Roam

-   Depends on sqlite:
    -   Locate sqlite on your system and configure emacsql via `(setq emacsql-sqlite-executable "path/to/sqlite")`
    -   Or install GCC/make/etc build tools to let it compile sqlite
-   Install `build-essential` on Ubuntu.


Doom Emacs
----------

-   Keeps compiled packages in `./src/doomemacs/.local/`.
-   Keeps cache data in `./src/doomemacs/.local/cache/`.
-   For GNU Guix, Install the following packages:
    -   `ispell`
    -   `emacs-emacsql-sqlite3`
    -   `emacs-all-the-icons`
    -   `fd`
    -   `ripgrep`


ibuffer-mode
------------

Used for managing Emacs buffers. Bound to `SPC b i` in Doom by default.


### Commands

-   `d` to "Delete" (kill) a buffer
-   `x` to eXecute deletions (kills) of buffers marked with `D`
