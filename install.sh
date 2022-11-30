# oh my zsh bash themes
username="" # put the username here (macOS)

cd
cd Documents
mkdir tools && cd tools


## install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# for idevice OSINT
brew install libimobiledevice
brew install ideviceinstaller

# install pyenv
brew install readline xz openssl zlib
brew install pyenv
brew install pyenv-virtualenv
# configure pyenv for zsh
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

pyenv install 3.8.5
pyenv install 2.7.18
pyenv global 3.8.5
pyenv virtualenv 2.7.18 python2 
pyenv virtualenv 3.8.5 python3

git clone https://github.com/MobSF/Mobile-Security-Framework-MobSF.git
cd Mobile-Security-Framework-MobSF
./setup.sh

# or
# pyenv activate python3
# pip install git+https://github.com/iSECPartners/Introspy-Analyzer.git
# cd Mobile-Security-Framework-MobSF
# ./setup.sh

cd ..


# radare2
git clone https://github.com/radare/radare2.git
cd radare2
./sys/install.sh

cd ..

# Mobile tools
pyenv activate python3
pip install frida
pip install frida-tools
pip install objection

brew install npm 
npm install -g passionfruit # might not work properly, has a lot of issues
npm install -g itms-services

pyenv activate python2
pip install drozer

# bug fix
# cd /Users/$username/.pyenv/versions/2.7.18/envs/python2/lib/python2.7/site-packages/pydiesel/reflection/utils/class_loader.py
# change elif relative_to.find(".py") >= 0 or relative_to.find(".pyc") >= 0:
# to elif (relative_to.find(".py") >= 0 or relative_to.find(".pyc") >= 0) and not ".pyenv" in relative_to:


# For iOS pentesting, with the iDevice connected
# Introspy
wget https://github.com/iSECPartners/Introspy-iOS/releases/download/ios-tracer-v0.4/com.isecpartners.introspy-v0.4-iOS_7.deb

scp <package.deb> root@<device_ip>:~
ssh root@<device_ip>
dpkg -i <package.deb>
killall -HUP SpringBoard

wget https://github.com/radareorg/radare2/releases/radare2-aarch64_4.5.1_iphoneos-arm.deb
ssh root@[ip] 
dpkg -i radare2-aarch64_4.5.1_iphoneos-arm.deb

# Clutch
ssh root@[ip] 
cd /usr/bin/
wget https://github.com/KJCracks/Clutch/releases/download/2.0.3/clutch
chmod +x clutch

# For Android, with the Android device connected
git clone https://github.com/iSECPartners/Introspy-Android
cd Introspy-Android
adb install Introspy-Android Core.apk
adb install Introspy-Android Config.apk

# frida server, change to the latest frida version
wget https://github.com/frida/frida/releases/download/12.11.17/frida-server-12.11.17-android-arm64.xz
adb push frida-server-12.11.17-android-arm64.xz /usr/sbin

# Scapy
pyenv activate python3 # [optional] using virtual envs and python3.8.5
pip install pyx
pip install matplotlib
pip install vpython
pip install cryptography

# nmap
brew install nmap

# to show graphs
brew install graphviz
brew cask install xquartz
brew tap tlk/imagemagick-x11
brew install tlk/imagemagick-x11/imagemagick

# run XX to able to see graphs
open /Applications/Utilities/XQuartz.app
export DISPLAY=:0.0

pip install --pre 'scapy[complete]' # the ' is needed when run on MacOSX

# Dshell
git clone https://github.com/USArmyResearchLab/Dshell.git
python3 -m pip install Dshell/
pip install geoip2

wget https://git.io/GeoLite2-ASN.mmdb
wget https://git.io/GeoLite2-City.mmdb
wget https://git.io/GeoLite2-Country.mmdb

cp GeoLite2* /Users/$username/.pyenv/versions/3.9.11/lib/python3.9/site-packages/dshell/data/GeoIP/

# john the ripper
brew install john
cd /opt/homebrew/Cellar # not sure about the path
ln -s /opt/homebrew/Cellar/john/1.9.0_1/libexec john

# download all the scripts
cd && cd Documents/tools
git clone https://github.com/openwall/john.git
# copy all from https://github.com/openwall/john/tree/bleeding-jumbo/run to /opt/homebrew/Cellar/john/1.9.0_1/share/john
cp john/run/* /opt/homebrew/Cellar/john/1.9.0_1/share/john

# install hashcat
brew install hashcat