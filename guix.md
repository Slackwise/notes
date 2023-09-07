Guix
====

Common Actions
--------------

### List (Explicitly) Installed Packages:

If you want to see what packages the current user has explicitly installed via `guix install`, then `guix package --list-installed` will list those packages. This will not list the dependencies of those packages, because that would be literally *all* the packages and that's often not useful information.


### Export Profile Packages:

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