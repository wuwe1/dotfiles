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
    curl -s "https://cn.bing.com/dict/($query)?mkt=zh-CN&setlang=ZH" | pup '.qdef > ul text{}'
}

invest_rise(){
    symbol="$(node /Users/weiwu/workspace/learn/invest/js/index.js)"
    curl "https://api-aws.huobi.pro/market/history/kline?period=15min&size=2&symbol=$symbol"
}

