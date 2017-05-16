# dotfiles

Running [**iTerm2**](https://www.iterm2.com/) with [**oh-my-zsh**](https://github.com/robbyrussell/oh-my-zsh) and [**pure-prompt**](https://github.com/sindresorhus/pure). Inspiration from [*sindresorhus/pure*]() and [this setup@reddit/r/unixporn](https://www.reddit.com/r/unixporn/comments/5vke7s/osx_iterm2_tmux_vim/?utm_content=comments&utm_medium=browse&utm_source=reddit&utm_name=unixporn)   

Another alternative is [**Hyper**](https://github.com/zeit/hyper), it can run the same config.

The color scheme is [**base16 - Oceanic Next**](https://github.com/wbinnssmith/base16-oceanic-next/tree/master/iterm2) for _iTerm2_ and the font is [**Menlo**](https://github.com/hbin/top-programming-fonts)

![Screenshot](http://i.imgur.com/8r8wSev.png)

## Files

* `.aliases` - All my own aliases, all git-aliases is supplied by [`oh-my-zsh/wiki/git`](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git)
* `.functions` - bash-functions, called by aliases
* `.vimrc` - My [`vim`](https://en.wikipedia.org/wiki/Vim_(text_editor)) configuration.
* `.zshenv` - All environment variables exported here.
* `.zshrc` - Most of the `zsh`-config, sourcing `.aliases` and `.functions`

## Installation

If you are on _Windows 10_ I recommend installing [bash on Windows/WSL](https://msdn.microsoft.com/en-us/commandline/wsl/about) and using `bash` through either [Hyper](https://github.com/zeit/hyper) or [cmder](http://cmder.net/). Through `bash` you can install `zsh` and run this config.

1 . Download and install latest beta from [**download@iTerm2**](https://www.iterm2.com/downloads.html) (Only for macOS)

2 . Install `zsh` according to these instructions: [**installing zsh**](https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH)

3 . Install [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh), copy paste one of these commands:

_curl_:
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

_wget_
```bash
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

```

4 . Download the _iTerm2_ Color Scheme files from this repository and save anywhere on your computer: [**base16 - Oceanic Next**](https://github.com/wbinnssmith/base16-oceanic-next/tree/master/iterm2)

5 . In **iTerm2**, go to `Preferences > Profiles` and create a new profile by pressing `+` in bottom left corner or edit the default profile.

6 . Select your profile and go to the `Colors`-tab, in the bottom right there is a dropdown with the text _Color Presets..._. Click it and then choose `Import`. Find your downloaded color scheme and import it, then select it afterwards in the dropdown.

7 . Install the `pure-prompt` with npm: 

```bash
npm install -g pure-prompt
```

8 . Tell `oh-my-zsh` to use this prompt by editing the `.zshrc`-file in your home folder `~`. Or just copy the `.zshrc`-file in this repository:

```bash
# --- Sets the prompt style
fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure
```
_Save the file afterwards_

9 . Reload the `.zshrc` by running:

```bash
. ~/.zshrc
```

10 . I also have two extra plugins installed: [`zsh-syntax-highlighting`](https://github.com/zsh-users/zsh-syntax-highlighting) and [`zsh-autosuggestions`](https://github.com/zsh-users/zsh-autosuggestions). They are already added so just install them with these commands:

_Install `zsh-syntax-highlighting`_
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
```

_Install `zsh-autosuggestions`_
```bash
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```


## Extra 

##### Merge title bar

To merge the title bar with the background, just change the `Tab Color` to the same as the background color:

![Tab Color](https://i.imgur.com/yqe8Z5Y.png)

##### Padding

I have added padding to all sides which you can do under `Advanced` in settings. Just search for `margin` and change `Height of top and botton margins in terminal spaces` and `Width of left and right margins in terminal spaces`

![Padding](https://i.imgur.com/ywslqBg.png)

## System information
_System information displayed with [neofetch](https://github.com/dylanaraps/neofetch)_
![neofetch output](http://i.imgur.com/smBe6gX.png)
