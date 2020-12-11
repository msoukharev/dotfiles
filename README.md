# :black_circle: Dotfiles

Simple and comprehensive shell environment customization tool for Mac and Linux.

## Motivation :muscle:

My primary machine is a Mac. All my other remote servers run Debian. For all of these environments, I use zsh as my primary shell.

My terminal workflow includes API endpoint exploration, light automation scripting and administering my remote servers, including the web server that hosts my website.

## Zsh vs Bash

I use zsh as opposed to bash due to its superior performance, and zsh being the default shell for Mac. 

Using Bash is preferred if you want to insure compatibility accross different Linux instances, with other people's scripts and environments, or if you are required to use Bash at school or at work for any reason.

If you use Mac, want to squeeze out more performance, better autocomplete or a more modern shell in general, check out Zshell. It is easy to transition from Bash, and most if not all of your Bash scripts will work in Zshell. I hope this tool will help you with your zsh environment customization.

## Getting started

There are two options:
1. Clone the main branch into `~/.dotfile` directory and source `~./dotfile/setup.bash`.

run `git clone https://github.com/msoukharev/dotfile.git ${HOME}/.dotfile ; chmod -R u+x ${HOME}/.dotfile ; source ${HOME}/.dotfile/setup.bash`
  
2. Run the remote installer

run ``bash "`curl -s https://raw.githubusercontent.com/msoukharev/dotfile/main/remote_install.sh`"``
