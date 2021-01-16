# Allow dynamic prompt for zsh
__zsh && setopt PROMPT_SUBST

# Source the theme, source source default if no theme found
if [ -n $theme ]; then
    __dotfile_source_path themes user $theme >/dev/null 2>&1 || \
    __dotfile_source_path themes $theme >/dev/null 2>&1 || \
    __dotfile_source_path themes default >/dev/null 2>&1 || echo "Could not load a theme"
fi

# Source default configs
__dotfile_source_path config

# Source callable scripts
__dotfile_source_path src

# ITERM integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export TERM=xterm-256color
