usage:
	@echo make "<memcached|starman|git>"

memcached:
	sudo rsync -av memcached.d/ /service/.memcached
	sudo chown -R root:root /service/.memcached
	sudo mv /service/{.,}memcached

starman:
	@echo starman
	rsync -av starman/ /service/.starman
	sudo chown -R root:root /service/.starman
	sudo chown -R logadmin:logadmin /service/.starman/log
	mv /service/{.,}starman

git:
	@echo git
	rsync -av git/ /service/.git
	sudo chown -R root:root /service/.git
	mv /service/{.,}git

