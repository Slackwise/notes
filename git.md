---
date: 2023-09-07
published: true
categories: notes
tags:
  - development
  - software
---

Git
===================
The version control system (VCS), if you somehow aren't familiar.

First created by Linus Torvalds for the [[Linux]] Kernel project, now the most popular VCS in the world.


Useful Actions/Commands
-----------------------

### Delete Last Commit
`reset HEAD^` will delete the last commit, with **no confirmation**. Be careful.

### Show Log with File Changes
`log --stat` will display the log with file changes for each commit.


Git LFS
-------
A plugin for Git that stores *designated* large files externally, so that the repository itself doesn't get too large or slow to work with.

With LFS, you need to explicitly "track" files using `git lfs track <pattern>`, otherwise they will be treated like all other files. This `<pattern>` is often an **extension** like `*.pdf`.

> This command amends your repository's `.gitattributes` file and associates large files with Git LFS. [1]

[1]: https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage

When you `push` a file that matches one of these patterns, they will now be **uploaded** to the server to handle in an alternative way, leaving only a reference to the file in the repository itself, and thus keeping the repository size small.