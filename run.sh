sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout localhost.key -out localhost.crt -config localhost.conf
sudo cp localhost.crt /etc/ssl/certs/localhost.crt
sudo cp localhost.key /etc/ssl/private/localhost.key

sudo cp nginx.conf /usr/local/etc/nginx/servers/default
sudo nginx -t
sudo nginx -s stop && sudo nginx
