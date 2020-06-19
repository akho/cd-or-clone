# `cd-or-clone`

If you work on several computers, you can sometimes forget which Git repos you have locally, or where.
So you try to cd to a folder you just know has to be there, 
and it’s not there, 
and you need to remember where the Git origin is so you can `git clone`,
and then you `git clone`,
and then you remember it was in a different subfolder on your other computer
(because you’re so _organized_),
but you keep it as it is because why bother, 
and then everything is in different places everywhere,
and you are miserable.

Of course, where I said “you” in the paragraph above, I actually meant me.

So.

`cd-or-clone` remembers where things are.
If you set it up as a hook in [Zsh](http://zsh.sourceforge.net/), it will record local locations and origins of all repos you work with,
and then allow you to quickly retrieve them.

The default location of the store is `~/.local/cd-or-clone.store`, though you can set a different one in the `$CD_OR_CLONE_STORE` environment variable.
I recommend you make the store a part of your dotfiles repo, or sync it somehow else.
In your `.zshrc` you put

    eval $(cd-or-clone zsh)

That sets up a cd hook, which will record all your repos and origins in the store as you go.
To go somewhere, press `Ctrl-G`. It will put you in a [Fzf](https://github.com/junegunn/fzf) with all the folders cd-or-clone remembers.
When you choose one, you’ll either be magically transported there (via `cd`),
or, if the folder sadly does not exist,
cd-or-clone will `git clone` it from the origin it recorded.

For Bash, use

    eval $(cd-or-clone zsh)

in `.bashrc` to get the same thing.

If you are not on Zsh or Bash, run `cd-or-clone` to see the options.

## Installation

You need to have a recent Perl installed.
You probably do.
I recommend also having [Fzf](https://github.com/junegunn/fzf) in your path, and [Zsh](http://zsh.sourceforge.net/) provides the easiest experience.

If you have [Nix](https://nixos.org/),

    nix-env -i -f .

installs the script (but not Zsh or Fzf).

    eval $(cd-or-clone zsh)

Sets up Zsh hooks and the `Ctrl-G` keybinding.
You can also run `cd-or-clone zsh` to see what it does and modify to taste.

`cd-or-clone bash` does the same things for Bash.

Enjoy.
