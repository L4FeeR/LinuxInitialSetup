#!/usr/bin/bash

#Automatic Linux setup scripelif [ $choice -eq 2 ];then


#basic pkg
bpkg=("htop" "sdfsfs" "neofetch" "gh" "git" "wget" "curl" "openssh" "tmate" "tmux" "python3")

#kernelpkg
kpkg=("bc" "flex" "make" "clang" "build-essential")


function install_pkg () {
for pkg in ${cpkg[@]}; do
  f=`command -v $pkg`
  echo -en "$pkg\t\t---->\t\t"
  if [ $f ];then
	  echo "Found!"
  else
	  echo "Not Found!"
  fi
	done
}

install_pkg

function main() {
echo "		Installer Menu"
echo ""
echo "		1. Base Packages"
echo "		2. Kernel Build Packages"
echo "		3. Ollama -The Offline AI"
echo "		4. Add shortcuts"
echo "		5. Install All Shells"
echo "		o  Exit"
echo ""
read -p "[+]Enter your choice : " choice


if [ $choice -eq 1 ];then
	cpkg=${bpkg[@]}
	install_pkg
	main
elif [ $choice -eq 2 ];then
	cpkg=${kpkg[@]}
	install_pkg
	main
elif [ $choice -eq 3 ];then
	cd $HOME && ls
	main
else
	echo "[-]Exiting from the script!"
	return 0
fi





function install_pkg () {
for pkg in ${cpkg[@]}; do
  f=`command -v $pkg`
  echo -en "$pkg\t\t---->\t\t"
  if [ $f ];then
	  echo "Found!"
  else
	  echo "Not Found!"
  fi
  sleep 1
	done
}

}
main
