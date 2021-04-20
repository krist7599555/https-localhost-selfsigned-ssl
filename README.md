1. edit list of domain in localhost.conf alt-name

```conf
# example
[alt_names]
DNS.1   = local.insidethesandbox.studio
DNS.2   = api.local.insidethesandbox.studio
```

2. redirect domain to self ip in `/etc/host`

```conf
# example
127.0.0.1      	local.insidethesandbox.studio
127.0.0.1      	api.local.insidethesandbox.studio
```

3. proxy_port from `nginx.conf`
```conf
# example
server {
  listen 443 ssl http2;
  listen [::]:443 ssl http2;
  server_name api.local.insidethesandbox.studio;
  ssl_certificate /etc/ssl/certs/localhost.crt;
  ssl_certificate_key /etc/ssl/private/localhost.key;
  proxy_ssl_server_name on;
  ssl_protocols TLSv1.2 TLSv1.1 TLSv1;
  location / {
    proxy_pass http://127.0.0.1:8000;
  }
}
```

4. run `bash run.sh`
- will generate `localhost.crt` & `localhost.key`
- move ssl to right place
- apply config from `nginx.conf`

5. trust `localhost.crt`
- move `localhost.crt` to `Application > Keychain Access`
- double click on added record
- click `Always Trust`