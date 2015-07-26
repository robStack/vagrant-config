#!/usr/bin/env bash
echo ">_ Actualizando el sistema"
sudo yum -y update

echo ">_ Instalando lo básico"
sudo yum -y install nano vim git-core wget unrar unzip

echo ">_ Instalando Apache"
sudo yum -y install httpd

echo ">_ Configurando directorio de Apache"
sudo rm -rf /var/www
sudo ln -fs /vagrant/html /var/www/html

echo ">_ Iniciando Apache..."
sudo service httpd start

echo ">_ Instalando MySQL"
sudo yum -y install mysql-server mysql-client

echo ">_ Instalando PHP 5.4"
sudo rpm -Uvh http://repo.webtatic.com/yum/el6/latest.rpm
sudo yum -y update
sudo yum -y install php54w

echo ">_ Reiniciando Apache..."
sudo service httpd restart

echo ">_ Instalando PHPMyAdmin"
sudo yum -y install phpmyadmin

echo ">_ Instalando Composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo ">_ Instalación finalizada :)"