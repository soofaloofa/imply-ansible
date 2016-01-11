build-ami:
	source vars.sh && packer build \
	-var 'node_type=$(NODE_TYPE)' \
	-var 'aws_access_key=${AWS_ACCESS_KEY}' \
	-var 'aws_secret_key=${AWS_SECRET_KEY}' \
	-var 'aws_source_ami=${BUILD_SOURCE_AMI}' \
	-var 'aws_subnet_id=${BUILD_SUBNET_ID}' \
	-var 'aws_security_group_id=${BUILD_SECURITY_GROUP}' \
	-var 'aws_region=${BUILD_REGION}' \
	-var 's3_bucket=${BUILD_S3_BUCKET}' \
	-var 's3_access_key=${BUILD_S3_ACCESS_KEY}' \
	-var 's3_secret_key=${BUILD_S3_SECRET_KEY}' \
	-var 'zookeeper_ips=${BUILD_ZOOKEEPER_IPS}' \
	-var 'mysql_ip=${BUILD_MYSQL_IP}' \
	-var 'mysql_dbname=${BUILD_MYSQL_DBNAME}' \
	-var 'mysql_user=${BUILD_MYSQL_USER}' \
	-var 'mysql_password=${BUILD_MYSQL_PASSWORD}' \
	packer.json

deploy-ami:
	source vars.sh && aws ec2 run-instances \
	--image-id $(AMI) \
	--count 1 \
	--instance-type t2.micro \
	--iam-instance-profile "Name=Druid" \
	--key-name ${DEPLOY_KEY_NAME} \
	--security-group-ids ${DEPLOY_SG} \
	--subnet-id ${DEPLOY_SUBNET_ID} \
	--region ${DEPLOY_REGION}
