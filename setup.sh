PROMPT="[SETUP]" 

# initial prompt
link (){
	echo "$PROMPT would like to symlink files from this folder to your root"
	echo "$PROMPT Proceed? "
	read resp
	if [ $resp == "y" ] || [ $resp =="Y" ] 
	then 
		for file in $(ls -A | grep -vf .exclude ) ; do
			echo "Creating symlink to $file"			
			ln -s "$PWD/$file" "$HOME/$file" 
		done
		echo "$PROMPT symlink complete"
	else
		echo "$PROMPT symlink cancelled"
		return 1
	fi 
}

installVundle (){
	echo "$PROMPT would like to install Vundle"
	echo "$PROMPT Proceed? "
	read resp
	if [ $resp == "y" ] || [ $resp =="Y" ] 
	then 
		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
		echo "$PROMPT install complete"
	else
		echo "$PROMPT install failed"
		return 1
	fi 
}

link
installVundle
