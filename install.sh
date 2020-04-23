#!/usr/bin/env bash

#PLEASE
#DO
#NOT
#USE
# THIS SHIT
#STILL UNDER DEVELOPMENT.

#WORKING_DIR="$(cd "$(dirname "$0")" ; pwd -P)"
#TOOLS_PATH="$WORKING_DIR/tools"
#WORDLIST_PATH="$WORKING_DIR/wordlists"

actualizar(){
  sudo apt-get update -y
  sudo apt-get upgrade -y
  sudo apt-get autoremove -y
  sudo apt clean
}
setupTools(){
    installBanner "setup tools"
    INSTALL_PKGS="git python python-pip python3 python3-pip libldns-dev gcc g++ make libpcap-dev xsltproc curl"
    for i in $INSTALL_PKGS; do
        sudo apt-get install -y $i
    done
}
golang(){
  sudo apt-get install -y golang
  export GO111MODULE=on
}

todolodemas(){
    mkdir tools
    sudo apt-get install -y chromium
    sudo apt-get install -y jq
    npm install uniq
    git clone https://github.com/aboul3la/Sublist3r.git && cd Sublist3r && sudo pip install -r requirements.txt && cd ..
    if [ -e ~/go/bin/amass ]; then
        echo -e "${BLUE}[!] Amass already exists...\n${RESET}"
    else
        go get -u github.com/OWASP/Amass/...
    fi

    if [ -e ~/go/bin/subfinder ]; then
        echo -e "${BLUE}[!] Subfinder already exists...\n${RESET}"
    else
        go get -u github.com/subfinder/subfinder
        echo -e "${RED}[+] Setting up API keys for subfinder...${RESET}"
        # Set your API keys here
        ~/go/bin/subfinder --set-config VirustotalAPIKey=0b58744c20df70327d8b8c23606df2cbd2720895a0abeb1ff6ccceab27aa5888
        ~/go/bin/subfinder --set-config PassivetotalUsername=apikey
        ~/go/bin/subfinder --set-config SecurityTrailsKey=API-KEY-HERE
        ~/go/bin/subfinder --set-config RiddlerEmail=
        ~/go/bin/subfinder --set-config CensysUsername=
        ~/go/bin/subfinder --set-config ShodanAPIKey=5u7WWpRiUseR5G5kMSFZDVE2CSVPWkmU
    fi
    go get -u github.com/tomnomnom/httprobe
    go get -u github.com/lc/gau
    go get -u github.com/tomnomnom/concurl
    go get -u github.com/ericchiang/pup
    if [ "$(ls -A $TOOLS_PATH/dirsearch 2>/dev/null)" ]; then
        echo -e "${BLUE}[!] Dirsearch already exists...\n${RESET}"
    else
        cd $TOOLS_PATH
        git clone https://github.com/maurosoria/dirsearch
        cd $WORKING_DIR
    fi

    git clone https://github.com/yassineaboukir/Asnlookup && cd Asnlookup
    pip install -r requirements.txt
    wait 2
    echo"Sign up for a free account on Maxmind: https://www.maxmind.com/en/geolite2/signup"
    wait 2
    echo"Sign in and browse to https://www.maxmind.com/en/accounts/1 > My License Key > Generate new license key > Check No for Will this key be used for GeoIP Update?."
    wait 2
    echo"Open config.py with a text editor, and replace key_here placeholder with the license key you generated."
    cd $TOOLS_PATH
}



#actualizar
#setupTools
#todolodemas

echo "please do not use this install directly. Better you see inside what u need. Just copy and paste."
