My super snazzy config files. Seriously, these configs rock.

#### Usage ####

If you'd like to try out these configs yourself setup is straightforward:

    $ git clone --recurse-submodules https://github.com/calid/configz.git

This will both clone and initialize all the nested submodules (e.g. my vim plugins).

Now simply decide which configs you'd like to use and symlink accordingly:

##### Vim #####

    $ ln -sv /path/to/configz/etc/vimrc ~/.vimrc
    $ ln -sv /path/to/configz/vim ~/.vim

To see the plugins I have installed `$ ls ~/.vim/bundle`.  I use [pathogen](https://github.com/tpope/vim-pathogen) to manage and load my plugins. See my `vimrc` for configured bindings and settings.

##### Tmux #####

    $ ln -sv /path/to/configz/etc/tmux.conf ~/.tmux.conf

See my `tmux.conf` for configured bindings and settings.

##### Shell setup (including snazzy PS1) #####

    $ ln -sv /path/to/configz/profile.d ~/.profile.d
    $ ln -sv /path/to/configz/bashrc.d ~/.bashrc.d

Add the following to your `.bash_profile`:

```bash
if [ -d $HOME/.profile.d ]
then
    for f in $HOME/.profile.d/*.sh
    do
        . $f
    done
fi
```

Add the following to your `.bashrc`:

```bash
if [ -d $HOME/.bashrc.d ]
then
    for f in $HOME/.bashrc.d/*.sh
    do
        . $f
    done
fi
```

Now do `$ exec bash --login` for the new settings to take effect.

*A note on libreadline*
