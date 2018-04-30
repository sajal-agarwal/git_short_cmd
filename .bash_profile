[[ "$-" != *i* ]] && return

alias c='clear'

#git Status
alias s='git status'

alias l='git log'

#Rever Previous Commit
alias rpc='git reset HEAD^1'

#Revert Previous Add
alias rpa='git reset .'

alias mf='git diff --name-only'

#Reset To Master
alias hrtm='git reset --hard origin/master'

#git Add
alias a='git add'

#Add Modified (including deleted)
alias am='git add -u'

#Add All
alias aa='git add -A'

#Commit Modified files (including deleted files)
alias cm='git commit -a'

#Commit Added files
alias ca='git commit'

#Bold text prefix
bold=$(tput bold)

#Normal text prefix
normal=$(tput sgr0)

last_backup_dir_name=""

#Push to Current Branch
function push {
	CUR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	echo "${bold}Pushing changes to $CUR_BRANCH...${normal}"
	if [[ -z "$*" ]]; then
		git push origin HEAD:refs/for/$CUR_BRANCH 2>&1 | tee "$HOME/tmp.txt"
    else
		git push origin HEAD:refs/for/$CUR_BRANCH "$*" 2>&1 | tee "$HOME/tmp.txt"
	fi
	
	#open the gerrit link in browser
	now=0
	while IFS= read line
	do
		if [[ $now == 1 ]]; then
			for word in $line; 
			do 
				if [[ $word == "http://gerrit/"* ]]; then
					start $word
					break
				fi
			done
			break
		fi
		
		if [[ "$line" == "remote: New Changes:"* ]]; then
			now=1
		fi
	done <"$HOME/tmp.txt"
	
	rm "$HOME/tmp.txt"
}

function o {
    TMP_P="$*"
    if [[ -z "$*" ]]
      then TMP_P=`pwd`
    fi
	if [[ -d $TMP_P ]]; then
		explorer "`cygpath -w \"$TMP_P\"`" > /dev/null
	elif [[ -f $TMP_P ]]; then
		notepad++ "`cygpath -w \"$TMP_P\"`" & > /dev/null
	else
		echo "File or Directory does not exist!"
	fi
}
	
function pull {
	echo "${bold}stash in progress...${normal}"
	STASH_MSG=$(git stash)
	echo $STASH_MSG
	echo "${bold}pull in progress...${normal}"
	git pull --rebase
	if ! [ "$STASH_MSG" == "No local changes to save" ]; then
		echo "${bold}stash-pop in progress...${normal}"
		git stash pop
	fi
}

#Commit And Push to current branch
function cap {
	CM="$*"
	if [[ -z "$*" ]]
      then CM="This is a defaut message as user provided none"
    fi
	pull
	echo "${bold}commit in progress...${normal}"
	cm -m $CM
	push
}

#Files In Commit
function fic {
	git diff-tree --no-commit-id --name-only -r $1
}

function fipc {
	git log > "~/tmp.txt"
	line=$(head -n 1 C:/Users/saagarwal/tmp.txt)
	lcid=${line##* }
	fic $lcid
	rm "~/tmp.txt"
}

function bmf {
	mf > "$HOME/tmp.txt"
	
	BD="$1"
	if [[ -z $BD ]]; then
		BD="$HOME/git_backup/`date +%Y%m%d%H%M%S`"
		echo "Backup directory: $BD"
		mkdir -p "$BD"
	fi
	
	last_backup_dir_name=$BD
	
	while IFS='' read -r line || [[ -n "$line" ]]; do
		echo "$line"
		cp $line $BD
	done < $HOME/tmp.txt
	
	rm "$HOME/tmp.txt"
}

#Open the (last) Back-up Directory
function obd {
	if [[ -z $last_backup_dir_name ]]; then
		o "$HOME/git_backup"
	else
		o "$last_backup_dir_name"
	fi
}

#Empty Back-up Directory
function ebd {
	rm -rf "$HOME/git_backup"
}

function dbd {
	if [[ ! -z $last_backup_dir_name ]]; then
		rm -rf "$last_backup_dir_name"
	fi
}

#gerrit push link
function gpl {
	now=0
	while IFS= read line
	do
		if [[ $now == 1 ]]; then
			for word in $line; 
			do 
				if [[ $word == "http://gerrit/"* ]]; then
					start $word
					break
				fi
			done
			break
		fi
		
		if [[ "$line" == "remote: New Changes:"* ]]; then
			now=1
		fi
	done <"$HOME/tmp.txt"
}

#Commit All Files
function caf {
	aa
	ca "$*"
}