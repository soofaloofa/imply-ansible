# imply-ansible

Deploy an Imply/Druid distribution using Ansible and Packer. Typical workflow
is to create an Amazon AMI using packer and ansible and then deploy that AMI using
ansible.

## Start

Edit vars.yml.example with your settings and place at vars.yml.

## Node Types

All commands to the Makefile can be specified using a node type. Each node type
is one of `master`, `data`, or `query` as defined
[here](http://imply.io/docs/latest/#packaging).

All of the following commands are suffixed with a node type depending on the
node image you are creating.

## Build an AMI

To build an AMI for running on Amazon EC2 using packer.

```bash
make build-ami-{{node-type}}
```

## Deploy an AMI

To deploy a built AMI to EC2.

```bash
make deploy-ami-{{node-type}}

```

## Local Testing

You can test the provisioning workflow using Vagrant:

```bash
vagrant up ## TODO: node type?
```
