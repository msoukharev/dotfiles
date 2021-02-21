# Source project dependencies
for file in $(ls $DOTFILE_PATH/env); do
    source $DOTFILE_PATH/env/$file
done

# Sources available themes (TO BE REDESIGNED IN THE FUTURE)
function load_theme() 
{
    if [ -n $theme ]; then
        __dotfile_source_path themes user $theme >/dev/null 2>&1 \
            || __dotfile_source_path themes $theme >/dev/null 2>&1 \
            || __dotfile_source_path themes default >/dev/null 2>&1 \
            || echo "Could not load a theme"
    fi
}

# Loads enabled plugins
function load_plugins()
{
    for plugin in ${plugins[@]}; do
        # '*' loads all the plugins
        [ "$plugin" = "@" ] && __dotfile_source_path plugins \
            && break
        __dotfile_source_path plugins/$plugin >/dev/null 2&>1 \
            || echo "Plugin $plugin does not exist" 1&>2 
    done
}

# Load user dotfiles
function load_user_rcfiles()
{
    __dotfile_source_path user/rcfiles
}

# iTerm2 integration
function integrate_iterm() 
{
    if __macos; then
        test -e "${HOME}/.iterm2_shell_integration.zsh" \
            && source "${HOME}/.iterm2_shell_integration.zsh"
        export TERM=xterm-256color
    fi
}

# Allow dynamic prompt for zsh
__zsh && setopt PROMPT_SUBST

# Source callable scripts
__dotfile_source_path scripts

load_theme
load_plugins
load_user_rcfiles
integrate_iterm

unset load_theme load_plugins integrate_iterm load_user_rcfiles
