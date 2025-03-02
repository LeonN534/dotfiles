# Catppuccin Mocha Theme (for zsh-syntax-highlighting)
#
# Paste this files contents inside your ~/.zshrc before you activate zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# Main highlighter styling: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md
#
## General
### Diffs
### Markup
## Classes
## Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#605f6b'
## Constants
## Entitites
## Functions/methods
ZSH_HIGHLIGHT_STYLES[alias]='fg=#96f685'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#96f685'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=#96f685'
ZSH_HIGHLIGHT_STYLES[function]='fg=#96f685'
ZSH_HIGHLIGHT_STYLES[command]='fg=#96f685'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#96f685,italic'
ZSH_HIGHLIGHT_STYLES[autodirectory]='fg=#f7a285,italic'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#f7a285'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#f7a285'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#d484f4'
## Keywords
## Built ins
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#96f685'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#96f685'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#96f685'
## Punctuation
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#f67d7b'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-unquoted]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]='fg=#f67d7b'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#f67d7b'
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=#f67d7b'
## Serializable / Configuration Languages
## Storage
## Strings
ZSH_HIGHLIGHT_STYLES[command-substitution-quoted]='fg=#f3eb84'
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter-quoted]='fg=#f3eb84'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#f3eb84'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=#f7859f'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#f3eb84'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=#f7859f'
ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=#f3eb84'
## Variables
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=#f7859f'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#e5e5e5'
## No category relevant in spec
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f7859f'
ZSH_HIGHLIGHT_STYLES[path]='fg=#e5e5e5,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#f67d7b,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=#e5e5e5,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=#f67d7b,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#d484f4'
#ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[command-substitution-unquoted]='fg=?'
#ZSH_HIGHLIGHT_STYLES[process-substitution]='fg=?'
#ZSH_HIGHLIGHT_STYLES[arithmetic-expansion]='fg=?'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=#f7859f'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[arg0]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[default]='fg=#e5e5e5'
ZSH_HIGHLIGHT_STYLES[cursor]='fg=#e5e5e5'