# because OSX doesn't support hostname -i
function getip() {
    OS=`uname`

    if [ "$OS" = "Darwin" ]; then
        MYIP=`ifconfig | grep inet | grep -v inet6 | awk '{ print $2 }' | grep -v "^127.0.0.1"`
    else
        MYIP=`hostname -i`
    fi

    echo ${MYIP}
}

function setProxies() {

    PROXY_SRV=$1
    IP_PAT=$2
    MSG=$3

    # sets MYIP because, well zsh is still based on Bourne shell
    getip

    if [ $(echo ${MYIP} | grep "${IP_PAT}") ]; then

        if [[ -o interactive ]]; then
            echo "${MSG}"
        fi

        export no_proxy=localhost,127.0.0.0,127.0.0.1
        export http_proxy=${PROXY_SRV}
        export https_proxy=${PROXY_SRV}
        
        export NO_PROXY=localhost,127.0.0.0,127.0.0.1
        export HTTP_PROXY=${PROXY_SRV}
        export HTTPS_PROXY=${PROXY_SRV}
        export ALL_PROXY=${PROXY_SRV}
    
    else
        if [[ -o interactive ]]; then
            echo "we are on some other network"
        fi
    fi


}
