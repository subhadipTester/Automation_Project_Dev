#!/bin/bash
sudo apt update -y
REQUIRED_PKG="apache2"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep "install ok installed")
echo Checking for $REQUIRED_PKG: $PKG_OK
if [ "" = "$PKG_OK" ]; then
  echo "No $REQUIRED_PKG. Setting up $REQUIRED_PKG."
  sudo apt-get install $REQUIRED_PKG;
fi
sudo systemctl start apache2.service
sudo systemctl status apache2.service -q
sudo systemctl stop apache2.service
sudo systemctl restart apache2.service
sudo systemctl is-enabled apache2.service
sudo systemctl is-active apache2.service
sudo systemctl status apache2.service -q
myname="Subhadip"
timestamp=$(date '+%d%m%Y-%H%M%S')
sudo tar -cvf "${myname}--httpd-logs-${timestamp}.tar" /var/log/apache2/
cp *.tar /tmp/
sudo apt-get update
sudo apt-get install awscli -y
aws --version
aws s3 ls s3://upgrad-subhadip
s3_bucket="upgrad-subhadip"
aws s3 cp /tmp/${myname}--httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}--httpd-logs-${timestamp}.tar
