FROM haproxy:1.5
MAINTAINER wikitolearn sysadmin@wikitolearn.org
RUN apt-get update
RUN apt-get install openssl --assume-yes && rm -f /var/cache/apt/archives/*deb
RUN apt-get install wget --assume-yes && rm -f /var/cache/apt/archives/*deb 
RUN wget -O /cloudflare.txt https://www.cloudflare.com/ips-v4  --no-check-certificate
RUN echo "172.17.0.0/16" >> /internal.txt
ADD ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
ADD ./kickstart.sh /
RUN chmod +x /kickstart.sh

CMD ["/kickstart.sh"]
