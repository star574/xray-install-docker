#!/bin/bash
echo "source /etc/profile" >> ~/.bashrc
apt -y install git nginx curl apt-utils cron

DOMAIN=$1
# xray
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u root \
    && bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install --without-geodata \
systemctl enable --now xray \

# html
git clone https://github.com/star574/camouflage_html.git \
mv camouflage_html/* /usr/share/nginx/html/ \
rm -rf camouflage_html

# acme.sh ssl
curl  https://get.acme.sh | sh -s email=my@example.com
source ~/.bashrc
mkdir -p  /etc/nginx/conf/ssl/${DOMAIN}
acme.sh  --issue  -d ${DOMAIN} --nginx
acme.sh --install-cert -d ${DOMAIN}   \
--key-file       /etc/nginx/conf/ssl/${DOMAIN}/${DOMAIN}.key  \
--fullchain-file /etc/nginx/conf/ssl/${DOMAIN}/fullchain.pem \