usage:
	@echo make "<memcached|starman|git>"

memcached:
	sudo rsync -a memcached.d/ /service/.memcached
	sudo chown -R root:root /service/.memcached
	sudo mv /service/{.,}memcached

starman:
	sudo rsync -a starman.d/ /service/.starman
	sudo chown -R root:root /service/.starman
	sudo chown -R logadmin:logadmin /service/.starman/log
	sudo mv /service/{.,}starman

git:
	sudo rsync -a git.d/ /service/.git
	sudo chown -R root:root /service/.git
	sudo mv /service/{.,}git

