echo "" > /etc/modprobe.d/raspi-blacklist.conf
BASEDIR=$(dirname $0)
nohup bash $BASEDIR/util/deps.sh &> $BASEDIR/util/deps.log &
sleep 5
sudo modprobe i2c-dev
sudo modprobe i2c-bcm2708
sleep 5
sudo modprobe i2c-dev
sudo modprobe i2c-bcm2708
sleep 5
ls /dev/i2c*
cat /etc/modules
lsmod
sudo i2cdetect -y 1
cd /home/pi/pi
upgradeflag=/home/pi/ideal.upgrade
#if [ $? -ne 0 ]; then
#    shutdown -r now
#fi
if [ -f $upgradeflag ]; then
    # grab software
    echo "Requesting software from git repository..."
    git fetch --all
    git reset --hard origin/master
    sleep 5
    sudo rm $upgradeflag
fi
. $HOME/.profile
node server.js
