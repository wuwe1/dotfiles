# Use colors in coreutils utilities output
alias ls='ls --color=auto'
alias grep='grep --color'

if command -v exa > /dev/null; then
    alias ls=exa
    alias l="exa -l"
    alias la="exa -a"
fi

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

# Short cut
alias zshconfig="vim ~/.zshrc"
alias v="vim"
alias top10cmd="history 1 | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10"


