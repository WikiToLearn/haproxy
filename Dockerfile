FROM haproxy:1.6
ADD ./docker-apt-get-install.sh /docker-apt-get-install.sh
MAINTAINER wikitolearn sysadmin@wikitolearn.org

RUN /docker-apt-get-install.sh openssl
RUN /docker-apt-get-install.sh wget
ADD ./x-forwarded-for-acl /
ADD ./haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
ADD ./kickstart.sh /
RUN chmod +x /kickstart.sh

CMD ["/kickstart.sh"]
