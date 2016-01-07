build-ami:
	packer build -var 'aws_access_key=${AWS_ACCESS_KEY}' -var 'aws_secret_key=${AWS_SECRET_KEY}' -var 'node_type=$(NODE)' packer.json

deploy-ami:
	ansible-playbook -i "localhost," -c local --extra-vars "ami=$(AMI)" deploy.yml
