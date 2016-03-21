#!/bin/bash

#copy configuration scripts from AWS S3 and execute it
aws s3 cp s3://$S3_BUNDLE_NAME/setup-config.sh /chengguan/setup-config.sh \
&& chmod 755 /backup/setup-config.sh \
&& . /backup/setup-config.sh

aws s3 cp s3://$S3_KEY_FILE $NON_PROD_KEY_NAME
chmod 400 $NON_PROD_KEY_NAME

touch /var/log/cron.log
crond
crontab /chengguan/cronjob.conf
tail -f /var/log/cron.log