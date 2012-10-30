ISUCON#2 のセットアップ

OS
==

yum
---

    yum/install

user
----

    make -C user ISUCON_GROUP=blahblahblah

visudo
------

wheel はパスワードなしにておきます。
requiretty はコメントアウトしておきます。

other
-----

* root のパスワードを簡単なものにしておく
* newgrp で isucon にしてから作業する
* ulimit 系なら /etc/security/limits.conf で増やす

Middle Ware
===========

nginx
-----

    make -C bundle/nginx

daemontools
-----------

    make -C bundle/daemontools

memcached
---------

    make -C bundle/memcached

service/memcached
-----------------

    make -C service memcached

service/starman
---------------

    make -C service starman

service/git
-----------

    make -C service git

Configuration
=============

mysql
-----

`etc/mysql.conf/my.cnf`, いまのところ slow_query_log を出すくらいです。

nginx
-----

`etc/nginx.conf/nginx.conf`, プロキシしたり、ログとったり、memcached 使ったりします。

Perl Modules
============

Cache
-----

Perl から memcached へのインタフェースです。

Starman::Server
---------------

Plack エンコード後にキャッシュします。

Tools
=====

bin/clear_nginx_log
-------------------

解析しやすいように nginx の logs を世代交代します。

bin/parse_access_log
--------------------

nginx のログからリクエストの比率を見たり、時間がかかる URL を調べたりします。

bin/clear_starman_log
---------------------

解析しやすいように starman の log/main を世代交代します。


