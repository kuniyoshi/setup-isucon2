OS
==

yum
---

    yum/install

各 OS で実行します。

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
* selinux は disabled がいいかも
* iptables を確認する

Middleware
==========

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

戦略
====

初期環境設定
------------

まずは ssh 環境を整えます。

バックアップ
------------

大事です。コードと静的ファイル、データベースなどを保存します。

最初の測定
----------

もらった環境で、いちど測定しておきます。

ミドルウェア周りの設定
----------------------

daemontools に慣れているので、daemontools をインストールします。
nginx じゃなかったら、nginx に変えます。
memcached がなかったり、他の KVS だったりした場合は memcached に切り替えます。

