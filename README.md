Slackwise's Notes
=================
These are my (public) notes, that will be used to generate all of SLACKWISE.NET, including the blog.


Implementation & Rationale
--------------------------
Originally these notes were implemented via [org-roam], which is a Zettelkasten style linking system for [[org-mode]]. But after suffering through getting org-roam to even work correctly, I realized that the org format is terrible for publishing, and works against every other tool used for modern publishing.

It's 2023, and *Markdown is universal*; it's used in Slack, Teams, Discord, GitHub, GitLab, Confluence (poorly), and every blog engine and developer tool I can think of. VSCode and Emacs have full Markdown plugins. [[org-mode]] even exports to Markdown natively!

So I exported to Markdown.

Now I use [[Foam]] primarily, but I'm free to also mix in any use of [Obsidian] and [Logseq], and publish via [Eleventy], GitHub Pages (which uses [Jekyll]), or to my shared work developer notes in [HackMD]. All which use Markdown, not Org.


[org-roam]: https://www.orgroam.com/ "Org-roam Homepage"
[Obsidian]: https://obsidian.md "A Markdown based note taking tool"
[Logseq]: https://logseq.com/ "A Markdown based note taking tool written in Clojure"
[Eleventy]: https://www.11ty.dev/ "A Jekyll-like blog engine, written in JS, which supports many formats and template engines"
[HackMD]: https://hackmd.io/ "A Markdown based collaborative documentation tool"
[GitHub Pages]: https://pages.github.com/
[Jekyll]: https://jekyllrb.com/ "GitHub Pages internal blog engine"