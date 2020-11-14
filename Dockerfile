FROM nginx:latest

ENV CLIENT_ID "c01e0c6c-b987-41b2-85ce-38e3c80a096e"
ENV CLIENT_ALTERID 64
ENV CLIENT_WSPATH "/ws"
ENV VER=4.32.1

ADD conf/nginx.conf /etc/nginx/
ADD conf/default.conf /etc/nginx/conf.d/
ADD entrypoint.sh /etc/

RUN apt-get update \
	&& apt-get install -y --no-install-recommends wget unzip

RUN wget --no-check-certificate -O v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v$VER/v2ray-linux-64.zip \
	&& unzip v2ray.zip \
	&& mv ./v2ray /usr/local/bin/ \
	&& mv ./v2ctl /usr/local/bin/ \
	&& chmod 777 /usr/local/bin/v2ctl \
	&& chmod 777 /usr/local/bin/v2ray \
	&& rm -rf v2ray.zip \
	&& rm -rf v2ray-linux-64

RUN chmod -R 777 /var/log/nginx /var/cache/nginx /var/run \
	&& chgrp -R 0 /etc/nginx \
	&& chmod -R g+rwx /etc/nginx \
	&& mkdir /var/log/v2ray \
	&& mkdir /etc/v2ray \
	&& chmod -R 777 /var/log/v2ray \
	&& chmod -R 777 /etc/v2ray \
	&& chmod 777 /etc/entrypoint.sh \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apt/*

RUN rm -rf /etc/localtime
ADD conf/localtime /etc/
ADD conf/config.json /etc/v2ray/
RUN rm -rf /usr/share/nginx/html/index.html
ADD src/index.html /usr/share/nginx/html/
ADD src/404.html /usr/share/nginx/html/

EXPOSE 8080
ENTRYPOINT ["/etc/entrypoint.sh"]
