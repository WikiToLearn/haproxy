FROM haproxy:1.6
MAINTAINER wikitolearn sysadmin@wikitolearn.org
RUN apt-get update && apt-get install openssl --assume-yes && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete
RUN apt-get update && apt-get install wget --assume-yes && rm -f /var/cache/apt/archives/*deb && find /var/lib/apt/lists/ -type f -delete
ADD ./cloudflare.txt /
ADD ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
ADD ./kickstart.sh /
RUN chmod +x /kickstart.sh

CMD ["/kickstart.sh"]
