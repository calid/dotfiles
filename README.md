## Usage ##

```
git clone https://github.com/calid/dotfiles.git --recurse-submodules
```

### Caveat Emptor ###

These configurations are provided as-is, without warranty or guarantees. They work for me, but they may not work for you. You should review these files before using them and modify them based on your needs. You have been warned.

*NOTE:* for the symlinks below be sure to use the absolute path to where you
cloned the dotfiles repo.

### Vim ###

```
ln -sv ~/git/dotfiles/vim ~/.vim
```

### Bash ###

```
ln -sv ~/git/dotfiles/skel/{.profile,.bash_profile,.bashrc} ~/
ln -sv ~/git/dotfiles/profile.d ~/.profile.d
ln -sv ~/git/dotfiles/bashrc.d ~/.bashrc.d
ln -sv ~/git/dotfiles/etc/inputrc ~/.inputrc
```
one-time/login configurations are under `profile.d` (e.g. environment variables). per-shell/interactive configurations are under `bashrc.d` (e.g. prompt & aliases).

### etc ###

symlink the files under `etc` as appropriate
