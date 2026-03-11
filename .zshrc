# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Minimal - Theme Settings
export MNML_INSERT_CHAR="$"
export MNML_PROMPT=(mnml_git mnml_keymap)
export MNML_RPROMPT=('mnml_cwd 20')

# Liquibase environment
export LIQUIBASE_HOME=/opt/homebrew/opt/liquibase/libexec

# Turn off Homebrew hints
export HOMEBREW_NO_ENV_HINTS=1

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
#COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$DOTFILES  # Commented out to avoid theme loading issues

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

# Minimal plugins for faster startup
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# NVM Setup - Eagerly loaded to ensure all Node tools are available
export NVM_DIR=~/.nvm

# Load nvm immediately on shell startup
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && source "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && source "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"

# Use the correct Java version for FactorLab
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home

# CATALINA_OPTS to set java options for Tomcat
export CATALINA_OPTS="-Xss8m -Dcom.sun.net.ssl.enableECC=false \
 -Djavax.net.ssl.keyStoreType=JKS \
 -Djavax.net.ssl.keyStore=/Users/kevinschraith/FactorLab/factorlab-server/.truststore/tomcatkeys.jks \
 -Djavax.net.ssl.keyStorePassword=changeit \
 -Djavax.net.ssl.trustStoreType=JKS \
 -Djavax.net.ssl.trustStore=/Users/kevinschraith/FactorLab/factorlab-server/.truststore/tomcatcerts.jks \
 -Djavax.net.ssl.trustStorePassword=changeit"

# 1Password CLI settings
export OP_BIOMETRIC_UNLOCK_ENABLED=true
export OP_ACCOUNT=Factorlab

# Set default AWS profile to prod-admin so you don't need to specify --profile with each command
export AWS_PROFILE=duplo-prod-admin
# Disable CLI pager for AWS commands so output is always displayed in the terminal
export AWS_PAGER=""

# Set private environment variables, which should not be included in source control
[[ ! -f ~/.private.zsh ]] || source ~/.private.zsh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $DOTFILES/aliases.zsh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Load Angular CLI autocompletion if ng is available
if command -v ng > /dev/null 2>&1; then
    source <(ng completion script 2>/dev/null) || true
fi

# Set TOMCAT_DEPLOY_DIR to directory based on install tomcat version
# export TOMCAT_DEPLOY_DIR=$(find /opt/homebrew/Cellar/tomcat -mindepth 1 -maxdepth 1)
export TOMCAT_DEPLOY_DIR=/opt/homebrew/opt/tomcat@10
#alias fl-deploy="echo \"Copying factorlab-web/target/factorlab-web.war to $TOMCAT_DEPLOY_DIR/libexec/webapps\" ; cp factorlab-web/target/factorlab-web.war $TOMCAT_DEPLOY_DIR/libexec/webapps"
alias fl-deploy="echo \"Copying factorlab-web/target/factorlab-web to $TOMCAT_DEPLOY_DIR/libexec/webapps\" ; cp -r factorlab-web/target/factorlab-web $TOMCAT_DEPLOY_DIR/libexec/webapps"

# Set Python environment to non-system-wide (avoid impacting Homebrew)
# Only activate if we're in a Python project or if venv exists
if [[ -f ~/.venv/bin/activate ]] && [[ -f "$(pwd)/requirements.txt" || -f "$(pwd)/setup.py" || -f "$(pwd)/pyproject.toml" || -f "$(pwd)/Pipfile" ]]; then
    source ~/.venv/bin/activate
fi

# Added by Windsurf
export PATH="/Users/kevinschraith/.codeium/windsurf/bin:$PATH"

# GPG Signing for BitBucket needs this
export GPG_TTY=$(tty)



[[ "$TERM_PROGRAM" == "kiro" ]] && . "$(kiro --locate-shell-integration-path zsh)"
alias pip='pip3'

# bun completions
[ -s "/Users/kevinschraith/.bun/_bun" ] && source "/Users/kevinschraith/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"




# Set JAVA_HOME to Amazon Corretto 17 used by builds
export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home
export PATH="/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home/bin:/Users/kevinschraith/.bun/bin:/Users/kevinschraith/.codeium/windsurf/bin:/Users/kevinschraith/.bun/bin:/Users/kevinschraith/.codeium/windsurf/bin:/Users/kevinschraith/.nvm/versions/node/v18.20.8/bin:/opt/local/bin:/opt/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/Users/kevinschraith/.local/bin:/Users/kevinschraith/Library/Application Support/Code/User/globalStorage/github.copilot-chat/debugCommand"
export PATH="/opt/homebrew/opt/tomcat@10/bin:$PATH"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"

# opencode
export PATH=/Users/kevinschraith/.opencode/bin:$PATH

export PATH=/Users/kevinschraith/bin:$PATH

[[ -e "/Users/kevinschraith/lib/oracle-cli/lib/python3.14/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/Users/kevinschraith/lib/oracle-cli/lib/python3.14/site-packages/oci_cli/bin/oci_autocomplete.sh"

# MySQL 8.0 client (for mysql_native_password support)
export PATH="/opt/homebrew/opt/mysql-client@8.0/bin:$PATH"
