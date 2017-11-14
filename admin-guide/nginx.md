# NGINX configuration

IAM relies on NGINX for TLS termination and load balancing.

The example configuration below provides the minimal configuration needed to
have NGINX working as a reverse proxy for the IAM web application:

```nginx
server {
  listen        443 ssl;
  server_name   YOUR_HOSTNAME_HERE;
  access_log   /var/log/nginx/iam.access.log  combined;

  ssl on;
  ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
  ssl_certificate      /path/to/your/ssl/cert.pem;
  ssl_certificate_key  /path/to/your/ssl/key.pem;

  location / {
    proxy_pass              YOUR_BE_HOSTNAME_HERE:8080;
    proxy_set_header        X-Real-IP $remote_addr;
    proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header        X-Forwarded-Proto https;
    proxy_set_header        Host $http_host;
  }
```

## X.509 client authentication

IAM supports X.509 client certificate authentication. To enable X.509 client
certificate authentication use a configuration similar to the
[one](https://github.com/indigo-iam/iam/blob/master/docker/nginx/iam.conf) used
in the IAM development environment.

In particular, set `ssl_verify_client=Optional` and the following headers as
follows: 

```nginx
proxy_set_header        X-SSL-Client-Cert $ssl_client_cert;
proxy_set_header        X-SSL-Client-I-Dn $ssl_client_i_dn;
proxy_set_header        X-SSL-Client-S-Dn $ssl_client_s_dn;
proxy_set_header        X-SSL-Client-Serial $ssl_client_serial;
proxy_set_header        X-SSL-Client-V-Start $ssl_client_v_start;
proxy_set_header        X-SSL-Client-V-End   $ssl_client_v_end;
proxy_set_header        X-SSL-Client-Verify  $ssl_client_verify;
proxy_set_header        X-SSL-Protocol $ssl_protocol;
proxy_set_header        X-SSL-Server-Name $ssl_server_name;
```
