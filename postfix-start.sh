#!/bin/bash

postmap /etc/postfix/sasl_passwd
cat /etc/ssl/certs/ca-certificates.crt | tee -a /etc/postfix/cacert.pem
/etc/init.d/postfix restart

