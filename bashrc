alias awsapp='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@54.79.118.220'
alias awsdb='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@3.104.110.233'
alias gs='git status'
PATH="/home/dean/bin:$PATH"

vim () {
    if [ -z "$@" ]; then
        vim.gtk3
    fi
    cd "$1" 2> /dev/null || vim.gtk3 "$@"
}

v () {
    vim "$@"
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "[${BRANCH}] "
	else
		echo ""
	fi
}

export PS1="\[\e[1;37m\]\`parse_git_branch\`${debian_chroot:+($debian_chroot)}\u@\h:\w\$ \[\e[m\]"
export XCURSOR_PATH=$RUNTIME/usr/share/icons

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Tab completion for vv
_vv()
{
    local VV_DIR=`pwd`/resources/views
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$VV_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $VV_DIR/$file ]]; then
            file=$file/
        else
            file="$file "
        fi
        COMPREPLY[i]="$file"
    done
}
complete -F _vv -o nospace vv

# Tab completion for vm
_vm()
{
    local VM_DIR=`pwd`/app/Models
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$VM_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $VM_DIR/$file ]]; then
            file=$file/
        else
            file="$file "
        fi
        COMPREPLY[i]="$file"
    done
}
complete -F _vm -o nospace vm

# Tab completion for vc
_vc()
{
    local VC_DIR=`pwd`/app/Http/Controllers
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$VC_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $VC_DIR/$file ]]; then
            file=$file/
        else
            file="$file "
        fi
        COMPREPLY[i]="$file"
    done
}
complete -F _vc -o nospace vc

# Tab completion for vl
_vl()
{
    local VL_DIR=`pwd`/resources/lang/en
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$VL_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $VL_DIR/$file ]]; then
            file=$file/
        else
            file="$file "
        fi
        COMPREPLY[i]="$file"
    done
}
complete -F _vl -o nospace vl

# Tab completion for vl
_vp()
{
    local VP_DIR=`pwd`/resources/lang/en
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$VP_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $VP_DIR/$file ]]; then
            file=$file/
        else
            file="$file "
        fi
        COMPREPLY[i]="$file"
    done
}
complete -F _vp -o nospace vp

cd /home/deanw/git
