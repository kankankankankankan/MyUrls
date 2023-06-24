#!/bin/sh
sed -i "s#http://example.com#https://$DOMAIN#g" ./public/index.html
sed -i '22s/.*/<img width="250" src="https:\/\/cdn.jsdelivr.net\/gh\/kankankankankankan\/MyUrls@master\/public\/logo.png"\/>/' ./public/index.html
./linux-amd64-myurls.service -domain $DOMAIN -conn $RDSHOST:$RDSPORT -passwd $RDSPASSWORD -ttl $TTL &
nginx -g 'daemon off;'
