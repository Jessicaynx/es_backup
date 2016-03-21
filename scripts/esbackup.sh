#!/bin/bash

lastsnapshot='backup-'`date --date='-1 day' +'%Y-%m-%d'`
name='backup-'`date +%Y-%m-%d`
# clean up old snapshot
curator --timeout 1000  --host 'elasticsearch-lb-798817490.ap-southeast-2.elb.amazonaws.com' --port 80 delete snapshots --repository 'esbackup_repository' --snapshot $lastsnapshot
# build new snapshot
curator --host 'elasticsearch-lb-798817490.ap-southeast-2.elb.amazonaws.com' --port 80 snapshot  --repository 'esbackup_repository' --name $name indices --regex '^logstash-.*'
wait
echo all jobs are done!