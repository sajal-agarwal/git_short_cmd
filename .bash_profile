[[ "$-" != *i* ]] && return

alias c='clear'

#git Status
alias s='git status'

#Tortoise Status
alias ts='TortoiseGitProc /command:diff /path:. &'

#git log
alias l='git log'

#Tortoise Log
alias tl='TortoiseGitProc /command:log /path:. &'

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

#Commit Added files
alias ca='git commit'

#Return if the output of previous command is not zero
alias return_if_not_0='RES=$?; if [ $RES != 0 ]; then return $RES; fi'

#Bold text prefix
bold=$(tput bold)

#Normal text prefix
normal=$(tput sgr0)

last_backup_dir_name=""

#Commit Modified files (including deleted files)
function cm {
	if [ "$*" != "" ]; then
		echo "${bold}Committinging all modified and deleted files...${normal}"
		git commit -a "$*"
		return_if_not_0
	fi
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
	MFILES=$(mf)
	
	if [ "$MFILES" != "" ]; then
		bmf
		return_if_not_0
		
		echo "${bold}stash in progress...${normal}"
		STASH_MSG=$(git stash)
		echo $STASH_MSG
		return_if_not_0
	fi
		
	echo "${bold}pull in progress...${normal}"
	git pull --rebase
	return_if_not_0
	
	if [ "$MFILES" != "" ]; then
		stash_pop_ok=1
		if ! [ "$STASH_MSG" == "No local changes to save" ]; then
			echo "${bold}stash-pop in progress...${normal}"
			git stash pop 2>&1 | tee "$HOME/tmp.txt"
			return_if_not_0
			
			#check if mearging not required
			stash_pop_ok=0
			while IFS= read line
			do
				if [[ $line == "Dropped refs/stash@{0} "* ]]; then
					stash_pop_ok=1
					break
				fi
			done <"$HOME/tmp.txt"
			
			rm "$HOME/tmp.txt"
		fi
	
		if [[ $stash_pop_ok == 1 ]]; then
			echo "${bold}deleting backing-up directory...${normal}"
			dbd
		else
			return 1
		fi
	fi
}

function pcb {
	CUR_BRANCH=$(git rev-parse --abbrev-ref HEAD)
	return_if_not_0
	
	echo "${bold}Pushing changes to $CUR_BRANCH...${normal}"
	
	if [[ -z "$*" ]]; then
		git push origin HEAD:refs/for/$CUR_BRANCH 2>&1 | tee "$HOME/tmp.txt"
		return_if_not_0
    else
		git push origin HEAD:refs/for/$CUR_BRANCH "$*" 2>&1 | tee "$HOME/tmp.txt"
		return_if_not_0
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

#Push to Current Branch
function push {
	files_found=0
	commit_msg_found=0
	commit_msg=""
	file_names=()
	
	for arg in "$@"
	do
		if [[ "$arg" == "-"* ]]; then
			files_found=0
		fi
		
		if [ $files_found == 1 ]; then
			file_names+=("$arg")
		fi
		
		if [ $commit_msg_found == 1 ]; then
			commit_msg="$arg"
			commit_msg_found=0
		fi	
		
		if [ "$arg" == "-a" ]; then
			files_found=1
		fi
		
		if [ "$arg" == "-m" ]; then
			commit_msg_found=1
		fi	
	done
	
	if [ "$commit_msg" != "" ]; then
		pull
		return_if_not_0
		if [ ${#file_names[@]} -ne 0 ]; then
			echo "${bold}Adding files...${normal}"
			for file in "${file_names[@]}"
			do
			   echo "$file"
			   a "$file"
			   return_if_not_0
			done
			echo "${bold}Committinging added files...${normal}"
			ca -m $commit_msg
			return_if_not_0
		else
			cm -m $commit_msg
			return_if_not_0
		fi
	elif [ ${#file_names[@]} -ne 0 ]; then
		echo "Please provide the commit meesage with -m ..."
		return 1
	fi
	
	pcb
}

#Files In Commit
function fic {
	git diff-tree --no-commit-id --name-only -r $1
	return_if_not_0
}

function fipc {
	git log > "~/tmp.txt"
	return_if_not_0
	line=$(head -n 1 C:/Users/saagarwal/tmp.txt)
	lcid=${line##* }
	fic $lcid
	rm "~/tmp.txt"
}

function bmf {
	mf > "$HOME/tmp.txt"
	return_if_not_0
	
	if [ -s "$HOME/tmp.txt" ]; then
		echo "${bold}Backing-up modified files...${normal}"
	
		BD="$1"
		if [[ -z $BD ]]; then
			BD="$HOME/git_backup/`date +%Y%m%d%H%M%S`"
			echo "Backup directory: $BD"
			mkdir -p "$BD"
			return_if_not_0
		fi
		
		last_backup_dir_name=$BD
		
		while IFS='' read -r line || [[ -n "$line" ]]; do
			echo "$line"
			cp $line $BD
			return_if_not_0
		done < $HOME/tmp.txt
	else
		echo "Nothing to backup..."
	fi

	rm "$HOME/tmp.txt"
	return_if_not_0
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
		return_if_not_0
		last_backup_dir_name=""
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

function myTestFunc {
	git add c
	return_if_not_0
}