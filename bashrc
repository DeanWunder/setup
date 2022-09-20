alias awsapp='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@54.79.118.220'
alias awsdb='ssh -i ~/DeanRoot.pem -p 9113 ubuntu@3.104.110.233'
PATH="$PATH:/home/dean/bin"

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
