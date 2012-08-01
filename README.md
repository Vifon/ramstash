NAME
====

ramstash

DESCRIPTION
===========

Have you ever needed a quiet safe place for your inhuman experiments that can
endanger the entire human species? Look no more!

ramstash is a small collection of scripts for creating a preconfigured
environment in a ramdisk and then deleting it.

The default environment is suitable for C/C++ experiments and requires a little
setup (see below) but you can change it to whatever you like.

USAGE
=====

Create your desired environment in $HOME/.ram_stash (you can add files to ignore
to the ".ignore" file) and just run `ramrearm` to copy that environment to the
ramdisk. After finished work, run `ramclean` to clean the ramdisk.

INSTALLATION
============

1. Create a "ram" directory in your home directory (i.e. $HOME/ram).

2. Add the following line to your /etc/fstab

    tmpfs /home/USER/ram tmpfs users,owner,exec,size=10m,uid=YOURUID,gid=YOURGID,suid 0 0

and change USER, YOURUID and YOURGID to appropriate data.

3. Mount the newly created ramdisk:

    $ mount $HOME/ram

4. Move this directory (yes, that one with the readme you're reading right now)
to $HOME/.ram_stash

5. Add $HOME/.ram_stash to your `PATH` variable (for example in bashrc) or move
files "ramclean" and "ramrearm" to a directory that is in `PATH`.

DEPENDENCIES
============

perl 5.10 or newer, perl-ansicolor, perl-file-slurp, gcc 4.7 (only for the default Makefile; alternatively change -std=c++11 to -std=c++0x if you want to use gcc 4.6)
