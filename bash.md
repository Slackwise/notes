Bash
====


Globbing
--------

You can find the first matching file with a wildcard if you use parens when assigning it to a variable:

    ch=(/bin/ch*)
    echo $ch
    # prints /bin/chattr

