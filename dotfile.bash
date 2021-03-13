function project_source()
{
    inside_path=$(sed 's/\ /\//g' <<< $@)
    source_path=$DOTFILE_PATH/$inside_path
    if [ -d $source_path ]; then
        files=(`ls $source_path`)
        for file in $files; do
            file_path=$source_path/$file
            [ -f $file_path ] && source $file_path
        done
    elif [ -f $source_path ]; then
        source $source_path
    else
        return 1
    fi
}

# Source project dependencies
project_source env.bash

# Sources available themes (TO BE REDESIGNED IN THE FUTURE)
function load_theme()
{
    if [ -n $theme ]; then
        project_source themes user $theme >/dev/null 2>&1 \
            || project_source themes $theme >/dev/null 2>&1 \
            || project_source themes default >/dev/null 2>&1 \
            || echo "Could not load a theme"
    fi
}

# Loads enabled plugins
function load_plugins()
{
    for plugin in ${plugins[@]}; do
        # '*' loads all the plugins
        [ "$plugin" = "@" ] && project_source plugins \
            && break
        project_source plugins/$plugin >/dev/null 2&>1 \
            || echo "Plugin $plugin does not exist" 1&>2
    done
}

# Load user dotfiles
function load_user_rcfiles()
{
    project_source user/rcfiles
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
project_source scripts

load_theme
load_plugins
load_user_rcfiles
integrate_iterm

unset load_theme load_plugins integrate_iterm load_user_rcfiles project_source
