FROM nginx
LABEL author=star574
WORKDIR /root/
COPY config.json /usr/local/etc/xray/config.json
COPY web.conf /etc/nginx/conf.d/web.conf.init
COPY run.sh /root/run.sh
VOLUME  /usr/local/etc/xray
VOLUME  /etc/nginx
VOLUME  /usr/share/nginx/html
VOLUME  /usr/share/nginx/logs
EXPOSE 80
EXPOSE 443
ENTRYPOINT nginx -g "daemon off;"