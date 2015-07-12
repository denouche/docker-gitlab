# docker-gitlab
A Gitlab image with Postfix configured to be able to use a Gmail SMTP

## Prepare Postfix configuration

See https://rtcamp.com/tutorials/linux/ubuntu-postfix-gmail-smtp/

## Run

```bash
docker run -t \
    --publish 8443:443 \
    --publish 8090:80 \
    --publish 2222:22 \
    --name gitlab \
    --restart always \
    --volume /home/denouche/volumes/gitlab/config:/etc/gitlab \
    --volume /home/denouche/volumes/gitlab/logs:/var/log/gitlab \
    --volume /home/denouche/volumes/gitlab/data:/var/opt/gitlab \
    --volume /home/denouche/volumes/gitlab/postfix/main.cf:/etc/postfix/main.cf \
    --volume /home/denouche/volumes/gitlab/postfix/sasl_passwd:/etc/postfix/sasl_passwd \
    denouche/gitlab
```

