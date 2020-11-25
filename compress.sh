#! /bin/sh

# The Zotero repo gets quite a lot larger than its content
# This command reduces that excess...
# It uses a lot of ram (depending on how much you've got in zotero)
# so you can also run it without the `--aggressive` switch
git gc --aggressive
