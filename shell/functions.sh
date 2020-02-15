marco () {
    echo "$(pwd) saved!"
    export MARCO=$(pwd)
}

polo () {
    cd $MARCO
}

path_remove() {
    PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' |sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

bing(){
    if [[ $# -eq 0 ]];then
        echo "query required"
        return 1
    elif [[ $# -eq 1 ]];then
        query=$1
    else
        IFS='+'
        query="'$*'"
    fi
    curl -s "https://www.bing.com/dict/search?q=($query)" | pup '.qdef > ul text{}'
}


