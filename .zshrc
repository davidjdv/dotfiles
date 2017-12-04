# Homebrew
export PATH="/usr/local/sbin:/usr/local/opt/python/libexec/bin:$PATH"
#export PATH="/usr/local/sbin:$PATH"

### Added by Zplugin's installer
source '/Users/djanssens/.zplugin/bin/zplugin.zsh'
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin
### End of Zplugin's installer chunk

zplugin load zdharma history-search-multi-word
zplugin load zdharma/zui
# zplugin light zdharma/zplugin-crasis  # load vs light: load is more verbose

# Binary release in archive, from Github-releases page; after automatic unpacking it provides command "fzf"
zplugin ice from"gh-r" as"command"; zplugin load junegunn/fzf-bin

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# Used also `bpick' which selects Linux packages – in this case not needed, Zplugin
# automatically narrows down the releases by grepping uname etc.
zplugin ice from"gh-r" as"command" mv"docker* -> docker-compose" bpick"*linux*"; zplugin load docker/compose

# Vim repository on Github – a source that needs compilation
zplugin ice as"command" atclone"./configure" atpull"%atclone" make pick"src/vim"; zplugin light vim/vim

# A script (Zsh) that needs building by make. The make argument (install PREFIX=/opt) isn't
# needed because the pick Ice-mod will use uninstalled files from build-directory, but
# this demonstrates the make-customization feature which has a swiss-knife potential
zplugin ice as"command" pick"build/zsd*" make"install PREFIX=/opt"; zplugin load zdharma/zshelldoc

zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-syntax-highlighting # Syntax highlighting as you type
zplugin light zsh-users/zsh-completions # Tab completions for many more applications than come standard with zsh
zplugin light zsh-users/zsh-history-substring-search # Better history search

# A use of Subversion to load an OMZ plugin
zplugin ice svn; zplugin snippet OMZ::plugins/git
zplugin snippet OMZ::lib/git.zsh # this is file not a dir so SVN cannot be used

# This one to be ran just once, in interactive session
#zplugin creinstall %HOME/my_completions  # Handle completions without loading any plugin, see "clist" command


# Powerline theme...
. /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
#POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_MODE='awesome-fontconfig'
#POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
#POWERLEVEL9K_SHORTEN_DELIMITER=""
#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%F{white}"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%F{white} "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator dir dir_writable_joined vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time
                                    vcs background_jobs_joined time_joined)
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="clear"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="clear"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_GIT_ICON='\uE1AA'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uE1AA'
POWERLEVEL9K_DIR_HOME_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="clear"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="blue"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_BACKGROUND="clear"
POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_FOREGROUND="red"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="clear"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND="red"
POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND="white"
POWERLEVEL9K_STATUS_OK_BACKGROUND="clear"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="clear"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"
POWERLEVEL9K_TIME_BACKGROUND="clear"
POWERLEVEL9K_TIME_FOREGROUND="cyan"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='clear'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='magenta'
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='clear'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='green'
