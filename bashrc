alias awsapp='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@54.79.118.220'
alias awsdb='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@3.104.110.233'
alias gs='git status'
PATH="/home/dean/bin:$PATH"
NT_PATH="$HOME/.nt_path"

cd /home/deanw/git
if [ -f $NT_PATH ]; then
    path=`cat $NT_PATH`
    cd "$path"
fi

nt () {
    next_task "$@"
    path=`task_code_to_project_repo "$1"`
    cd $path
    echo "$path" > $NT_PATH
}

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

vv() {
    v_shortcut "resources/views/" "$@"
}
# Tab completion for vcsv
_vv()
{
    _fullpath "resources/views"
    _complete "$@"
}
complete -F _vv -o nospace vv

vc() {
    v_shortcut "app/Http/Controllers/" "$@"
}
# Tab completion for vcsv
_vc()
{
    _fullpath "app/Http/Controllers"
    _complete "$@"
}
complete -F _vc -o nospace vc

vf() {
    v_shortcut "app/Forms/" "$@"
}
# Tab completion for vcsv
_vf()
{
    _fullpath "app/Forms"
    _complete "$@"
}
complete -F _vf -o nospace vf

vl() {
    v_shortcut "resources/lang/en/" "$@"
}
# Tab completion for vcsv
_vl()
{
    _fullpath "resources/lang/en"
    _complete "$@"
}
complete -F _vl -o nospace vl

vm() {
    v_shortcut "app/Models/" "$@"
}
# Tab completion for vcsv
_vm()
{
    _fullpath "app/Models"
    _complete "$@"
}
complete -F _vm -o nospace vm

vp() {
    v_shortcut "database/seeders/Permissions/" "$@"
}
# Tab completion for vcsv
_vp()
{
    _fullpath "database/seeders/Permissions"
    _complete "$@"
}
complete -F _vp -o nospace vp

ve() {
    v_shortcut "resources/exports/" "$@"
}
# Tab completion for vcsv
_ve()
{
    _fullpath "resources/exports"
    _complete "$@"
}
complete -F _ve -o nospace ve

vcsv() {
    v_shortcut "resources/lang/en/csv/" "$@"
}
# Tab completion for vcsv
_vcsv()
{
    _fullpath "resources/lang/en/csv"
    _complete "$@"
}
complete -F _vcsv -o nospace vcsv

# Helpers
v_shortcut() {
    prefix="$1"
    shift;
    prefix_files "$prefix" "$@"
    v ${files[*]}
}
prefix_files() {
    prefix="$1"
    shift
    files=$(echo " $@" | sed "s| | /home/$USER/git/"`get_project_from_current_directory`"/$prefix|g")
}
_fullpath() {
    dir="/home/$USER/git/"`get_project_from_current_directory`"/$1"
}
_complete() {
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$dir" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $dir/$file ]]; then
            file=$file/
        else
            file="$file "
        fi
        COMPREPLY[i]="$file"
    done
}
