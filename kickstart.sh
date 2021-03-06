#!/bin/bash

if [[ -f /certs/websrv.crt ]] ; then
    if [[ -f /certs/websrv.key ]] ; then
        cd /certs/
        cat websrv.crt websrv.key > /haproxy.pem
    fi
else
    if [[ ! -f /etc/ssl/private/haproxy.key ]] || [[ ! -f /etc/ssl/certs/haproxy.crt ]] ; then
        rm -f /etc/ssl/private/haproxy.key
        rm -f /etc/ssl/certs/haproxy.crt

        openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
        openssl rsa -passin pass:x -in server.pass.key -out /etc/ssl/private/haproxy.key
        rm server.pass.key
        openssl req -sha256 -new -key /etc/ssl/private/haproxy.key -out server.csr -subj "/C=IT/ST=Italia/L=Milano/O=WikiToLearn/OU=HAproxy IT Department/CN=www.wikitolearn.org"
        openssl x509 -req -sha256 -days 365000 -in server.csr -signkey /etc/ssl/private/haproxy.key -out /etc/ssl/certs/haproxy.crt
        rm server.csr
    fi

    cat /etc/ssl/certs/haproxy.crt /etc/ssl/private/haproxy.key > /haproxy.pem
fi

exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg
