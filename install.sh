#!/bin/bash
wd=`pwd`
echo PATH=\$PATH:`pwd`/bin:`pwd`/scripts > .path;
cd .. && git clone git@github.com:Brownbr32/.journal.git && ln -s `pwd`/.journal ~/.personal;
cd $wd
mkdir ~/Downloads/deb
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y && sudo apt upgrade -y
sudo apt install vim brave-browser nmap grun -y

sudo add-apt-repository ppa:appimagelauncher-team/stable && sudo apt update -y && sudo apt install appimagelauncher -y

curl -s https://api.github.com/repos/brrd/Abricotine/releases/latest | grep "browser_download_url.*deb" | grep x64 | cut -d : -f 2,3 | tr -d \" | wget -qi - && mv *.deb ~/Downloads/deb/abricotine-ub2.deb && sudo apt install ~/Downloads/deb/abricotine-ub2.deb
echo "source $wd/.path"
echo "source $wd/.alias"
