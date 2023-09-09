Bash
====
The most popular Unix/Linux shell in use, and the default for most Linux distributions. This document will include history, configuration, tips, and tricks.


Configuation Files
------------------
Bash, when run as a POSIX ([[Unix]]) shell, will only `source` `/etc/profile` and then `~/.profile`.

When run normally, it will `source` several files:

As a **login** shell:
1. System-wide config:
    -`/etc/profile` (which itself will likely execute every script in `/etc/profile.d/`)
2. Current-user config: (the first, *and only first*, of these files it can read:)
    1. `~/.bash_profile`
    2. `~/.bash_login`
    3. `~/.profile`

As an **interactive non-login** shell, it will instead read:
1. `/etc/bash.bashrc`
2. `~/.bashrc`

When logging out, it will read:
1. `~/.bash_logout`

When run as a **non-interactive**, **non-login** shell, like as a script, it will read `$BASH_ENV`, and execute the file name found there.


Globbing
--------

### Globbing Tips & Tricks
You can find the first matching file with a wildcard if you use parens when assigning it to a variable:

```sh
ch=(/bin/ch*)
echo $ch
# prints /bin/chattr
```