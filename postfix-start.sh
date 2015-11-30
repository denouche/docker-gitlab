#!/bin/bash

postmap /etc/postfix/sasl_passwd
cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem | tee -a /etc/postfix/cacert.pem
/etc/init.d/postfix restart

