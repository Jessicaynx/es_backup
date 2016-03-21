# elasticsearch auto-backup
This tool is used to back up elasticsearch data to S3 on a daily basis. 
Below components are integrated in this image.
1.	cronie (task scheduler, used to run the backup script on a configrable time duration)
2.	elasticsearch-cloud-aws/2.6.1 (An elasticsearch plugin, used to create s3 repository in elasticsearch) 
3.  curator (a python tool which takes snapshot of elasticsearch data)


# Reminder, below command can be used to restore the backup data
curl -XPOST "http://elasticsearch-lb-798817490.ap-southeast-2.elb.amazonaws.com/_snapshot/my_s3_repository/test/_restore?pretty=true&wait_for_completion=true"