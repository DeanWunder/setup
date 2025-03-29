alias awsapp='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@54.79.118.220'
alias awsdb='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@3.104.110.233'
alias gs='git status'
PATH="/home/dean/bin:$PATH"
NT_PATH="$HOME/.nt_path"
NT_BRANCH="$HOME/.nt_branch"

cd /home/deanw/git
if [ -f $NT_PATH ]; then
    path=`cat $NT_PATH`
    cd "$path"
fi

# r: Reset (clear terminal)
r () {
    branch=`cat ~/.nt_branch`
    repo=`task_code_to_project_repo $branch`
    cd "$repo"
    clear
}

ntq () {
    next_task "$@" --quick
    path=`task_code_to_project_repo "$1"`
    cd $path
    echo "$path" > $NT_PATH
}

nt () {
    path=`task_code_to_project_repo "$1"`
    cd $path
    echo "$path" > $NT_PATH
    echo "$1" > $NT_BRANCH
    next_task "$@"
}

vim () {
    if [ -z "$@" ]; then
        ~/neovim/build/bin/nvim
    fi
    cd "$1" 2> /dev/null || ~/neovim/build/bin/nvim "$@"
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

# vim repo root
_() {
    v_shortcut "." "$@"
}
__()
{
    _fullpath "."
    _complete "$@"
}
complete -F __ -o nospace _

# vim view
vv() {
    v_shortcut "resources/views" "$@"
}
_vv()
{
    _fullpath "resources/views"
    _complete "$@"
}
complete -F _vv -o nospace vv

# vim controller
vc() {
    v_shortcut "app/Http/Controllers" "$@"
}
_vc()
{
    _fullpath "app/Http/Controllers"
    _complete "$@"
}
complete -F _vc -o nospace vc

# vim form
vf() {
    v_shortcut "app/Forms" "$@"
}
_vf()
{
    _fullpath "app/Forms"
    _complete "$@"
}
complete -F _vf -o nospace vf

# vim lang
vl() {
    v_shortcut "lang/en" "$@"
}
_vl()
{
    _fullpath "lang/en"
    _complete "$@"
}
complete -F _vl -o nospace vl

# vim model
vm() {
    v_shortcut "app/Models" "$@"
}
_vm()
{
    _fullpath "app/Models"
    _complete "$@"
}
complete -F _vm -o nospace vm

# vim permission
vp() {
    v_shortcut "database/seeders/Permissions" "$@"
}
_vp()
{
    _fullpath "database/seeders/Permissions"
    _complete "$@"
}
complete -F _vp -o nospace vp

# vim export
ve() {
    v_shortcut "resources/exports" "$@"
}
_ve()
{
    _fullpath "resources/exports"
    _complete "$@"
}
complete -F _ve -o nospace ve

# vim csv export
vcsv() {
    v_shortcut "resources/lang/en/csv" "$@"
}
_vcsv()
{
    _fullpath "resources/lang/en/csv"
    _complete "$@"
}
complete -F _vcsv -o nospace vcsv

# vim migration
vmi() {
    v_shortcut "database/migrations" "$@"
}
_vmi()
{
    _fullpath "database/migrations"
    _complete "$@"
}
complete -F _vmi -o nospace vmi

# vim notification
vn() {
    v_shortcut "database/seeders/Notifications" "$@"
}
_vn()
{
    _fullpath "database/seeders/Notifications"
    _complete "$@"
}
complete -F _vn -o nospace vn

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
    files=$(echo " $@" | sed "s| | /home/$USER/git/"`get_project_from_current_directory`"/$prefix/|g")
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

apollo() { v "$HOME/git/apollo"; }
assets() { v "$HOME/git/assets"; }
assignee() { v "$HOME/git/assignee"; }
azure() { v "$HOME/git/azure"; }

    echo "$1" > $NT_BRANCH
bai() { v "$HOME/git/bai"; echo "BAI-1111" > $NT_BRANCH; echo "$HOME/git/bai" > $NT_PATH; }
base() { v "$HOME/git/base"; }
cts() { v "$HOME/git/cts"; echo "CTS-1111" > $NT_BRANCH; echo "$HOME/git/cts" > $NT_PATH; }
dynmenu() { v "$HOME/git/dynmenu"; }
filemanager() { v "$HOME/git/filemanager"; }
fql() { v "$HOME/git/fql"; }
history() { v "$HOME/git/history"; }
instrumentation() { v "$HOME/git/instrumentation"; }
jenkinstoolkit() { v "$HOME/git/jenkinstoolkit"; }
lightsaml() { v "$HOME/git/lightsaml"; }
linbeck() { v "$HOME/git/linbeck"; echo "LIN-1111" > $NT_BRANCH; echo "$HOME/git/linbeck" > $NT_PATH; }
metro() { v "$HOME/git/metro"; echo "MET-1111" > $NT_BRANCH; echo "$HOME/git/metro" > $NT_PATH; }
notifications() { v "$HOME/git/notifications"; }
permissions() { v "$HOME/git/permissions"; }
postmark() { v "$HOME/git/postmark"; }
prime() { v "$HOME/git/prime"; echo "PRIM-1111" > $NT_BRANCH; echo "$HOME/git/prime" > $NT_PATH; }
procoresocialiteprovider() { v "$HOME/git/procoresocialiteprovider"; }
restapi() { v "$HOME/git/restapi"; }
rms() { v "$HOME/git/rms"; echo "TFNSW-1111" > $NT_BRANCH; echo "$HOME/git/rms" > $NT_PATH; }
search() { v "$HOME/git/search"; }
smsloneworker() { v "$HOME/git/smsloneworker"; }
sso-redirector() { v "$HOME/git/sso-redirector"; }
support() { v "$HOME/git/support"; }
swconnect() { v "$HOME/git/swconnect"; echo "SWC-1111" > $NT_BRANCH; echo "$HOME/git/swconnect" > $NT_PATH; }
swdeliveryv2() { v "$HOME/git/swdeliveryv2"; echo "SWD-1111" > $NT_BRANCH; echo "$HOME/git/swdeliveryv2" > $NT_PATH; }
workflow() { v "$HOME/git/workflow"; }
zipper() { v "$HOME/git/zipper"; }

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
