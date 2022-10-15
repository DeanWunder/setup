alias awsapp='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@54.79.118.220'
alias awsdb='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@3.104.110.233'
alias gs='git status'
PATH="/home/dean/bin:$PATH"

vim() {
    vim.gtk3 "$@";
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
