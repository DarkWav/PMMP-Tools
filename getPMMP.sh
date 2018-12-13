#!/bin/bash
DIR="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$DIR"
echo "###########################"
echo "# getPMMP v1.1 by DarkWav #"
echo "###########################"
git clone https://github.com/pmmp/PocketMine-MP.git --recursive
mkdir "temp"
cd temp
wget -q -O - https://get.pmmp.io | bash -s -
cp -R ./bin ../PocketMine-MP/bin
cd ../
rm -r temp
cd PocketMine-MP
rm ./start.sh
wget https://raw.githubusercontent.com/DarkWav/PMMP-Tools/master/start.sh
chmod +x ./start.sh
wget -O 'composer-setup.php' 'https://getcomposer.org/installer'
./bin/php7/bin/php composer-setup.php
rm composer-setup.php
./bin/php7/bin/php composer.phar install
./start.sh
perl -pi -w -e 's{enable-dev-builds: false}{enable-dev-builds: true}g' ./pocketmine.yml
./start.sh
