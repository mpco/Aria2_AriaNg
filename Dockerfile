FROM nginx:mainline

ENV ARIA2_TOKEN=xxxxxx

RUN set -x \
    && apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y sudo wget bash curl aria2 tar unzip procps


RUN wget -N --no-check-certificate https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip \
    && unzip master.zip \
    && rm master.zip \
    && mkdir -p /var/www \
    && mv AriaNg-DailyBuild-master /var/www/AriaNg


ADD conf.d /Aria_conf.d
RUN chmod +x Aria_conf.d/aria2.sh
RUN chown -R www-data:www-data /Aria_conf.d
RUN mv /Aria_conf.d/AriaNg.conf /etc/nginx/conf.d/default.conf

RUN mkdir /Aria_DL && chown -R www-data:www-data /Aria_DL
VOLUME /Aria_DL
VOLUME /Aria_conf.d   
EXPOSE 80
EXPOSE 6800
ENTRYPOINT ["/bin/sh", "/Aria_conf.d/aria2.sh"]