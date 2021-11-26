FROM nginx
LABEL author=star574
WORKDIR /root/
ENV DOMAIN ""
ENV UUID ""
ENV PATH ""
COPY config.json /usr/local/etc/xray/config.json
COPY web.conf /etc/nginx/conf.d/web.conf
COPY run.sh /root/run.sh
VOLUME  /usr/local/etc/xray
VOLUME  /etc/nginx
VOLUME  /usr/share/nginx/html
VOLUME  /usr/share/nginx/logs
EXPOSE 80
EXPOSE 443
RUN sh ./run.sh
CMD nginx -g 'daemon off;'