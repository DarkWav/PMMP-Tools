#!/bin/bash
DIR="$(cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd "$DIR"
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
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
./bin/php7/bin/php composer.phar install
./start.sh
perl -pi -w -e 's{enable-dev-builds: false}{enable-dev-builds: true}g' ./pocketmine.yml
./start.sh
