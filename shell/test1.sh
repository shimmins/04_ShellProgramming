#!/bin/bash
# /var/www/html -> /web

# (1) make a directory
mkdir -p /web

# (2) /test/httpd.conf
sed -i 's;DocumentRoot "/var/www/html";DocumentRoot "web";' /test/httpd.conf

# (3) /test/httpd.conf
sed -i 's;<Directory "/var/www/html">;<Directory "/web">;' /test/httpd.conf

# (4) service restart
systemctl restart httpd