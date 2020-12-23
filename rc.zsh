# Source dotfiles
__dotfile_source_path Dotfiles

# Dynamic prompt string reevaluation
setopt PROMPT_SUBST

# Source theme
if [ -n $theme ]; then
    __dotfile_source_path Themes User $theme >/dev/null 2>&1 || \
    __dotfile_source_path Themes $theme >/dev/null 2>&1 || \
    __dotfile_source_path Themes default >/dev/null 2>&1 || echo "Could not load a theme"
fi
