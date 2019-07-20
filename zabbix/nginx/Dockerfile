FROM zabbix/zabbix-web-nginx-mysql:ubuntu-4.0.7
RUN apt-get update && \
        apt-get -y install fonts-ipafont && \
        update-alternatives --install /usr/share/zabbix/fonts/graphfont.ttf zabbix-frontend-font /usr/share/fonts/opentype/ipafont-gothic/ipagp.ttf 50 && \
        update-alternatives --set zabbix-frontend-font /usr/share/fonts/opentype/ipafont-gothic/ipagp.ttf