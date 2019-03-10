#!/usr/bin/env bash

set -eux -o

## Reference https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

## install docker
sudo yum update -y
sudo yum install -y docker

## install git
sudo yum install -y git

## start docker
sudo service docker start

## confirm docker is working
sudo usermod -a -G docker ec2-user

## Log out and log back in again to pick up the new docker group permissions.
