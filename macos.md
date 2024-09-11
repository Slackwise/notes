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

Role accounts require name starting with `_` and UID in 200-400 range. When creating an account with `sysadminctl`, you will **need to** provide said UID.

If you check `/etc/passwd`, you will see that Apple has service/role accounts (prefixed with `_`) all over the range of UIDs, from 1 through almost 300, with various gaps... and even one at 441. (Obviously, that means they don't follow their own rules, and they stomp all over the range they tell *you* to use.) Seeing as Apple stops at just before 300, and has been consistently using more and more services with the UID incrementing, you should probably start eating the spaghetti [1] from the other end and start at 400 and go lower as you add more services.

[1]: Hopefully you'll never reach the end and have to kiss Tim Apple...

Thus, an example role account is created using:
```sh
sudo sysadminctl -addUser _teamcity -UID 400 -fullName "TeamCity Build Agent" -roleAccount
```

Note that you **cannot** specify a `-home` directory for role accounts, and it will always be `/var/empty`.

[RA]: https://forums.developer.apple.com/forums/thread/692593 "Apple engineer answering that services should use 'role accounts'"