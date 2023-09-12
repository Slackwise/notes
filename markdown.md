---
date: 2023-09-12
published: true
categories: notes
tags:
  - software
---

Markdown
========
A plaintext "markup language" that is itself readable without any processing, by common plaintext conventions.


Why this syntax?
----------------
A lot of people question the syntactical decisions made in Markdown, but they're not decisions the original creator, John Gruber, really made, but conventions he adopted from mailing lists, IRC, and other plaintext communication mediums.

For example: lists are just dashes. Common in any plaintext format found in emails.

Or `> ` for quotes? Well that's just how email quotes work!

What about `*foo*` for emphasis? That's been a common form of informal markup for decades to emphasize text.

Underlining "titles" with `===` or `---`? Also common, especially in README files.

So what I'm getting at is, Markdown didn't come up with these, it just brought them together, and normalized using them as a mapping to HTML.


GitHub Flavored Markdown (GFM)
------------------------------
[GFM] is probably the most popular implementation in use, and is implemented along with its various extensions on GitHub, Discord, Reddit, and various sites and services.

[GFM]: https://github.github.com/gfm/ "GitHub Flavored Markdown Repository"


HackMD
------
[HackMD] is a great online collaborative note/documentation app, which has a [self-hosted option][CodiMD]. It uses [`markdown-it`](#markdown-it) for processing, and thus includes a ton of really useful extensions.

[HackMD]: https://hackmd.io
[CodiMD]: https://github.com/hackmdio/codimd


`markdown-it`
-------------
Probably the best Markdown parser, as it is used on most platforms client-side ([[JavaScript]]).

It has a lot of useful plugins/extensions:

https://www.npmjs.com/search?q=keywords:markdown-it-plugin

[markdown-it]: https://markdown-it.github.io/