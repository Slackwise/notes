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

### Compare Two Branches
To compare the *commits*, use `git cherry -v otherbranchname`.

To compare the actual *code* changes, use `git diff otherbranchname`.


Configure Git for Both Work & Personal Profiles
-----------------------------------------------
Git **version 2.36** introduced a new `includeIf` conditional, `hasconfig:remote.*.url:`, which allows you to conditionally load a config file based on if a specific URL exists within the remote config for the repo you are currently working with. With this new feature, you can easily configure Git for home/personal usage, or any given org.

If you're using GitHub, that would look like:

```ini
# Common Settings:
[user]
    name = Firstname Lastname
# Personal Settings:
[includeIf "hasconfig:remote.*.url:git@github.com:firstnamelastname/**"]
    path = "~/.gitconfig-personal"
# Work Settings:
[includeIf "hasconfig:remote.*.url:git@github.com:acmeinc/**"]
    path = "~/.gitconfig-work"
```
### Using Only 2 Files
Or if you don't want 3 files, you can have one just override the others by piling everything into `~/.gitconfig` and then just using `~/.gitconfig-work` to overwrite things like your email address:

#### `~/.gitconfig`
```ini
# Personal Settings:
[user]
    name = Firstname Lastname
    email = firstname@lastname.com
# Work Settings that will add to or overwrite personal settings:
[includeIf "hasconfig:remote.*.url:gitlab.acmeinc.com/**"]
    path = "~/.gitconfig-work"
```

#### `~/.gitconfig-work`
```ini
[user]
    # This will overwrite your personal email address with your work one:
    email = firstname.lastname@acmeinc.com
```

### Alternatives to `hasremote`
Also consider `includeIf "gitdir:"` if this won't work for you, which will include a config fle based on the name/path of the git repository.

Git LFS
-------
A plugin for Git that stores *designated* large files externally, so that the repository itself doesn't get too large or slow to work with.

With LFS, you need to explicitly "track" files using `git lfs track <pattern>`, otherwise they will be treated like all other files. This `<pattern>` is often an **extension** like `*.pdf`.

> This command amends your repository's `.gitattributes` file and associates large files with Git LFS. [1]

[1]: https://docs.github.com/en/repositories/working-with-files/managing-large-files/configuring-git-large-file-storage

When you `push` a file that matches one of these patterns, they will now be **uploaded** to the server to handle in an alternative way, leaving only a reference to the file in the repository itself, and thus keeping the repository size small.