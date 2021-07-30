# My config files
These are the config files (AKA dotfiles) that I use on my 'daily driver' PC:
the laptop and desktop that I use for work, projects, and personal usage. As a
result, I view it as a highly practical setup for long-term use, on the
condition that you share my personal preference of utilities, color schemes,
and keyboard shortcuts.

The reason this is called .config and not the usual 'dotfiles' is because I've
literally just run a `git init` in my .config directory, and then added
everything that felt like it belonged here. So the way to get this running on a
new machine is to just `git clone` it into a .config directory on a new
machine, and it should be ready to go. They follow the same file structure that
is found on my machine and so should be OK to simply git-clone in as-is.
 
There's a handful of directories here that may be of interest:
- coc/extensions: My daily-driver IDE and text editor is the NVim variant of
  Vim. I'm making use of CoC for LSP-integration, and have a handful of
  extensions for that.
- dunst: Nice and simple notifications.
- fish: My personal choice of shell. I'm particularly fond of the
  'abbreviations' feature, and a bunch are configured.
- htop: Some configuring happening here, though it's all through htop.
- i3: Tiling window manager. There's a bunch of unique things here-- I'm using
  my numpad as both a number input and a single-press workspace switcher, which
  isn't very typical as far as I've seen.
- nvim: Configurations for the afore-mentioned Vim variant. All kinds of tweaks
  in here, and a non-trivial set of plugins too.
- powerline-shell: Always nice to have a nice-looking shell.
- rofi: For opening applications.
- zathura: For opening pdf's. Configured to give pdf's the same color scheme as
  the rest of the UI (dark gruvbox)

The .gitignore ignores everything, which is convenient since most of the stuff
in .config isn't really worth sharing. There's also a install_utils.sh, but
that's not yet ready for usage.
