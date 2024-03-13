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


Guix
====

Name Origin
-----------
The name "Guix" comes from [an homage to both Guile and Nix][origin], and is meant to be pronounced as "geeks". Obviously, Guix uses Guile, and was inspired by Nix, and originally used the `nix-worker` daemon.

[origin]: https://guix.gnu.org/en/blog/2022/10-years-of-stories-behind-guix/


Glossary
--------
[Channel](https://guix.gnu.org/manual/en/html_node/Channels.html): A repository of packages to mix into the official repository, similar to a "repository" in Debian/dpkg terminology.

[Profile](https://guix.gnu.org/cookbook/en/html_node/Guix-Profiles-in-Practice.html): A collection of packages representing an environment. Basically a `$PATH` that has specific packages associated with it. A user can have any number of profiles, and can also create development-only profiles via [Guix Shell](#guix-shell).

[Substitute](https://guix.gnu.org/manual/en/html_node/Substitutes.html): A binary package (usually) that replaces a locally compiled package.

Guix Package Manager on Other Distros
-------------------------------------
You can install Guix as another package manager on other systems like Debian and Ubuntu. This allows you to include packages that their repositories often lack, or have an outdated version for.

### Avoiding Issues
When you do install Guix on another distro, there are a few dependencies you should keep in mind: https://guix.gnu.org/manual/en/html_node/Application-Setup.html

Rolling Back
------------
> After having rolled back, installing, removing, or upgrading packages overwrites previous future generations. Thus, the history of the generations in a profile is always linear.

-- https://guix.gnu.org/manual/en/html_node/Invoking-guix-package.html#index-rolling-back


Guix Shell
----------
Similar to [[Ruby]]'s `RVM` or [[Python]]'s `venv`, except with [Guix Shell] you can create an entire system environment for development, local to that software project.

[Guix Shell]: https://guix.gnu.org/manual/en/html_node/Invoking-guix-shell.html

Common Actions
--------------
The Guix developers provide a [Cookbook] of common actions/solutions as well.

[Cookbook]: https://guix.gnu.org/cookbook/en/html_node/


### List (Explicitly) Installed Packages

If you want to see what packages the current user has explicitly installed via `guix install`, then `guix package --list-installed` will list those packages. This will not list the dependencies of those packages, because that would be literally *all* the packages and that's often not useful information.


### Export Profile Packages

If you want to generate a file that can be used to rebuild a profile's packages/environment, then `guix package --export-manifest` will export a Guile script. The following is an example manifest file for my WSL Doom Emacs config, with notable comments at the top:

```lisp
;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "ripgrep"
        "emacs-org-roam"
        "emacs"
        "emacs-sqlite"
        "emacs-all-the-icons"))
```
