---
date: 2023-09-09
published: true
categories: notes
tags:
  - web
  - development
---

Cascading Style Sheets (CSS)
============================
I'm not going to explain what and how CSS works. Mozilla did a great job on the MDN with:

- [CSS basics](https://developer.mozilla.org/en-US/docs/Learn/Getting_started_with_the_web/CSS_basics)
- [Learn to style HTML using CSS](https://developer.mozilla.org/en-US/docs/Learn/CSS)

Instead, most of this page will be tips, tricks, the history, uncommon knowledge, and various subtle things to be mindful of when working CSS.


Rules for Semantic and Maintainable CSS
---------------------------------------
This is a compiled list of rules of what to do or not to do, to write CSS that is the most semantically useful and maintainable.


### Use *lower* contrast dark themes
People with an astigmatism have trouble reading bright white text on pitch black backgrounds. Astigmatism affects [30% to 60% of all people][astigmatism] (depending on age), including myself. It causes an effect known as "[halation]", which makes the edges of letters blur or glow, as the literal white pixels of the screen are *beaming* light right into our warped corneas. You can lessen this boundary by surrounding it with more light--by reducing the contrast between the text and its background. And just avoid pure white when possible, opting for a slightly grey text.

Those with general focus issues, such as the near blind or legally blind, likely prefer *more* contrast, and you should use [`prefers-contrast`][prefers-contrast] to render a higher contrast version for them.

[astigmatism]: https://www.levelaccess.com/blog/accessibility-for-people-with-astigmatism/
[halation]: https://www.levelaccess.com/blog/accessibility-for-people-with-astigmatism/'
[prefers-contrast]: https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-contrast


### Don't change the base font size
When you set the font size of `:root`, `html`, or `body` font, it prevents users from overriding it with their own default font sizes, which inhibits accessibility. This forces users to use full browser zoom, which then causes your site to be re-rendered larger, and potentially break layout as well. You would think this is a small amount of users, but...

> there is an [empirical study run by the people behind the Internet Archive][IAStudy] showing that there is a significant amount of users who change their default font size in the browser settings. [1]

Instead, leave the base font size alone (or increase it depending on contrast needs), so that it functions as the body copy text size, that paragraphs of text will render in. Use `em` to set relative font sizes for all other article text on the page you expect users to read, like headings and quotes, etc. (You can still use `px` for UI text, like menus and buttons, so that their proportions make sense relative to their UI.)

[1]: https://css-tricks.com/accessible-font-sizing-explained/
[IAStudy]: https://medium.com/@vamptvo/pixels-vs-ems-users-do-change-font-size-5cfb20831773


### Consider detecting user-selected fonts
If you are creating a website with a large amount of text to read, like a blog, consider detecting that a user has changed their font from the defaults, and rendering or offering that to them. This is going to be most common with people hoping to use a dyslexia friendly font, and you don't want to make it any more difficult for them to read your content!


CSS Grid
--------
Grid should be used for laying out entire websites, but, now you can use `subgrid` to nest grids to make fully build sites with grids!

### Learning Resources
- CSS Grid Garden: https://cssgridgarden.com

### Starts / Ends
- The starts and ends are defined by the **lines** and not the columns/rows created.
- You can use `end` as the end of a column/row definition.
- You can use **negative** numbers to count backwards.

### `fr` units
- Each fraction is relative to the amount of fractions mentioned, so if you create 2 columns of `1fr 3fr` then there are 4 fractional divisions.
- When using pixels, percentages, or ems, the leftover space is what `fr` uses.