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

### Live Updating Relative Timestamps
Discord supports relative timestamps (i.e. "in 10 minutes"), that update live within the message you use them in.

The format is `<t:1543392060:R>` where the number is a valid [Unix time].

[Unix time]: https://en.wikipedia.org/wiki/Unix_time

You can generate these easily with a tool, such as this one: 

https://r.3v.fi/discord-timestamps/

#### Other Timestamps
Discord also supports other timestamps, which are a little but less useful:

|Style|Input|Output (12-hour clock)|Output (24-hour clock)
|--|--|--|--
|Default|`<t:1543392060>`|November 28, 2018 9:01 AM|28 November 2018 09:01
|Short Time|`<t:1543392060:t>`|9:01 AM|09:01
|Long Time|`<t:1543392060:T>`|9:01:00 AM|09:01:00
|Short Date|`<t:1543392060:d>`|11/28/2018|28/11/2018
|Long Date|`<t:1543392060:D>`|November 28, 2018|28 November 2018
|Short Date/Time|`<t:1543392060:f>`|November 28, 2018 9:01 AM|28 November 2018 09:01
|Long Date/Time|`<t:1543392060:F>`|Wednesday, November 28, 2018 9:01 AM|Wednesday, 28 November 2018 09:01
|Relative Time|`<t:1543392060:R>`|3 years ago|3 years ago


#### Relative (Live Updating) Timestamps
The most useful of these is the `R`elative timeestamp, as seen above, and can be generated using this tool:




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