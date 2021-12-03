## Installation

### Prerequisites

#### Node JS

Install nodejs version 12.18.0.  Note that some dependencies do not compile in some later versions of node, so do not be surprised if you get a problem in the "npm install" step with other nodejs versions!

```
export NODEJS_VER=v12.18.0
wget https://nodejs.org/dist/${NODEJS_VER}/node-${NODEJS_VER}-linux-x64.tar.xz /tmp
cd /opt
sudo tar xvf /tmp/node-${NODEJS_VER}-linux-x64.tar.xz
sudo ln -s node-${NODEJS_VER}-linux-x64 nodejs
export PATH=/opt/nodejs/bin:$PATH
```

Also add that path export to your startup.
Node is properly installed if:
```
wiki@reference:/opt$ node --version
v12.18.0
```


#### Example Apache2 configuration
(Skip Apache2.  Run hmxweb directly on port 80)

##### Install Required Modules

sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod proxy_balancer
sudo a2enmod lbmethod_byrequests

##### Apache2 configuration


```
<VirtualHost *:80>
	ServerName www.christmascoder.com
	ServerAdmin webmaster@localhost

        ProxyPreserveHost On
        ProxyPass / http://127.0.0.1:8000/
        ProxyPassReverse / http://127.0.0.1:8000/

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

```

emacs /etc/apache2/sites-enabled/000-default.conf
service apache2 restart

#### Starting the servers

##### Test/Debug

npm run debug

http://localhost:8000

##### Deployment

rsync -avg hmxweb root@

In release mode, a process manager is good practice.  I use pm2:
```
npm install pm2 -g
```

Now set this to run:

```
pm2 start /root/hmxweb/bin/www --name "hmxweb"
```

Make pm2 autostart:

pm2 save
(as root) pm2 startup
