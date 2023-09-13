---
date: 2023-09-13
published: true
categories: notes
tags:
  - software
---

Discord
===================
The chat app.


Undocumented or Lesser Known Features/Shortcuts
-----------------------------------------------

### `/spoiler` For Faster Spoilers
Rather than manually wrapping an entire message with `||`, you can just use `/spoiler`. The fastest way is to just type `/sp` and hit <kbd>TAB</kbd> to auto-complete.

### Collapse All Channel Categories
`Ctr-Shift-A` will collapse all the channel categories on the current server.

### Set Message Unread
`Alt-Click`ing on a message will set it unread.

### `sed`-style Previous Message Typo Correction
If you type a [`sed`][sed]-style [substitution command][sub], such as `s/foo/bar`, which woud replace all instances of `foo` with `bar`, you will actually perform the action on the last message you sent.

This is an implementation of an old informal convention used back in the day on IRC to indicate a correction of a typo, because IRC had no editing of messages.

[sed]: https://en.wikipedia.org/wiki/Sed
[sub]: https://en.wikipedia.org/wiki/Sed#Substitution_command