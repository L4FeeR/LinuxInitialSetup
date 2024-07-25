#!/usr/bin/bash

#Automatic Linux setup scripelif [ $choice -eq 2 ];then


#basic pkg
bpkg=("htop" "neofetch" "gh" "git" "wget" "curl" "nmtui" "tmate" "tmux" "python3" "libgtk-3-lib" "cmake")

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

function yn () {
	if [ $1 -eq "y" ];then
		return 1
	else
		return 0
	fi
}
function additional_tools () {
	echo -e "$reset Install$blue Ollama$reset..."
	curl -fsSL https://ollama.com/install.sh | sh
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Install$blue ZED$reset..."
	curl -f https://zed.dev/install.sh | sh 
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Install$blue Ollama$reset..."
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Installing $green Snap..."
	pkgm snap
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Installing $green Flutter $reset..."
	sudo snap install flutter --classic
	bash -c flutter --disable-analytics
	bash -c flutter precache
	sudo snap install android-studio --classic
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Installing $green Telegram-Desktop $reset..."
	sudo snap install telegram-desktop
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Installing $green Steam $reset..."
	sudo snap install steam
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Installing $green VSCode $reset..."
	sudo snap install code --classic
	
}




shells=("fish" "zsh" "ksh")















function pkgm () {
        if [ $(command -v apt) ];then
                apt install $1 -y > /dev/null 2>&1
        elif [ $(command -v pacman) ];then
                pacman -Sy $1 > //dev/null 2>&1
        elif [ $(command -v dnf) ];then
                dnf install $1 > /dev/null 2>&1
        else
                echo -e "$blue[$red-$blue]$yellow Cannot Find Package Manager!"
        fi
        }
function install_pkg () {
for pkg in ${cpkg[@]}; do
  f=`command -v $pkg`
  echo -en "$bold $pkg\t\t $purple ---->\t\t"
  if [ $f ];then
	  echo -e "$green Found!"
  else
	  echo -e "$red Not Found!"
	  pkgm $pkg
	  if [ `command -v $pkg` ];then
		  echo -e "\t\t$green Installed."
		else
			echo -e "\t\t$red Failed TO Install"
	  fi
	  fi
	done
}

install_pkg

function main() {
	sleep 1.5
clear
echo -e "	$us	Installer Menu"
echo -e "$reset"
echo -e "$brown		1. $purple Base Packages"
echo -e "$brown		2. $purple Kernel Build Packages"
echo -e "$brown		3. $purple Additional Development Tools."
#echo -e "$brown		4. $purple Add shortcuts"
echo -e "$brown		4. $purple Install All Shells"
echo -e "$brown		5. $purple Zorin OS Setup"
echo -e "$brown		o  $purple Exit"
echo ""
echo -ne "$green[$yellow+$green] $cyan Enter your choice : "
read choice

if [ $choice == 1 ];then
	cpkg=${bpkg[@]}
	install_pkg
	main
elif [ $choice -eq 2 ];then
	cpkg=${kpkg[@]}
	install_pkg
	main
elif [ $choice -eq 3 ];then
	cd $HOME
	additional_tools
	main
elif [ $choice -eq 4 ];then
	cpkg=${shells[@]}
	install_pkg
	main
elif [ $choice -eq 5 ];then
	sudo apt update
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Updating $Repository $reset..."
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Upgrading $green System $reset..."
	sudo apt upgrade -y
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Adding $green Repository $reset..."
	sudo add-apt-repository ppa:kelebek333/kablosuz
	sudo apt update
	sleep 1;echo -e "\n\n\n"
	echo -e "$reset Installing $green RTL8188EUS Driver$reset..."

	sudo apt install rtl8188eus-dkms
else
	echo "[-]Exiting from the script!"
	return 0
fi





function install_pkg () {
for pkg in ${cpkg[@]}; do
  f=`command -v $pkg`
  echo -en "$pkg\t\t---->\t\t"
  if [ $f ];then
	  echo -e "$green Found!"
  else
	  echo -e "$red Not Found!"
  fi
  sleep 1
	done
}

}

main
