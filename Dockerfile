FROM gitlab/gitlab-ce:latest

RUN echo "postfix postfix/main_mailer_type select Internet Site" | debconf-set-selections \
    && echo "postfix postfix/mailname string gitlab.leveugle.net" | debconf-set-selections \
    && apt-get install -y postfix

RUN apt-get install -y \
    mailutils \
    libsasl2-2 \
    ca-certificates \
    libsasl2-modules

RUN sed -i '/function entrypoint/a \
    postmap /etc/postfix/sasl_passwd \n\
    cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem | tee -a /etc/postfix/cacert.pem \n\
    /etc/init.d/postfix restart' /usr/local/bin/wrapper

CMD ["/usr/local/bin/wrapper"]

