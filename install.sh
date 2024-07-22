#!/usr/bin/bash

#Automatic Linux setup scripelif [ $choice -eq 2 ];then


#basic pkg
bpkg=("htop" "sdfsfs" "neofetch" "gh" "git" "wget" "curl" "openssh" "tmate" "tmux" "python3")

#kernelpkg
kpkg=("bc" "flex" "make" "clang" "build-essential")

#colors
red="\033[1;31m"
blue="\033[1;34m"
green="\033[1;32m"
grey="\033[1;90m"
yellow="\033[1;93m"
purple="\033[1;35m"
brown="\033[1;33m"
cyan="\033[1;36m"
reset="\033[1;0m"
blink="\033[1;5m"
us="\033[1;4m"
bold="\033[1;1m"


#echo -e "$red red $blue blue $green green $yellow yellow $reset reset $blink blink $reset $us us $bold bold"

function pkgm () {
        if [ $(command -v apt) ];then
                apt install $1 -y
        elif [ $(command -v pacman) ];then
                pacman -Sy $1
        elif [ $(command -v dnf) ];then
                dnf -s $1
        else
                echo -e "$blue[$red-$blue]$yellow Cannot Find Package Manager!"
        fi
        }
function install_pkg () {
for pkg in ${cpkg[@]}; do
  f=`command -v $pkg`
  echo -en "$bold $pkg\t\t $purple ---->\t\t"
  if [ $f ];then
	  echo "$green Found!"
  else
	  echo -e "$red Not Found!"
	  pkgm $pkg
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
