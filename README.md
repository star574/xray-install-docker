# docker-nginx-xray
### 自用 基于docker 的nginx 反向代理到xray（vless-ws-tls）脚本
~~~shell
wget --no-check-certificate --no-cache --no-cookies  https://raw.github.com/star574/xray-install-docker/main/install.sh  && chmod a+rx install.sh
~~~
### 更新证书
~~~shell
acme.sh --renew -d domain --force 
~~~
