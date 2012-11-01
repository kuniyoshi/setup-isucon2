#!/bin/sh
LIBEVENT=libevent-2.0.20-stable
MEMCACHED=memcached-1.4.15

yum erase -y libevent-devel

tar zxf ${LIBEVENT}.tar.gz
cd ${LIBEVENT}
./configure --prefix=/usr/local/libevent
make && make install
cd -
ldconfig /usr/local/libevent
rm -Rf ${LIBEVENT}

tar zxf ${MEMCACHED}.tar.gz
cd $MEMCACHED
./configure --prefix=/usr/local/memcached --with-libevent=/usr/local/libevent
make && make install
cd -
rm -Rf ${MEMCACHED}
