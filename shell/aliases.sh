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

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}
top10cmd(){
history 1 | awk '{$1="";print substr($0,2)}' | sort | uniq -c | sort -n | tail -n 10
}

# Short cut
alias zshconfig="vim ~/.zshrc"
alias v="vim"
alias p="proxychains4"

