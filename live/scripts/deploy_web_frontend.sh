#!/bin/bash
yum update -y

# Instalar web server
amazon-linux-extras install -y php7.4
yum install httpd mysql php-devel php-pear php-mbstring php-imagick php-gd -y

# Inicar Apache
systemctl start httpd

# Deplegar App Web
cd /tmp
wget http://us-east-1-aws-training.s3.amazonaws.com/self-paced-lab-4/examplefiles-as.zip
unzip examplefiles-as.zip
mv examplefiles-as/* /var/www/html 