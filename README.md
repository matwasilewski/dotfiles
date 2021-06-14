# dotfiles

Running [**oh-my-zsh**](https://github.com/robbyrussell/oh-my-zsh) with [**Agnoster*](https://github.com/agnoster/agnoster-zsh-theme). 
Inspired by [**Holman's dotfiles**](https://github.com/holman/dotfiles) and using his script for creating symlinks to .symlink files.

## Files

* `aliases.symlink` - All my own aliases, all git-aliases is supplied by [`oh-my-zsh/wiki/git`](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)
* `functions.symlink` - bash-functions, called by aliases
* `vimrc.symlink` - My [`vim`](https://en.wikipedia.org/wiki/Vim_(text_editor)) configuration.
* `zshenv.symlink` - All environment variables exported here.
* `zshrc.symlink` - Most of the `zsh`-config, sourcing `.aliases` and `.functions`

## Installation

If you are on _Windows 10_ I recommend installing [bash on Windows/WSL](https://msdn.microsoft.com/en-us/commandline/wsl/about) and using `bash` through either [Hyper](https://github.com/zeit/hyper) or [cmder](http://cmder.net/). Through `bash` you can install `zsh` and run this config.

1 . Install `zsh` according to these instructions: [**installing zsh**](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)

2 . Run ./bootstrap.sh script.

3. Run the SystemSetup from my another repo to install some of the missing plugins and dependencies - this should be in the future moved to this repo to make it completely independent. Alternatively, you can install them manually.
 
4 . Reload the `.zshrc` by running. Everytime you make a change in `.zshrc` you have to _source_ the file so it reloads. This can be done with either `.` or `source`:

```bash
. ~/.zshrc
```

## Extra 

##### Merge title bar

To merge the title bar with the background, just change the `Tab Color` to the same as the background color:

![Tab Color](https://i.imgur.com/yqe8Z5Y.png)

##### Padding

I have added padding to all sides which you can do under `Advanced` in settings. Just search for `margin` and change `Height of top and botton margins in terminal spaces` and `Width of left and right margins in terminal spaces`

![Padding](https://i.imgur.com/ywslqBg.png)
