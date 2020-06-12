# Zotero Backup Script

I use systemd to make a daily backup of my Zotero folder. Basically this is life changingly reassuring that I will not lose my Zotero work and it has the added advantage that I can roll back arbitrary days if I so desire.

---

# How to Use

## The Shell Script

`backup.sh` should go in your Zotero folder. You can use the Zotero preferences to move your Zotero folder wherever you want (the default appears to be `~/Zotero` which is where mine is). If you change this, you'll need to modify the `zoterobck.service` file.

Be sure to `git init` and `git remote add` your Zotero folder before running the backup script. It's also not going to prompt you for a password. It's just going to assume your ssh keys are setup.

Make sure that you allow execution on the shell script. I'm not sure what other permissions are appropriate on these files. You should be able to run `./backup.sh`. If you can do that, you can set up the systemd job...

## Systemd Files

Put these files (or symlink them) in the right place

1. ~/.config/systemd/user/zoterobck.service
2. ~/.config/systemd/user/zoterobck.timer

The timer just executes the service which runs the bash script. Is there an easier/better way to do this? Sure there is. Do I care enough to fix the thing that's working (viz. not broken)? No I do not. So more importantly: to query/enable (replace status with whatever you need [like `start`]):

```
systemctl --user status zoterobck.timer
```

Note that the `--user` stuff going on above is to allow the `~/.config` location of the files.

To check logs (I think this works...):

```
journalctl -u zoterobck.service
```
