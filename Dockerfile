FROM haproxy:1.5
MAINTAINER wikitolearn sysadmin@wikitolearn.org
ADD ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
