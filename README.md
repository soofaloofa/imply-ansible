# imply-ansible

An Ansible playbook for deploying an Imply/Druid cluster to AWS. Typical workflow
is to create an Amazon AMI using Packer and Ansible.

## Getting Started

Copy vars.sh.example to vars.sh.

vars.sh contains private variables like AWS identifiers and key names. There are
two sections to this file. One for the build stage and one for the deploy stage.
Build variables are used when creating the AMI. Deploy variables are used when
deploying the built AMI to AWS.

The file vars.yml contains additional variables you can set to control how the
images are built. Variables here are non-private.

## Build an AMI

AMIs are built using Packer. Packer will launch an EC2 instance, run the Ansible
provisioning script and package an AMI. You can specify the type of node to
build (master, data, or query) using the `NODE_TYPE` argument.

```bash
make NODE_TYPE=master build-ami
```

## Deploy an AMI

To deploy a built AMI to EC2, edit vars.sh with the configuration of where you
want to deploy your AMI.

```bash
make <ami> deploy-ami
```

## Provisioning Existing Servers

To provision or update existing servers on EC2, the servers must have AWS tags
of Role:Master, Role:Data, or Role:Query.

```bash
make NODE_TYPE=provision
```
