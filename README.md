# :black_circle: Dotfile

Integrated configurations for Unix/Linux environment running Bash and Zsh.

## Motivation :muscle:

I do a lot of work on command line, which has growing dotfiles and other configuration scripts as a consequence. In addition, I need to maintain dotfiles for Unix environments running both zsh and bash. This project aims at solving this problem!

## Getting started :arrow_forward:

### Default setup

Clone the git repository into your home folder, source the setup script and restart your login shell.

`git clone https://github.com/msoukharev/dotfile ${HOME}/.dotfile`
    
`source ${HOME}/.dotfile/setup.bash`

### Choose location

You  can install this project to any location you wish. In order to do it

1. Specify $DOTFILE_PATH variable

    `export DOTFILE_PATH=[directory-of-your-choice]`

2. Clone the repository  
    
    `git clone https://github.com/msoukharev/dotfile $DOTFILE_PATH`

3. Source the setup script

    `source $DOTFILE_PATH/setup.bash`
