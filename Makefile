
WEB_SERVER:=www.christmascoder.com

all:
	echo call specific targets

installkey: FORCE
	ssh-copy-id root@$(WEB_SERVER)

# SSH not working, env problems:
deployweb:
	ssh root@$(WEB_SERVER) "bash -l -c '/opt/nodejs/bin/pm2 stop hmxweb'"
	rsync -avg hmxweb root@$(WEB_SERVER):
	ssh root@$(WEB_SERVER) "bash -l -c '/opt/nodejs/bin/pm2 start hmxweb'"

deployweb:
	rsync -avg hmxweb root@$(WEB_SERVER):
