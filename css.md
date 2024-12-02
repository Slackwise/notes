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


Tips & Tricks
-------------
Some maybe non-obvious tips and tricks, or some important facts to keep in mind when working with CSS.

### `<body>` Element
- Default 8px margin all around
- Full width `block` element
- Height is minimum required (`auto`)

### `block` Displayed Elements
- Will force a newline.
- Will always ***stack vertically*** on top of each other.

### `inline` Display Elements
- Don't force newlines.
- Will have an [anonymous box].
- Cannot have a height.
- Cannot have a margin.
- Can have a padding, but it won't impact the actual layout. (Will impact outlines.)

[anonymous box]: https://developer.mozilla.org/en-US/docs/Web/CSS/Visual_formatting_model#anonymous_boxes

### `inline-block` Display Elements
- Won't start new line.
- Can sit side-by-side other `inline`/`inline-block` elements.
- Can set height.
- Can set margin.

### Lists
- Items display as `list-item`, which is an `inline` element with a `::marker` bullet on the left similar to a `::before` pseudo-element.
- The `::marker` CSS pseudo-element:
    - represents the bullet of a list, but is not very style-able.
    - Renders as an `inline`-ish element, so you cannot even position it.

### CSS Grid
Grid should be used for laying out entire websites, but, now you can use `subgrid` to nest grids to make fully build sites with grids!

#### Learning Resources
- [Learn CSS Grid](https://learncssgrid.com): A visual guide to learning Grid, step by step.
- [CSS Grid Garden](https://cssgridgarden.com): A short game that teaches you grid by asking you to position elements correctly using Grid.

#### General Concepts
- Grid items span only one column and row track by default.
- The `template` properties are the definitions of the Grid itself, and belong only on the container element, not the elements within it.
- The non-`template` properties are for defining how an element will position itself on the grid.
- `grid-auto-flow` is used to define the direction items are placed as they're encountered in the container, when no specific location is defined by `grid-template-*` or `grid-area`.
    - The "auto flow" will place elements according to flow direction, filling up all defined `grid-template-*` tracks before creating implicit tracks (in the `grid-auto-flow` direction).

#### Column/Row Starts & Ends
- The starts and ends are defined by the **lines** and not the columns/rows created.
- You can use `end` as the end of a column/row definition.
- You can use **negative** numbers to count backwards.

#### Grid Areas
- An area is just a span of columns and rows. 
- An area can be named and then referenced by the elements to be positioned on the grid.

#### `fr` units
- Each fraction is relative to the amount of fractions mentioned, so if you create 2 columns of `1fr 3fr` then there are 4 fractional divisions.
- When using pixels, percentages, or ems, the leftover space is what `fr` uses.


Rules for Semantic and Maintainable CSS
---------------------------------------
This is a compiled list of rules of what to do or not to do, to write CSS that is the most semantically useful and maintainable.


### Each line of CSS is a liability
So write the minimum CSS you need.

Many properties in CSS will *cascade* down the tree of DOM nodes, and if you graph out the relationship of every single declaraction/rule you've written, you will be horrified at how complex it becomes. Your goal should be to write as little as possible to get the desired end result, and [avoid overrides][#avoid-overrides].


### Avoid Overrides
When you look at your styles in the Chrome Dev Tools, a crossed-out property means it was overriden via the cascade, specificity, or order in the file. Your goal should be to write CSS that has the minimum overrides, because those are an indicator that you're fighting the rules you've put into place.

An easy way to start with less overrides, is to follow the "mobile first" approach, which is more of a "simpler layout first" approach, as mobile layouts tend to linear and simpler. Then add on more from there, rather than override.


### Use *lower* contrast dark themes
People with an astigmatism have trouble reading bright white text on pitch black backgrounds. Astigmatism affects [almost half of the population][astigmatism] (depending on age), including myself. It causes an effect known as "[halation]", which makes the edges of letters blur or glow, as the literal white pixels of the screen are *beaming* light right into our warped corneas. You can lessen this boundary by surrounding it with more light--by reducing the contrast between the text and its background. And just avoid pure white when possible, opting for a slightly grey text.

Those with general focus issues, such as the near blind or legally blind, likely prefer *more* contrast, and you should use [`prefers-contrast`][prefers-contrast] to render a higher contrast version for them.

[astigmatism]: https://www.levelaccess.com/blog/accessibility-for-people-with-astigmatism/
[halation]: https://bootcamp.uxdesign.cc/why-dark-mode-isnt-a-ux-panacea-1590226e5ba4
[prefers-contrast]: https://developer.mozilla.org/en-US/docs/Web/CSS/@media/prefers-contrast


### Don't change the base font size
When you set the font size of `:root`, `html`, or `body` font, it prevents users from overriding it with their own default font sizes, which inhibits accessibility. This forces users to use full browser zoom, which then causes your site to be re-rendered larger, and potentially break layout as well. You would think this is a small amount of users, but...

> there is an [empirical study run by the people behind the Internet Archive][IAStudy] showing that there is a significant amount of users who change their default font size in the browser settings. [1]

Instead, leave the base font size alone (or increase it depending on contrast needs), so that it functions as the body copy text size, that paragraphs of text will render in. Use `em` to set relative font sizes for all other article text on the page you expect users to read, like headings and quotes, etc. (You can still use `px` for UI text, like menus and buttons, so that their proportions make sense relative to their UI.)

[1]: https://css-tricks.com/accessible-font-sizing-explained/
[IAStudy]: https://medium.com/@vamptvo/pixels-vs-ems-users-do-change-font-size-5cfb20831773


### Consider detecting user-selected fonts
If you are creating a website with a large amount of text to read, like a blog, consider detecting that a user has changed their font from the defaults, and rendering or offering that to them. This is going to be most common with people hoping to use a dyslexia friendly font, and you don't want to make it any more difficult for them to read your content!

### Use Logical Properties/Values
If you're supporting RTL languages like Arabic, rather than using left or right for organizing text and items, you can use a [logical] *start* and *end* now. Consider these if you're writing a multi-lingual website or web app.

[logical]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_logical_properties_and_values/Basic_concepts_of_logical_properties_and_values
