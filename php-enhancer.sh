#!/bin/bash

cd packages
tar -xzf autoconf-2.69.tar.gz
tar -xzf libtool-2.4.6.tar.gz
tar -xzf freetype-2.5.5.tar.gz
tar -xzf jpegsrc.v6b.tar.gz
tar -xzf libgd-GD_2_0_33.tar.gz
tar -xzf libmcrypt-2.5.8.tar.gz
tar -xzf libpng-1.6.16.tar.gz
tar -xzf php-5.5.20.tar.gz

cd php-5.5.20
./configure '--prefix=/usr' '--mandir=/usr/share/man' '--infodir=/usr/share/info' '--sysconfdir=/private/etc' '--with-apxs2=/usr/sbin/apxs' '--enable-cli' '--with-config-file-path=/etc' '--with-config-file-scan-dir=/Library/Server/Web/Config/php' '--with-libxml-dir=/usr' '--with-openssl=/usr' '--with-kerberos=/usr' '--with-zlib=/usr' '--enable-bcmath' '--with-bz2=/usr' '--enable-calendar' '--disable-cgi' '--with-curl=/usr' '--enable-dba' '--with-ndbm=/usr' '--enable-exif' '--enable-fpm' '--enable-ftp' '--with-icu-dir=/usr' '--with-ldap=/usr' '--with-ldap-sasl=/usr' '--with-libedit=/usr' '--enable-mbstring' '--enable-mbregex' '--with-mysql=mysqlnd' '--with-mysqli=mysqlnd' '--without-pear' '--with-pear=no' '--with-pdo-mysql=mysqlnd' '--with-mysql-sock=/var/mysql/mysql.sock' '--with-readline=/usr' '--enable-shmop' '--with-snmp=/usr' '--enable-soap' '--enable-sockets' '--enable-sysvmsg' '--enable-sysvsem' '--enable-sysvshm' '--with-tidy' '--enable-wddx' '--with-xmlrpc' '--with-iconv-dir=/usr' '--with-xsl=/usr' '--enable-zip'
make clean
make
make install

cd ../libtool-2.4.6
./configure
make clean
make
make install

cd ../autoconf-2.69
./configure
make clean
make
make install

cd ../freetype-2.5.5
./configure --enable-shared
make clean
make
make install

cd ../jpeg-6b
./configure --enable-shared --enable-static
ln -s /usr/local/bin/libtool libtool
make clean
make
make install

cd ../libgd-GD_2_0_33
./configure --enable-shared
make clean
make
make install

cd ../libmcrypt-2.5.8
./configure --enable-shared
make clean
make
make install

cd ../libpng-1.6.16
./configure --enable-shared
make clean
make
make install

cd ../php-5.5.20/ext/gd
phpize
./configure --with-jpeg-dir=/usr/local --with-freetype-dir=/usr/local --with-png-dir=/usr/local
make clean
make
make install

cd ../mcrypt
phpize
./configure
make clean
make
make install

cd ../pcntl
phpize
./configure
make clean
make
make install

echo "" >> /etc/php.ini
echo "extension=gd.so" >> /etc/php.ini
echo "extension=mcrypt.so" >> /etc/php.ini
echo "extension=pcntl.so" >> /etc/php.ini
echo "" >> /etc/php.ini

